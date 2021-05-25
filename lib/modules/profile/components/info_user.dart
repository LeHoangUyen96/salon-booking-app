import 'package:flutter/material.dart';

class InfoUser extends StatefulWidget {
  final String title;
  final String text;
  InfoUser({
    @required this.title,
    this.text,
  });
  @override
  _InfoUserState createState() => _InfoUserState();
}

class _InfoUserState extends State<InfoUser> {
  @override
  Widget build(BuildContext context) {
    return Table(children: [
      TableRow(children: [
        Text(widget.title, style: TextStyle(fontSize: 18)),
        Text(widget.text, style: TextStyle(fontSize: 18))
      ]),
    ]);
  }
}
