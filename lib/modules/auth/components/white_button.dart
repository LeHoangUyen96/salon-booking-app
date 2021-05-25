import 'package:flutter/material.dart';
import 'package:salon_booking_app/constants/main_constants.dart';

class WhiteButton extends StatelessWidget {
  final String topTitle;
  final String bottomTitle;
  final VoidCallback submit;
  WhiteButton({@required this.topTitle, this.bottomTitle, this.submit});
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        width: MediaQuery.of(context).size.width * 0.35,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(40)),
            color: Color(MainConstant.white)),
        child: Center(
            child: TextButton(
          onPressed: submit,
          child: Text(
            topTitle,
            style: TextStyle(
              color: Color(MainConstant.black),
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        )),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Don't have an account?",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w100,
                color: Color(MainConstant.white)),
          ),
          InkWell(
            child: Text(
              bottomTitle,
              style: TextStyle(
                  color: Color(MainConstant.white),
                  fontSize: 14,
                  fontWeight: FontWeight.w700),
            ),
          )
        ],
      ),
    ]);
  }
}
