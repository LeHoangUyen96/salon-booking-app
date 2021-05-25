
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<void> showDataError(String message) async {
  await Fluttertoast.showToast(
    msg: message,
    backgroundColor: Colors.white,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 2
  );
}
