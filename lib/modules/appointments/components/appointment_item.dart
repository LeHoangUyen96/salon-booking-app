import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:salon_booking_app/components/black_button.dart';
import 'package:salon_booking_app/constants/main_constants.dart';

class AppointmentItem extends StatefulWidget {
  final Function() onTapConfirm;
  final DateTime dateTime;
  final TimeOfDay time;
  final String stylistImage;
  final String serviceName;
  final String stylistName;
  final double cost;

  const AppointmentItem({
    Key key,
    @required this.dateTime,
    @required this.time,
    @required this.stylistImage,
    @required this.serviceName,
    @required this.stylistName,
    @required this.cost,
    this.onTapConfirm,
  }) : super(key: key);

  @override
  _AppointmentItemState createState() => _AppointmentItemState();
}

class _AppointmentItemState extends State<AppointmentItem> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(MainConstant.lightGrey0),
          ),
          margin: EdgeInsets.only(bottom: 15),
          padding: EdgeInsets.only(left: 30, right: 15, top: 10, bottom: 10),
          height: 110,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${DateFormat('dd MMM yyyy, EEEE').format(widget.dateTime)} \nat ${widget.time.format(context)}'
                        .toUpperCase(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                  ),
                  BlackButton(
                    title: 'CONFIRM',
                    onTap: () => widget.onTapConfirm(),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 2,
                              color: Color(MainConstant.black),
                            ),
                            image: DecorationImage(
                                image: AssetImage(widget.stylistImage),
                                fit: BoxFit.fitHeight)),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.serviceName.toUpperCase(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                          Text(
                            'WITH ${widget.stylistName.toUpperCase()}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 8,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Text(
                    '\$ ${NumberFormat("#,##0.00", "en_US").format(widget.cost)}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        Positioned(
          child: Container(
            height: 110,
            width: 10,
            decoration: BoxDecoration(
              color: Color(MainConstant.black),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
            ),
          ),
        )
      ],
    );
  }
}
