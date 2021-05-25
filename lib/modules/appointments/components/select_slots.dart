import 'package:flutter/material.dart';
import 'package:salon_booking_app/constants/main_constants.dart';
import 'package:salon_booking_app/modules/appointments/constants/slots.dart';

class SlotBlock extends StatefulWidget {
  final double width;
  final TimeOfDay time;
  final bool isSelected;

  const SlotBlock({Key key, this.time, this.isSelected, this.width = 100})
      : super(key: key);
  @override
  _SlotBlockState createState() => _SlotBlockState();
}

class _SlotBlockState extends State<SlotBlock> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: widget.isSelected
            ? Color(MainConstant.lightBlack)
            : Color(MainConstant.lightGrey),
      ),
      width: widget.width,
      height: 36,
      alignment: Alignment.center,
      child: Text(
        widget.time.format(context),
        style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: widget.isSelected
                ? Color(MainConstant.white)
                : Color(MainConstant.black)),
      ),
    );
  }
}

class SelectSlots extends StatefulWidget {
  final int slotPerRow;
  final TimeOfDay selectedTimeOfDay;
  final Function(TimeOfDay) onChanged;

  const SelectSlots({
    Key key,
    @required this.selectedTimeOfDay,
    @required this.onChanged,
    this.slotPerRow = 3,
  }) : super(key: key);
  @override
  _SelectSlotsState createState() => _SelectSlotsState();
}

class _SelectSlotsState extends State<SelectSlots> {
  bool isSelected(TimeOfDay time) {
    if (time == widget.selectedTimeOfDay) {
      return true;
    }
    return false;
  }

  List<Widget> buildChildren(
      BuildContext context, double spacing, double paddingFromScreen) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double width = (screenWidth -
            2 * paddingFromScreen -
            spacing * (widget.slotPerRow - 1)) /
        (widget.slotPerRow);
    return slots
        .map((slot) => GestureDetector(
              onTap: () => widget.onChanged(slot),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: SlotBlock(
                  time: slot,
                  isSelected: isSelected(slot),
                  width: width,
                ),
              ),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final double spacing = 5.0;
    return Wrap(
      alignment: WrapAlignment.start,
      spacing: spacing,
      children: buildChildren(context, spacing, 15.0),
    );
  }
}
