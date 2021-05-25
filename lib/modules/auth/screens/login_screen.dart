import 'package:flutter/material.dart';
import 'package:salon_booking_app/constants/main_constants.dart';
import 'package:salon_booking_app/modules/auth/components/logo.dart';
import 'package:salon_booking_app/modules/auth/components/signin.dart';
import 'package:salon_booking_app/modules/auth/components/signup.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(MainConstant.black),
      body: DefaultTabController(
        length: 2,
        child: Column(children: <Widget>[
          Logo(),
          SizedBox(height: size.height * 0.05),
          Container(
            padding: EdgeInsets.only(left: 15.0, right: 15.0),
            constraints: BoxConstraints.expand(height: size.height * 0.08),
            child: TabBar(indicatorColor: Color(MainConstant.white), tabs: [
              Tab(
                  child: Text(
                "SIGNIN",
                style:
                    TextStyle(color: Color(MainConstant.white), fontSize: 22),
              )),
              Tab(
                  child: Text(
                "SIGNUP",
                style:
                    TextStyle(color: Color(MainConstant.white), fontSize: 22),
              )),
            ]),
          ),
          Expanded(
            child: Container(
              child: TabBarView(children: [
                Container(
                    padding: EdgeInsets.only(top: size.height * 0.05),
                    child: Signin()),
                Container(
                    padding: EdgeInsets.only(top: size.height * 0.05),
                    child: Signup()),
              ]),
            ),
          )
        ]),
      ),
    );
  }
}
