import 'package:flutter/material.dart';
import 'package:salon_booking_app/constants/main_constants.dart';
import 'package:salon_booking_app/modules/dashboard/constants/stylist.dart';

class StylistBooking extends StatefulWidget {
  final String image;
  final String name;
  final bool isSelected;

  const StylistBooking({Key key, this.image, this.name, this.isSelected})
      : super(key: key);
  @override
  _StylistBookingState createState() => _StylistBookingState();
}

class _StylistBookingState extends State<StylistBooking> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      padding: EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color(MainConstant.grey),
            blurRadius: 8,
            spreadRadius: 1,
            offset: Offset(1, 3),
          )
        ],
        color: widget.isSelected
            ? Color(MainConstant.black)
            : Color(MainConstant.white),
      ),
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(widget.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            widget.name.toUpperCase(),
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: widget.isSelected
                  ? Color(MainConstant.white)
                  : Color(MainConstant.black),
            ),
          ),
        ],
      ),
    );
  }
}

class SelectStylist extends StatefulWidget {
  final String selectedStylistID;
  final Function(String) onChanged;

  const SelectStylist({Key key, this.selectedStylistID, this.onChanged})
      : super(key: key);

  @override
  _SelectStylistState createState() => _SelectStylistState();
}

class _SelectStylistState extends State<SelectStylist> {
  bool isSelected(String stylistID) {
    if (stylistID == widget.selectedStylistID) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: stylists.entries
            .map((e) => GestureDetector(
                  onTap: () => widget.onChanged(e.key),
                  child: StylistBooking(
                    image: e.value.image,
                    isSelected: isSelected(e.key),
                    name: e.value.name,
                  ),
                ))
            .toList(),
      ),
    );
  }
}
