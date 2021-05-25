import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:salon_booking_app/constants/main_constants.dart';

class MyBalanceCard extends StatefulWidget {
  final double money;
  final String cardID;

  const MyBalanceCard({
    Key key,
    this.money,
    this.cardID,
  }) : super(key: key);
  @override
  _MyBalanceCardState createState() => _MyBalanceCardState();
}

class _MyBalanceCardState extends State<MyBalanceCard> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth,
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(MainConstant.lightBlack),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'My Balance',
                    style: TextStyle(
                      color: Color(MainConstant.white),
                      fontSize: 12,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '\$ ${NumberFormat("#,##0.00", "en_US").format(widget.money)}',
                    style: TextStyle(
                      color: Color(MainConstant.white),
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
              Container(
                width: 50,
                height: 50,
                padding: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/mastercard.png'),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Master Card',
                style: TextStyle(
                  color: Color(MainConstant.white),
                  fontSize: 12,
                  fontWeight: FontWeight.w100,
                ),
              ),
              Text(
                widget.cardID,
                style: TextStyle(
                  color: Color(MainConstant.white),
                  fontSize: 12,
                  fontWeight: FontWeight.w100,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
