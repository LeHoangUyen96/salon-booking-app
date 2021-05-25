import 'package:flutter/material.dart';
import 'package:salon_booking_app/constants/main_constants.dart';

class Connect extends StatefulWidget {
  final String preText;
  final String suxText;
  final Icon icon;
  final Function open;
  Connect({
    this.preText,
    this.suxText,
    this.icon,
    this.open,
  });
  @override
  _ConnectState createState() => _ConnectState();
}

class _ConnectState extends State<Connect> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        widget.icon,
        Container(width: 10.0),
        Text(widget.preText,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
        Container(width: 10.0),
        TextButton(
            child: Text(widget.suxText,
                style:
                    TextStyle(fontSize: 16, color: Color(MainConstant.black))),
            onPressed: widget.open)
      ],
    );
  }
}
