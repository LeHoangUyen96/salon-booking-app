import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:salon_booking_app/components/black_button.dart';
import 'package:salon_booking_app/constants/main_constants.dart';
import 'package:salon_booking_app/modules/appointments/redux/actions.dart';
import 'package:salon_booking_app/modules/services/models/appointment.dart';
import 'package:salon_booking_app/redux/store.dart';

class ServiceBlock extends StatefulWidget {
  final Service service;

  const ServiceBlock({Key key, @required this.service}) : super(key: key);

  @override
  _ServiceBlockState createState() => _ServiceBlockState();
}

class _ServiceBlockState extends State<ServiceBlock> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(MainConstant.lightGrey),
      ),
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    widget.service.image,
                  ),
                  fit: BoxFit.fitHeight,
                ),
                borderRadius: BorderRadius.circular(5)),
          ),
          Container(
            width: screenWidth - 240,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.service.name,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  widget.service.location,
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w200,
                      color: Color(MainConstant.lightBlack).withOpacity(0.5)),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Timings: ${widget.service.from.format(context)} - ${widget.service.to.format(context)}',
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w100),
                ),
                SizedBox(
                  height: 5,
                ),
                RatingBar.builder(
                  initialRating: widget.service.rating,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 12,
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
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BlackButton(
                title: 'Book Now',
                onTap: () async {
                  await store.dispatch(SetTempServiceID(widget.service.id));
                  Navigator.of(context).pushNamed('book_appointment');
                },
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '\$ ${widget.service.price.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ],
      ),
    );
  }
}
