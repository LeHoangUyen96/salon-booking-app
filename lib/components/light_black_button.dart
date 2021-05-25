import 'package:flutter/material.dart';
import 'package:salon_booking_app/constants/main_constants.dart';

class LightBlackButton extends StatelessWidget {
  final String title;
  final Function onTap;
  final double margin;

  const LightBlackButton({
    Key key,
    this.title,
    this.onTap,
    this.margin = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        width: screenWidth,
        margin: EdgeInsets.symmetric(horizontal: margin),
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Color(MainConstant.lightBlack),
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: Text(
          title.toUpperCase(),
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Color(MainConstant.white),
          ),
        ),
      ),
    );
  }
}