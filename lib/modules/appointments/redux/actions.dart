import 'package:flutter/material.dart';
import 'package:salon_booking_app/modules/appointments/models/appointment.dart';

class CreateAppointment {
  final Appointment appointment;

  CreateAppointment(this.appointment);
}

class ConfirmAppointment {
  final String appointmentID;

  ConfirmAppointment(this.appointmentID);
}

class ResetSelection {}

class SetTempServiceID {
  final String serviceID;

  SetTempServiceID(this.serviceID);
}


class SetTempDateTime {
  final DateTime dateTime;

  SetTempDateTime(this.dateTime);
}


class SetTempTimeOfDate {
  final TimeOfDay timeOfDay;

  SetTempTimeOfDate(this.timeOfDay);
}

class SetSelectedAppointmentID {
  final String appointmentID;

  SetSelectedAppointmentID(this.appointmentID);
}

class SetTempStylistID {
  final String stylistID;

  SetTempStylistID(this.stylistID);
}
