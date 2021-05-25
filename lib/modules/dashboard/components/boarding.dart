import 'package:flutter/material.dart';
import 'package:salon_booking_app/components/dark_outline_button.dart';
import 'package:salon_booking_app/constants/main_constants.dart';

class Boarding extends StatefulWidget {
  final String image;
  final String title;
  final String body;
  final String buttonTitle;
  final VoidCallback onTapButton;
  final VoidCallback onSwipeRight;

  const Boarding({
    Key key,
    this.image,
    @required this.title,
    this.body,
    this.buttonTitle,
    this.onTapButton,
    this.onSwipeRight,
  }) : super(key: key);

  @override
  _BoardingState createState() => _BoardingState();
}

class _BoardingState extends State<Boarding> {
  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerMove: (moveEvent) {
        if (moveEvent.delta.dx < 0) {
          widget.onSwipeRight();
        }
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                Container(
                  height: 30.0,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 30,
                  ),
                  child: Image.asset(widget.image),
                ),
                Text(
                  widget.title ?? '',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    color: Color(MainConstant.black),
                  ),
                ),
                Container(
                  height: 10,
                ),
                Text(
                  widget.body ?? '',
                  style: TextStyle(
                    color: Color(MainConstant.darkGrey),
                    fontSize: 17,
                  ),
                  textAlign: TextAlign.center,
                ),
                Container(
                  height: 30,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 40,
            child: DarkOutlineButton(
              title: widget.buttonTitle?.toUpperCase(),
              onTap: () => widget.onTapButton(),
            ),
          )
        ],
      ),
    );
  }
}
