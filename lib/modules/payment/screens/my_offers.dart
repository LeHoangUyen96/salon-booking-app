import 'package:flutter/material.dart';
import 'package:salon_booking_app/components/light_black_button.dart';
import 'package:salon_booking_app/constants/main_constants.dart';
import 'package:salon_booking_app/helpers/show_data_error.dart';

class MyOffersScreen extends StatefulWidget {
  final int sale;
  final String title;
  final String detail;

  const MyOffersScreen(
      {Key key, this.sale = 10, this.title = '', this.detail = ''})
      : super(key: key);
  @override
  _MyOffersScreenState createState() => _MyOffersScreenState();
}

class _MyOffersScreenState extends State<MyOffersScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text('My Offer'),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.center,
                  width: screenWidth - 30,
                  height: screenWidth / 2,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('assets/images/voucher.png'),
                    fit: BoxFit.fitWidth,
                  )),
                  child: Column(
                    children: [
                      SizedBox(
                        height: screenWidth * 0.16,
                      ),
                      Text(
                        'UP TO',
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Color(MainConstant.white),
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '${widget.sale}% OFF',
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Color(MainConstant.white),
                          fontSize: 25,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'ON FIRST ${widget.title.toUpperCase()}',
                        style: TextStyle(
                          fontWeight: FontWeight.w100,
                          color: Color(MainConstant.white),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  'NOW GET UPTO ${widget.sale}% OFF',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  widget.detail,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(MainConstant.grey),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                LightBlackButton(
                  title: 'get this offer',
                  onTap: () => showDataError('This feature is coming soon ...'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
