import 'package:flutter/material.dart';
import 'package:salon_booking_app/modules/appointments/models/appointment.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:redux/redux.dart';
import 'package:salon_booking_app/modules/appointments/redux/actions.dart';
import 'package:salon_booking_app/modules/dashboard/constants/stylist.dart';
import 'package:salon_booking_app/modules/services/constants/services.dart';
import 'package:salon_booking_app/modules/wallet/models/transections.dart';
import 'package:salon_booking_app/modules/wallet/redux/actions.dart';
import 'package:salon_booking_app/redux/IStore.dart';

final Reducer<AppointmentState> appointmentReducer =
    combineReducers(<AppointmentState Function(AppointmentState, dynamic)>[
  TypedReducer<AppointmentState, CreateAppointment>(onCreateAppointment),
  TypedReducer<AppointmentState, ConfirmAppointment>(onConfirmAppointment),
  TypedReducer<AppointmentState, ResetSelection>(onResetSelection),
  TypedReducer<AppointmentState, SetTempDateTime>(onSetTempDateTime),
  TypedReducer<AppointmentState, SetTempTimeOfDate>(onSetTempTimeOfDate),
  TypedReducer<AppointmentState, SetTempServiceID>(onSetTempServiceID),
  TypedReducer<AppointmentState, SetTempStylistID>(onSetTempStylistID),
  TypedReducer<AppointmentState, SetSelectedAppointmentID>(
      onSetSelectedAppointmentID),
]);

AppointmentState onSetTempDateTime(
    AppointmentState state, SetTempDateTime action) {
  state = state.copyWith(tempDateTime: action.dateTime);
  return state;
}

AppointmentState onSetTempTimeOfDate(
    AppointmentState state, SetTempTimeOfDate action) {
  state = state.copyWith(tempTimeOfDay: action.timeOfDay);
  return state;
}

AppointmentState onSetTempServiceID(
    AppointmentState state, SetTempServiceID action) {
  state = state.copyWith(tempServiceID: action.serviceID);
  return state;
}

AppointmentState onSetTempStylistID(
    AppointmentState state, SetTempStylistID action) {
  state = state.copyWith(tempStylistID: action.stylistID);
  return state;
}

AppointmentState onSetSelectedAppointmentID(
    AppointmentState state, SetSelectedAppointmentID action) {
  state = state.copyWith(selectedAppointmentID: action.appointmentID);
  return state;
}

AppointmentState onCreateAppointment(
    AppointmentState state, CreateAppointment action) {
  final Map<String, Appointment> newAppointments = {...state.appointments};
  newAppointments[action.appointment.appointmentID] = action.appointment;
  state = state.copyWith(appointments: newAppointments);
  return state;
}

AppointmentState onConfirmAppointment(
    AppointmentState state, ConfirmAppointment action) {
  final Map<String, Appointment> newAppointments = {...state.appointments};
  newAppointments.remove(action.appointmentID);
  state = state.copyWith(appointments: newAppointments);
  return state;
}

AppointmentState onResetSelection(
    AppointmentState state, ResetSelection action) {
  state = state.copyWith(
    tempDateTime: DateTime(1990),
    tempStylistID: '',
    tempTimeOfDay: TimeOfDay(hour: 0, minute: 0),
  );
  return state;
}

ThunkAction<AppState> confirmAppointmentAction(BuildContext context) {
  return (store) async {
    try {
      final String selectedID = store.state.appointments.selectedAppointmentID;
      final Appointment appointment =
          store.state.appointments.appointments[selectedID];
      final String selectedPaymentMethod =
          store.state.wallet.selectedPaymentMethod;
      final Transection transection = Transection(
        cost: appointment.cost,
        dateTime: appointment.dateTime,
        serviceImage: appointment.service.image,
        name: appointment.service.name,
        serviceName: appointment.service.category.name,
        transectionID: UniqueKey().toString(),
        selectedPaymentMethod: selectedPaymentMethod,
      );

      await store.dispatch(ConfirmAppointment(selectedID));
      await store.dispatch(AddATransection(transection));
      Navigator.of(context)..pop()..pop()..pushNamed('my_wallet');
    } catch (e) {
      print(e);
    }
  };
}

ThunkAction<AppState> createAppointmentAction(BuildContext context) {
  return (store) async {
    try {
      final AppointmentState state = store.state.appointments;
      final Appointment appointment = Appointment(
        appointmentID: UniqueKey().toString(),
        cost: servicesConstant[state.tempServiceID].price,
        dateTime: state.tempDateTime,
        service: servicesConstant[state.tempServiceID],
        stylist: stylists[state.tempStylistID],
        timeOfDay: state.tempTimeOfDay,
      );
      await store.dispatch(CreateAppointment(appointment));
      Navigator.of(context)
        ..pop()
        ..pushReplacementNamed('my_appointments');
    } catch (e) {
      print(e);
    }
  };
}
