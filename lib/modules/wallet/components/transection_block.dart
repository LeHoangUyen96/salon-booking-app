import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:salon_booking_app/constants/main_constants.dart';
import 'package:salon_booking_app/modules/payment/constants/payment_method_list.dart';

class TransectionBlock extends StatelessWidget {
  final String image;
  final String name;
  final String serviceName;
  final double cost;
  final DateTime time;
  final String payment;

  const TransectionBlock({
    Key key,
    this.image,
    this.name,
    this.serviceName,
    this.cost,
    this.time,
    this.payment,
  }) : super(key: key);

  String getPayMethod() {
    if (methodList[payment] == null) {
      return 'Unknow Method';
    }
    return methodList[payment].description;
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width - 50 - 70;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Color(MainConstant.lightGrey),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.fitHeight,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            width: width,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                    Text(
                      '\$ ${cost.toStringAsFixed(2)}',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '$serviceName - ${getPayMethod()}',
                      style:
                          TextStyle(fontWeight: FontWeight.w100, fontSize: 12),
                    ),
                    Text(
                      DateFormat('dd MMMM, yyyy').format(time),
                      style:
                          TextStyle(fontWeight: FontWeight.w100, fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
