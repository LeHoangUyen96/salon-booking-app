import 'package:flutter/material.dart';
import 'package:salon_booking_app/constants/main_constants.dart';

class GreyTextField extends StatefulWidget {
  final String title;
  final TextEditingController mycontroller;
  final Function(String) onChanged;
  final String Function(String) onValidate;
  final bool obscureText;
  final bool autoValidate;
  GreyTextField({
    @required this.title,
    this.mycontroller,
    this.onChanged,
    this.onValidate,
    this.obscureText = false,
    this.autoValidate = false,
  });

  @override
  _GreyTextFieldState createState() => _GreyTextFieldState();
}

class _GreyTextFieldState extends State<GreyTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        autovalidate: widget.autoValidate,
        controller: widget.mycontroller,
        validator: widget.onValidate,
        onChanged: widget.onChanged,
        obscureText: widget.obscureText,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                const Radius.circular(30.0),
              ),
            ),
            fillColor: Color(MainConstant.grey),
            filled: true,
            hintText: widget.title));
  }
}
