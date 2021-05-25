import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:salon_booking_app/constants/main_constants.dart';
import 'package:salon_booking_app/modules/dashboard/constants/stylist.dart';
import 'package:salon_booking_app/modules/dashboard/models/stylist.dart';

class DisplayStylist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Row(
            children: stylists.entries.map((element) {
          return StylistBlock(
            stylist: element.value,
          );
        }).toList()),
      ),
    );
  }
}

class StylistBlock extends StatelessWidget {
  final double width;
  final Stylist stylist;

  const StylistBlock({Key key, this.width = 120, this.stylist})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: width,
            height: width / 2 * 3,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color(MainConstant.grey),
                  blurRadius: 3,
                  offset: Offset(1, 4),
                ),
              ],
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: AssetImage(stylist.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 7,
          ),
          Text(
            stylist.name.toUpperCase(),
            style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          RatingBar.builder(
            initialRating: stylist.rating,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemSize: 10,
            tapOnlyMode: true,
            itemPadding: EdgeInsets.zero,
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: Color(MainConstant.black),
            ),
            ignoreGestures: true,
            onRatingUpdate: (rating) {
              print(rating);
            },
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Icon(
                Icons.phone,
                size: 12,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                stylist.phoneNumber,
                style: TextStyle(fontSize: 10),
              ),
            ],
          )
        ],
      ),
    );
  }
}
// class StarRating extends StatelessWidget {
//   final int number;

//   final Color fullColor;
//   final Color halfColor;

//   const StarRating({Key key, this.number, this.fullColor, this.halfColor}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(children: [],);
//   }
// }
