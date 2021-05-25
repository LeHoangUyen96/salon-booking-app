import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:salon_booking_app/modules/wallet/components/mybalance_card.dart';
import 'package:salon_booking_app/modules/wallet/components/other_card.dart';
import 'package:salon_booking_app/modules/wallet/components/transection_block.dart';
import 'package:salon_booking_app/modules/wallet/constants/wallet.dart';
import 'package:salon_booking_app/modules/wallet/models/transections.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:salon_booking_app/redux/IStore.dart';

class _ViewModel extends Equatable {
  final Map<String, Transection> transections;
  final double money;

  _ViewModel({this.transections, this.money});

  @override
  List<Object> get props => [
        transections,
        money,
      ];
}

class MyWallet extends StatefulWidget {
  @override
  _MyWalletState createState() => _MyWalletState();
}

class _MyWalletState extends State<MyWallet> {
  Future<void> onInit(Store<AppState> store) async {}

  _ViewModel getConverter(Store<AppState> store) {
    return _ViewModel(
      money: store.state.wallet.money,
      transections: store.state.wallet.transections,
    );
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      onInit: (store) async {
        await onInit(store);
      },
      converter: (store) => getConverter(store),
      builder: (BuildContext context, _ViewModel viewModel) {
        final double width = (MediaQuery.of(context).size.width - 3 * 15) / 2;
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            centerTitle: true,
            title: Text('My Wallet'),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyBalanceCard(
                      cardID: cardID,
                      money: viewModel.money,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        OtherCard(
                          cardID: cardID,
                          cardImage: 'assets/images/visa.png',
                          name: 'Visa Card',
                          width: width,
                        ),
                        OtherCard(
                          cardID: cardID,
                          cardImage: 'assets/images/mastercard.png',
                          name: 'Master',
                          width: width,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Recent Transections',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Column(
                      children: viewModel.transections.entries
                          .map((transection) => TransectionBlock(
                                cost: transection.value.cost,
                                image: transection.value.serviceImage,
                                serviceName: transection.value.serviceName,
                                name: transection.value.name,
                                time: transection.value.dateTime,
                                payment: transection.value.selectedPaymentMethod,
                              ))
                          .toList(),
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
