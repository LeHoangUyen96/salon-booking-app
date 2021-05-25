import 'package:flutter/material.dart';
import 'package:salon_booking_app/constants/main_constants.dart';
import 'package:salon_booking_app/modules/dashboard/components/banner.dart';
import 'package:salon_booking_app/modules/dashboard/components/category.dart';
import 'package:salon_booking_app/modules/dashboard/components/custom_drawer.dart';
import 'package:salon_booking_app/modules/dashboard/components/display_stylist.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Center(
          child: Image.asset(
            'assets/images/white-logo.png',
            height: 60,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.menu_sharp),
          onPressed: () {
            _scaffoldKey.currentState.openDrawer();
          },
        ),
        actions: [
          FlatButton(
              onPressed: () {
                Navigator.of(context).pushNamed('profile');
              },
              child: Image.asset(
                'assets/icons/white-user.png',
                height: 20,
                width: 20,
              )),
        ],
      ),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            DisplayBanner(),
            SizedBox(height: 20),
            DisplayCategories(),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'HAIR SPECIALIST',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    child: Text(
                      'view all >',
                      style: TextStyle(
                        color: Color(MainConstant.darkGrey),
                        fontSize: 10,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            DisplayStylist()
          ],
        ),
      ),
    );
  }
}
