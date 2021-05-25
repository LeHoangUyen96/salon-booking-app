import 'package:flutter/material.dart';
import 'package:salon_booking_app/modules/services/components/appointments.dart';
import 'package:salon_booking_app/modules/services/constants/services.dart';

class ServiceScreen extends StatefulWidget {
  final String title;

  const ServiceScreen({Key key, this.title}) : super(key: key);
  @override
  _ServiceScreenState createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            child: Column(
              children: servicesConstant.entries
                  .map((e) => ServiceBlock(
                        service: e.value,
                      ))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
