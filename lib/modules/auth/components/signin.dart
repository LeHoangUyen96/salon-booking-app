import 'package:flutter/material.dart';
import 'package:salon_booking_app/modules/auth/components/checkbox.dart';
import 'package:salon_booking_app/modules/auth/components/grey_textfield.dart';
import 'package:salon_booking_app/modules/auth/components/white_button.dart';
import 'package:salon_booking_app/modules/auth/constants/demo_user.dart';
import 'package:salon_booking_app/modules/auth/helpers/check_user.dart';
import 'package:salon_booking_app/modules/auth/redux/reducer.dart';
import 'package:salon_booking_app/redux/store.dart';

class Signin extends StatefulWidget {
  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  TextEditingController emailController =
      TextEditingController(text: DemoUser.email);
  TextEditingController passwordController =
      TextEditingController(text: DemoUser.password);
  final _formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                GreyTextField(
                  title: 'Email Address',
                  mycontroller: emailController,
                ),
                SizedBox(height: height * 0.02),
                GreyTextField(
                  title: 'Password',
                  mycontroller: passwordController,
                  obscureText: true,
                ),
                SizedBox(height: height * 0.02),
                CheckBoxSignin(),
                SizedBox(
                  height: height * 0.15,
                ),
                WhiteButton(
                  topTitle: 'SIGNIN',
                  bottomTitle: 'SIGNUP',
                  submit: onSuccess,
                )
              ],
            ),
          ),
        ));
  }

  void onSuccess() async {
    if (checkUser(emailController.text, passwordController.text)) {
      await store.dispatch(onLoginActions(
          emailController.text, passwordController.text, context));
    }
  }
}
