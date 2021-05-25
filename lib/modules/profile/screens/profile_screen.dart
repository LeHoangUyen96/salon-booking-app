import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:salon_booking_app/components/light_black_button.dart';
import 'package:salon_booking_app/constants/main_constants.dart';
import 'package:salon_booking_app/modules/profile/components/avatar.dart';
import 'package:salon_booking_app/modules/profile/components/info_user.dart';
import 'package:salon_booking_app/redux/IStore.dart';
import 'package:redux/redux.dart';

class ViewModel extends Equatable {
  final String fullName;
  final String phone;
  final String email;
  ViewModel({
    this.fullName,
    this.phone,
    this.email,
  });
  @override
  List<Object> get props => [
        fullName,
        phone,
        email,
      ];
}

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Future<void> onInit(Store<AppState> store) async {}
  ViewModel converter(Store<AppState> store) {
    return ViewModel(
      fullName: store?.state?.userInfo?.fullName,
      email: store?.state?.userInfo?.email,
      phone: store?.state?.userInfo?.phone,
    );
  }

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.height;
    return StoreConnector<AppState, ViewModel>(
        onInit: (Store<AppState> store) async => await onInit(store),
        converter: (Store<AppState> store) => converter(store),
        builder: (context, viewModel) {
          return Scaffold(
              key: _scaffoldKey,
              appBar: AppBar(
                centerTitle: true,
                title: Text("PROFILE"),
              ),
              body: ListView(children: [
                Avatar(),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: size * 0.02),
                        Text(
                          'Basic Info',
                          style: TextStyle(
                              color: Color(MainConstant.black),
                              fontSize: 22,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: size * 0.02,
                        ),
                        Container(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            width: size * 0.4,
                            child: Column(children: [
                              InfoUser(
                                  title: 'FullName :',
                                  text: viewModel.fullName),
                              InfoUser(title: 'Email :', text: viewModel.email),
                              InfoUser(title: 'Phone :', text: viewModel.phone)
                            ])),
                        SizedBox(height: size * 0.04),
                        LightBlackButton(
                          title: 'EDIT',
                          onTap: () =>
                              Navigator.of(context).pushNamed('edit_profile'),
                        ),
                        SizedBox(height: size * 5),
                      ],
                    )),
              ]));
        });
  }
}
