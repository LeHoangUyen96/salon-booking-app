import 'package:flutter/material.dart';
import 'package:salon_booking_app/constants/main_constants.dart';
import 'package:salon_booking_app/modules/dashboard/components/contact.dart';
import 'package:url_launcher/url_launcher.dart';

String url = 'http://sntsolutions.io/';

class ContactScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(MainConstant.black),
          leading: FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child:
                  Icon(Icons.arrow_back_ios, color: Color(MainConstant.white))),
          title: Text('Contact', style: TextStyle(fontSize: 22)),
        ),
        body: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Container(height: 40.0),
                Connect(
                  icon: Icon(Icons.person, color: Color(MainConstant.black)),
                  preText: 'Name Company',
                  suxText: 'SNT Solutions Co.,Ltd',
                ),
                Connect(
                  icon: Icon(Icons.phone, color: Color(MainConstant.black)),
                  preText: 'Phone',
                  suxText: '+84909168777',
                ),
                Connect(
                  icon: Icon(Icons.web, color: Color(MainConstant.black)),
                  preText: 'Website',
                  open: () {
                    openUrl();
                  },
                  suxText: url,
                ),
              ],
            )));
  }

  openUrl() {
    launch(url);
  }
}
