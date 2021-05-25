import 'package:flutter/material.dart';
import 'package:salon_booking_app/modules/auth/components/grey_textfield.dart';
import 'package:salon_booking_app/modules/auth/components/validate.dart';
import 'package:salon_booking_app/modules/auth/components/white_button.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool autovalidate = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
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
                    autoValidate: autovalidate,
                    mycontroller: emailController,
                    onValidate: (String value) {
                      return validateEmail(emailController.text);
                    },
                  ),
                  SizedBox(height: height * 0.01),
                  GreyTextField(
                    title: 'Password',
                    autoValidate: autovalidate,
                    mycontroller: passwordController,
                    onValidate: (String value) {
                      return validatePassword(
                        passwordController.text,
                      );
                    },
                  ),
                  SizedBox(height: height * 0.01),
                  GreyTextField(
                    title: 'Confirm Password',
                    autoValidate: autovalidate,
                    mycontroller: confirmPasswordController,
                    onValidate: (String value) {
                      return validateConfirmPassword(
                          passwordController.text, value);
                    },
                  ),
                  SizedBox(
                    height: height * 0.1,
                  ),
                  WhiteButton(
                    topTitle: 'SIGNUP',
                    bottomTitle: 'SIGNIN',
                    submit: onSuccess,
                  )
                ],
              )),
        ));
  }

  void toogleAutoValidate() {
    setState(() {
      autovalidate = true;
    });
  }

  void onSuccess() {
    toogleAutoValidate();
    bool check = _formKey.currentState.validate();
    if (check == true) {
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text('Sign up Success')));
    }
  }
}
