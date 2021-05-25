import 'package:flutter/material.dart';
import 'package:salon_booking_app/constants/main_constants.dart';

class OtherCard extends StatelessWidget {
  final String name;
  final String cardImage;
  final String cardID;
  final double width;

  const OtherCard(
      {Key key, this.name, this.cardImage, this.cardID, this.width = 300})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(MainConstant.lightBlack),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: TextStyle(
                  color: Color(MainConstant.white),
                  fontSize: 12,
                  fontWeight: FontWeight.w200,
                ),
              ),
              Container(
                width: 30,
                height: 20,
                padding: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(cardImage),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            cardID,
            style: TextStyle(
              color: Color(MainConstant.white),
              fontSize: 12,
              fontWeight: FontWeight.w100,
            ),
          ),
        ],
      ),
    );
  }
}
