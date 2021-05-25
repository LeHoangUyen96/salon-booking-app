import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:salon_booking_app/constants/main_constants.dart';
import 'package:salon_booking_app/redux/IStore.dart';
import 'package:redux/redux.dart';

class ViewModel extends Equatable {
  final String fullName;
  final String image;
  ViewModel({this.fullName, this.image});

  @override
  List<Object> get props => [fullName, this.image];
}

Future<void> onInit(store) async {}

ViewModel converter(Store<AppState> store) {
  return ViewModel(
    fullName: store?.state?.userInfo?.fullName,
    image: store?.state?.userInfo?.image,
  );
}

class Avatar extends StatefulWidget {
  @override
  _AvatarState createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ViewModel>(
        onInit: (store) async => await onInit(store),
        converter: (Store<AppState> store) => converter(store),
        builder: (BuildContext context, ViewModel viewModel) {
          return Container(
              color: Color(MainConstant.lightBlack),
              height: MediaQuery.of(context).size.height * 0.2,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                          image: AssetImage(viewModel.image),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    Text(
                      viewModel.fullName,
                      style: TextStyle(
                          color: Color(MainConstant.white), fontSize: 16),
                    )
                  ]));
        });
  }
}
