import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:salon_booking_app/components/light_black_button.dart';
import 'package:salon_booking_app/helpers/show_data_error.dart';
import 'package:salon_booking_app/modules/appointments/components/select_slots.dart';
import 'package:salon_booking_app/modules/appointments/components/select_stylish.dart';
import 'package:salon_booking_app/modules/appointments/components/week_calendar.dart';
import 'package:salon_booking_app/modules/appointments/redux/actions.dart';
import 'package:salon_booking_app/modules/appointments/redux/reducers.dart';
import 'package:salon_booking_app/redux/IStore.dart';
import 'package:salon_booking_app/redux/store.dart';
import 'package:redux/redux.dart';

class _ViewModel extends Equatable {
  final String tempStylistID;
  final DateTime selectedDate;
  final TimeOfDay selectedTime;

  _ViewModel({
    this.tempStylistID,
    this.selectedDate,
    this.selectedTime,
  });

  @override
  List<Object> get props => throw UnimplementedError();
}

class BookAppointment extends StatefulWidget {
  @override
  _BookAppointmentState createState() => _BookAppointmentState();
}

class _BookAppointmentState extends State<BookAppointment> {


  Future<void> onSelectedSlotChanged(TimeOfDay time) async {
    await store.dispatch(SetTempTimeOfDate(time));
  }

  Future<void> onSelectedDateChanged(DateTime date) async {
    await store.dispatch(SetTempDateTime(date));
  }

  Future<void> onSelectedStylistChanged(String stylistID) async {
    await store.dispatch(SetTempStylistID(stylistID));
  }

  Future<void> onInit(Store<AppState> store) async {
    await store.dispatch(ResetSelection());
  }

  _ViewModel getConverter(Store<AppState> store) {
    return _ViewModel(
      tempStylistID: store.state.appointments.tempStylistID,
      selectedDate: store.state.appointments.tempDateTime,
      selectedTime: store.state.appointments.tempTimeOfDay,
    );
  }

  Future<void> onTapBookAppointment(_ViewModel viewModel) async{
    final bool hasNotEnoughInfo = viewModel.selectedDate == DateTime(1990) ||
        viewModel.selectedTime == TimeOfDay(hour: 0,  minute: 0) ||
        viewModel.tempStylistID == '';
    if (hasNotEnoughInfo) {
      showDataError('Please choose enough selection');
      return;
    }
    await store.dispatch(createAppointmentAction(context));
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
        onInit: (store) async {
          await onInit(store);
        },
        converter: (store) => getConverter(store),
        builder: (BuildContext context, _ViewModel viewModel) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text('BOOK APPOINTMENT'),
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    WeekCalendar(
                      selectedDate: viewModel.selectedDate,
                      onChangeSelectedDay: (dateTime) =>
                          onSelectedDateChanged(dateTime),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'AVAILABLE SLOT',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Center(
                            child: SelectSlots(
                              selectedTimeOfDay: viewModel.selectedTime,
                              onChanged: (time) => onSelectedSlotChanged(time),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'SPECIAL STYLIST',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SelectStylist(
                            selectedStylistID: viewModel.tempStylistID,
                            onChanged: (stylistID) =>
                                onSelectedStylistChanged(stylistID),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          LightBlackButton(
                            title: 'Book appointment',
                            onTap: ()async => await onTapBookAppointment(viewModel),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
