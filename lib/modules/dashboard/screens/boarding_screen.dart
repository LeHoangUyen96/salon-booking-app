import 'package:flutter/material.dart';
import 'package:salon_booking_app/modules/dashboard/components/boarding.dart';
import 'package:salon_booking_app/modules/dashboard/constants/boarding_content.dart';
import 'package:salon_booking_app/modules/dashboard/screens/black_logo_screen.dart';

class BoardingScreen extends StatefulWidget {
  @override
  _BoardingScreenState createState() => _BoardingScreenState();
}

class _BoardingScreenState extends State<BoardingScreen> {
  PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
  }

  void buildAction(String action) {
    if (action == 'done') {
      Navigator.of(context).pushNamed('login');

      return;
    }
    pageController.nextPage(
        duration: Duration(milliseconds: 200), curve: Curves.easeIn);
  }

  List<Widget> buildPages() {
    return boardingContent.map((boarding) {
      if (boarding['title'] == 'logo') {
        return BlackLogoScreen();
      }
      return Boarding(
        title: boarding['title'],
        image: boarding['image'],
        body: boarding['content'],
        buttonTitle: boarding['action'],
        onSwipeRight: () => buildAction(boarding['action']),
        onTapButton: () => buildAction(boarding['action']),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: buildPages(),
      ),
    );
  }
}
