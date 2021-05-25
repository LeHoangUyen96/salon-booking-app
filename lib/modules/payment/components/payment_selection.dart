import 'package:flutter/material.dart';
import 'package:salon_booking_app/constants/main_constants.dart';

class PaymentSelection extends StatefulWidget {
  final bool isSelected;
  final String image;
  final String title;
  final String description;
  final Function onTap;

  const PaymentSelection({
    Key key,
    this.isSelected = false,
    this.image,
    this.title,
    this.description,
    this.onTap,
  }) : super(key: key);

  @override
  _PaymentSelectionState createState() => _PaymentSelectionState();
}

class _PaymentSelectionState extends State<PaymentSelection> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.only(bottom: 30),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => widget.onTap(),
            child: Container(
              width: 25,
              height: 25,
              padding: EdgeInsets.all(5),
              alignment: Alignment.center,
              child: widget.isSelected
                  ? Image.asset('assets/images/tick.png')
                  : Container(),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: widget.isSelected
                    ? Color(MainConstant.black)
                    : Color(MainConstant.lightGrey),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            width: screenWidth - 65,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(MainConstant.lightGrey),
            ),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Row(
              children: [
                Container(
                    width: 15, height: 15, child: Image.asset(widget.image)),
                SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                    Text(
                      widget.description,
                      style: TextStyle(
                          color: Color(MainConstant.lightBlack), fontSize: 9),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
