import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:salon_booking_app/constants/main_constants.dart';

class WeekCalendar extends StatefulWidget {
  final DateTime selectedDate;
  final Function(DateTime) onChangeSelectedDay;

  const WeekCalendar(
      {Key key,
      @required this.selectedDate,
      @required this.onChangeSelectedDay})
      : super(key: key);

  @override
  _WeekCalendarState createState() => _WeekCalendarState();
}

class _WeekCalendarState extends State<WeekCalendar> {
  //ThisWWeekCalendar has Mon is the first day of week

  DateTime today = DateTime.now();
  DateTime currentDate;

  @override
  void initState() {
    super.initState();
    setState(() {
      currentDate = DateTime(today.year, today.month, today.day);
    });
  }

  bool isSelectedDay(DateTime dateTime) {
    if (dateTime == widget.selectedDate) {
      return true;
    }
    return false;
  }

  List<DateTime> getWeekDays(DateTime dateTime) {
    final int day = dateTime.weekday;
    final mon = dateTime.subtract(Duration(days: day - 1));
    final List<DateTime> list = [
      mon,
      mon.add(Duration(days: 1)),
      mon.add(Duration(days: 2)),
      mon.add(Duration(days: 3)),
      mon.add(Duration(days: 4)),
      mon.add(Duration(days: 5)),
      mon.add(Duration(days: 6)),
    ];
    return list;
  }

  List<DateTime> currentWeek = [];
  void onTapBack() {
    //when press back button the currentdate will return the mon of previous week
    setState(() {
      currentDate = currentDate.subtract(Duration(days: 7));
    });
  }

  void onTapNext() {
    //when press next button the currentdate will return the mon of next week
    setState(() {
      currentDate = currentDate.add(Duration(days: 7));
    });
  }

  String getMonthTitle() {
    if (widget.selectedDate == null ||
        widget.selectedDate
                .subtract(Duration(days: widget.selectedDate.weekday - 1)) !=
            currentDate.subtract(Duration(days: currentDate.weekday - 1))) {
      //when no date is selected, or the current day is in a different week from the selected date
      return '${DateFormat('MMMM').format(currentDate)}, ${currentDate.year}';
    }
    return '${DateFormat('MMMM').format(widget.selectedDate)}, ${widget.selectedDate.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      decoration: BoxDecoration(
          color: Color(
        MainConstant.lightBlack,
      )),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                child: Icon(
                  Icons.arrow_back_ios_outlined,
                  color: Color(MainConstant.white),
                  size: 16,
                ),
                onTap: () => onTapBack(),
              ),
              Text(
                getMonthTitle(),
                style:
                    TextStyle(color: Color(MainConstant.white), fontSize: 13),
              ),
              GestureDetector(
                child: Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Color(MainConstant.white),
                  size: 16,
                ),
                onTap: () => onTapNext(),
              ),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: getWeekDays(currentDate).map((dateTime) {
              return ShowDate(
                dateTime: dateTime,
                isSelected: isSelectedDay(dateTime),
                onTap: (dateTime) {
                  widget.onChangeSelectedDay(dateTime);
                },
              );
            }).toList(),
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}

class ShowDate extends StatefulWidget {
  final DateTime dateTime;
  final bool isSelected;

  final Function(DateTime) onTap;

  const ShowDate({Key key, this.dateTime, this.isSelected, this.onTap})
      : super(key: key);

  @override
  _ShowDateState createState() => _ShowDateState();
}

class _ShowDateState extends State<ShowDate> {
  bool checkIsToday(DateTime date) {
    final DateTime today = DateTime.now();
    if (date == DateTime(today.year, today.month, today.day)) {
      return true;
    }
    return false;
  }

  BoxDecoration getDecoration(bool isSelected) {
    if (isSelected) {
      return BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Color(MainConstant.black),
      );
    }
    if (checkIsToday(widget.dateTime)) {
      return BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Color(MainConstant.grey).withOpacity(0.2),
      );
    }
    return BoxDecoration();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            '${DateFormat('EEEE').format(widget.dateTime).substring(0, 3).toUpperCase()}',
            style: TextStyle(
                fontWeight: FontWeight.w100,
                color: Color(MainConstant.grey),
                fontSize: 13),
          ),
          SizedBox(
            height: 5,
          ),
          GestureDetector(
            onTap: () => widget.onTap(widget.dateTime),
            child: Container(
              width: 26,
              height: 26,
              alignment: Alignment.center,
              decoration: getDecoration(widget.isSelected),
              child: Text(
                widget.dateTime.day.toString(),
                style: TextStyle(color: Color(MainConstant.white)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
