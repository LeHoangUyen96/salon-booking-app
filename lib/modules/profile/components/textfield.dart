import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InfoTextField extends StatefulWidget {
  final String title;
  final String text;
  final String placeholder;
  final bool isShowPassword;
  final bool autoValidate;
  final TextInputType keyboardEmailAddress;
  final TextEditingController myController;
  final String Function(String) onValidate;
  InfoTextField(
      {@required this.title,
      this.text,
      this.isShowPassword = false,
      this.autoValidate = false,
      this.placeholder,
      this.keyboardEmailAddress,
      this.myController,
      this.onValidate});

  @override
  _InfoTextFieldState createState() => _InfoTextFieldState();
}

class _InfoTextFieldState extends State<InfoTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidate: widget.autoValidate,
      validator: widget.onValidate,
      controller: widget.myController,
      keyboardType: widget.keyboardEmailAddress,
      obscureText: widget.isShowPassword,
      decoration: InputDecoration(
        labelText: widget.title,
        hintText: widget.placeholder,
      ),
    );
  }
}
