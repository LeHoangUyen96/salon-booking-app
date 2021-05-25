import 'package:flutter/material.dart';
import 'package:salon_booking_app/constants/main_constants.dart';
import 'package:salon_booking_app/helpers/show_data_error.dart';

class BlackLogoScreen extends StatefulWidget {
  @override
  _BlackLogoScreenState createState() => _BlackLogoScreenState();
}

class _BlackLogoScreenState extends State<BlackLogoScreen> {
  Future<void> showMessage(){
    showDataError('Swipe right to continue');
  }
  @override
  Widget build(BuildContext context) {
    showMessage();
    return Scaffold(
      backgroundColor: Color(MainConstant.black),
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          child: Image.asset('assets/images/white-logo.png', fit: BoxFit.fitWidth,),
        ),
      ),
    );
  }
}
