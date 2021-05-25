import 'package:flutter/material.dart';
import 'package:salon_booking_app/constants/main_constants.dart';

class BlackButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final double verticalPadding;
  final double fontSize;
  final double horizontalPadding;
  final double circular;
  final double width;

  const BlackButton(
      {Key key,
      @required this.title,
      this.onTap,
      this.verticalPadding = 8.0,
      this.horizontalPadding = 25.0,
      this.circular = 15.0,
      this.fontSize = 12.0,
      this.width})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        width: width,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
          vertical: verticalPadding,
          horizontal: horizontalPadding,
        ),
        child: Text(
          title,
          style: TextStyle(color: Color(MainConstant.white), fontSize: 12),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(circular),
          color: Color(MainConstant.black),
        ),
      ),
    );
  }
}
