import 'package:flutter/material.dart';
import 'package:salon_booking_app/constants/main_constants.dart';

class CheckBoxSignin extends StatefulWidget {
  @override
  _CheckBoxSigninState createState() => _CheckBoxSigninState();
}

class _CheckBoxSigninState extends State<CheckBoxSignin> {
  bool isCheck = true;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Checkbox(
                checkColor: Color(MainConstant.black),
                activeColor: Color(MainConstant.white),
                value: isCheck,
                onChanged: (bool value) {
                  setState(() {
                    isCheck = value;
                  });
                }),
            Text(
              'Remember me',
              style: TextStyle(color: Color(MainConstant.white)),
            ),
            Spacer(),
            Text('Forgot Password?',
                style: TextStyle(color: Color(MainConstant.white)))
          ],
        ));
  }
}
