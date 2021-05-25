import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:salon_booking_app/components/light_black_button.dart';
import 'package:salon_booking_app/constants/main_constants.dart';
import 'package:salon_booking_app/modules/appointments/redux/reducers.dart';
import 'package:salon_booking_app/modules/payment/components/payment_selection.dart';
import 'package:salon_booking_app/modules/payment/constants/payment_method_list.dart';
import 'package:salon_booking_app/modules/wallet/redux/actions.dart';
import 'package:salon_booking_app/redux/IStore.dart';
import 'package:salon_booking_app/redux/store.dart';
import 'package:redux/redux.dart';

class _ViewModel extends Equatable {
  final String selectedPayment;

  _ViewModel({this.selectedPayment});

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  Future<void> nextAction(BuildContext context) async {
    await store.dispatch((context));
  }

  bool isSelected(String key, String selectedKey) {
    if (key == selectedKey) {
      return true;
    }
    return false;
  }

  Future<void> onSelectedPaymentChanged(String payment) async {
    await store.dispatch(SetSelectedPaymentMethod(payment));
  }

  Future<void> onInit(Store<AppState> store) async {}

  _ViewModel getConverter(Store<AppState> store) {
    return _ViewModel(
      selectedPayment: store.state.wallet.selectedPaymentMethod,
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenheight = MediaQuery.of(context).size.height;
    return StoreConnector<AppState, _ViewModel>(
      onInit: (store) async {
        await onInit(store);
      },
      converter: (store) => getConverter(store),
      builder: (BuildContext context, _ViewModel viewModel) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('PAYMENT'),
          ),
          backgroundColor: Colors.white,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'PAYMENT METHOD',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Select one of the payment methods',
                      style: TextStyle(
                          color: Color(
                            MainConstant.darkGrey,
                          ),
                          fontSize: 12),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: methodList.entries
                          .map((e) => PaymentSelection(
                                description: e.value.description,
                                image: e.value.image,
                                isSelected: isSelected(
                                    e.key, viewModel.selectedPayment),
                                title: e.value.name,
                                onTap: () => onSelectedPaymentChanged(e.key),
                              ))
                          .toList(),
                    ),
                    SizedBox(
                      height: screenheight - 500,
                    ),
                    LightBlackButton(
                      onTap: () => nextAction(context),
                      title: 'next',
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
