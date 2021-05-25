import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:salon_booking_app/modules/appointments/components/appointment_item.dart';
import 'package:salon_booking_app/modules/appointments/models/appointment.dart';
import 'package:salon_booking_app/modules/appointments/redux/actions.dart';
import 'package:salon_booking_app/redux/IStore.dart';
import 'package:redux/redux.dart';
import 'package:salon_booking_app/redux/store.dart';

class _ViewModel extends Equatable {
  final Map<String, Appointment> appointments;
  _ViewModel({this.appointments});

  @override
  List<Object> get props => [
        appointments,
      ];
}

class AppointmentList extends StatefulWidget {
  @override
  _AppointmentListState createState() => _AppointmentListState();
}

class _AppointmentListState extends State<AppointmentList> {
  Future<void> onTapConfirm(String appointmentID) async {
    await store.dispatch(SetSelectedAppointmentID(appointmentID));
    Navigator.of(context).pushNamed('payment');
  }

  Widget buildChildren(Map<String, Appointment> appointments) {
    if (appointments == null || appointments.isEmpty) {
      return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Text("Sorry, you don't have any appointment."),
      );
    }
    return Column(
      children: appointments.entries
          .map((e) => AppointmentItem(
                dateTime: e.value.dateTime,
                time: e.value.timeOfDay,
                stylistImage: e.value.stylist.image,
                serviceName: e.value.service.category.name,
                stylistName: e.value.stylist.name,
                cost: e.value.cost,
                onTapConfirm: () => onTapConfirm(e.value.appointmentID),
              ))
          .toList(),
    );
  }

  Future<void> onInit(Store<AppState> store) async {}

  _ViewModel getConverter(Store<AppState> store) {
    return _ViewModel(
      appointments: store.state.appointments.appointments,
    );
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
          appBar: AppBar(
            centerTitle: true,
            title: Text('APPOINTMENT LIST'),
          ),
          body: SafeArea(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: buildChildren(viewModel.appointments),
            ),
          ),
        );
      },
    );
  }
}
