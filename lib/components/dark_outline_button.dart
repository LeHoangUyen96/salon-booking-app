import 'package:flutter/material.dart';
import 'package:salon_booking_app/constants/main_constants.dart';

class DarkOutlineButton extends StatefulWidget {
  final Color outlineColor;
  final Color backgroundColor;
  final String title;
  final VoidCallback onTap;

  const DarkOutlineButton({
    Key key,
    this.outlineColor,
    this.backgroundColor,
    @required this.title,
    this.onTap,
  }) : super(key: key);

  @override
  _DarkOutlineButtonState createState() => _DarkOutlineButtonState();
}

class _DarkOutlineButtonState extends State<DarkOutlineButton> {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      
      child: Text(
        widget.title,
        style: TextStyle(
          color: widget.outlineColor ?? Color(MainConstant.black),
          fontSize: 18,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w900,
        ),
      ),
      onPressed: () => widget.onTap(),
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(50))),
        backgroundColor: widget.backgroundColor ?? Colors.transparent,
        side: BorderSide(color: Color(MainConstant.black), width: 4),
      ),
    );
  }
}
