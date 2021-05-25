import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:salon_booking_app/modules/dashboard/models/stylist.dart';
import 'package:salon_booking_app/modules/services/models/appointment.dart';

class Appointment extends Equatable {
  final String appointmentID;
  final Service service;
  final DateTime dateTime;
  final TimeOfDay timeOfDay;
  final Stylist stylist;
  final double cost;

  Appointment({
    this.appointmentID,
    this.service,
    this.dateTime,
    this.timeOfDay,
    this.stylist,
    this.cost,
  });

  factory Appointment.initial() {
    return Appointment(
        appointmentID: '',
        dateTime: DateTime.now(),
        service: Service(),
        timeOfDay: TimeOfDay(hour: 10, minute: 0),
        stylist: Stylist(
          id: '',
          image: '',
          name: '',
          phoneNumber: '',
          rating: 0.0,
        ),
        cost: 0.0);
  }

  Appointment copyWith({
    String appointmentID,
    Service service,
    DateTime dateTime,
    TimeOfDay timeOfDay,
    Stylist stylist,
    double cost,
  }) {
    return Appointment(
      dateTime: dateTime ?? this.dateTime,
      service: service ?? this.service,
      timeOfDay: timeOfDay ?? this.timeOfDay,
      stylist: stylist ?? this.stylist,
      appointmentID: appointmentID ?? this.appointmentID,
      cost: cost ?? this.cost,
    );
  }

  @override
  List<Object> get props => [
        service,
        dateTime,
        timeOfDay,
        stylist,
        appointmentID,
        cost,
      ];
}

class AppointmentState extends Equatable {
  final Map<String, Appointment> appointments;
  final String selectedAppointmentID;
  final DateTime tempDateTime;
  final TimeOfDay tempTimeOfDay;
  final String tempStylistID;
  final String tempServiceID;

  AppointmentState({
    this.appointments,
    this.selectedAppointmentID,
    this.tempDateTime,
    this.tempTimeOfDay,
    this.tempStylistID,
    this.tempServiceID,
  });

  factory AppointmentState.initial() {
    return AppointmentState(
      appointments: {},
      selectedAppointmentID: '',
      tempDateTime: DateTime(1990),
      tempStylistID: '',
      tempTimeOfDay: TimeOfDay(hour: 0, minute: 0),
      tempServiceID: '',
    );
  }

  AppointmentState copyWith({
    Map<String, Appointment> appointments,
    String selectedAppointmentID,
    DateTime tempDateTime,
    TimeOfDay tempTimeOfDay,
    String tempStylistID,
    String tempServiceID,
  }) {
    return AppointmentState(
      appointments: appointments ?? this.appointments,
      selectedAppointmentID: selectedAppointmentID ?? this.selectedAppointmentID,
      tempDateTime: tempDateTime ?? this.tempDateTime,
      tempStylistID: tempStylistID ?? this.tempStylistID,
      tempTimeOfDay: tempTimeOfDay ?? this.tempTimeOfDay,
      tempServiceID: tempServiceID ?? this.tempServiceID,
    );
  }

  @override
  List<Object> get props => [
        appointments,
        selectedAppointmentID,
        tempDateTime,
        tempServiceID,
        tempStylistID,
        tempTimeOfDay,
      ];
}
