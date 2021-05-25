import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:salon_booking_app/components/light_black_button.dart';
import 'package:salon_booking_app/constants/main_constants.dart';
import 'package:salon_booking_app/modules/auth/components/validate.dart';
import 'package:salon_booking_app/modules/profile/components/avatar.dart';
import 'package:salon_booking_app/modules/profile/components/textfield.dart';
import 'package:salon_booking_app/modules/profile/redux/reducer.dart';
import 'package:salon_booking_app/redux/IStore.dart';
import 'package:redux/redux.dart';
import 'package:salon_booking_app/redux/store.dart';

class ViewModel extends Equatable {
  final String fullName;
  final String phone;
  final String email;
  final String password;
  ViewModel({
    this.fullName,
    this.phone,
    this.email,
    this.password,
  });
  @override
  List<Object> get props => [
        fullName,
        phone,
        email,
        password,
      ];
}

class EditProfile extends StatefulWidget {
  Future<void> onInit(Store<AppState> store) async {}
  ViewModel converter(Store<AppState> store) {
    return ViewModel(
      fullName: store?.state?.userInfo?.fullName,
      email: store?.state?.userInfo?.email,
      password: store?.state?.userInfo?.password,
      phone: store?.state?.userInfo?.phone,
    );
  }

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Future<void> onInit(Store<AppState> store) async {}
  final scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> onChangeInfo() async {
    await store.dispatch(setUserInfoActions(
      fullName: fullNameController.text,
      phone: phoneNumberController.text,
      email: emailController.text,
      password: passwordController.text,
    ));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.height * 0.01;
    return StoreConnector<AppState, ViewModel>(
        onInit: (Store<AppState> store) async => await onInit(store),
        converter: (store) {
          return ViewModel(
            fullName: store?.state?.userInfo?.fullName ?? '',
            phone: store?.state?.userInfo?.phone ?? '',
            email: store?.state?.userInfo?.email ?? '',
            password: store?.state?.userInfo?.password ?? '',
          );
        },
        builder: (context, viewModel) {
          return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Text('EDIT PROFILE'),
              ),
              body: Form(
                  key: scaffoldKey,
                  child: ListView(children: [
                    Avatar(),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: size * 2),
                            Text(
                              'Basic Info',
                              style: TextStyle(
                                  color: Color(MainConstant.black),
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500),
                            ),
                            InfoTextField(
                              title: 'FullName',
                              placeholder: viewModel.fullName,
                              myController: fullNameController,
                            ),
                            InfoTextField(
                              title: 'Email',
                              placeholder: viewModel.email,
                              myController: emailController,
                              onValidate: (String value) {
                                return validateEmail(emailController.text);
                              },
                            ),
                            InfoTextField(
                              title: 'Phone Number',
                              placeholder: viewModel.phone,
                              keyboardEmailAddress: TextInputType.phone,
                              myController: phoneNumberController,
                            ),
                            InfoTextField(
                              title: 'Password',
                              myController: passwordController,
                              isShowPassword: true,
                              onValidate: (String value) {
                                return validatePassword(
                                    passwordController.text);
                              },
                            ),
                            SizedBox(height: size * 8),
                            LightBlackButton(
                              onTap: () => onChangeInfo(),
                              title: 'SAVE',
                            ),
                            SizedBox(height: size * 5),
                          ],
                        )),
                  ])));
        });
  }
}
