import 'package:equatable/equatable.dart';
import 'package:salon_booking_app/modules/appointments/models/appointment.dart';
import 'package:salon_booking_app/modules/auth/models/auth.dart';
import 'package:salon_booking_app/modules/profile/models/user_info.dart';
import 'package:salon_booking_app/modules/wallet/models/wallet.dart';

class AppState extends Equatable {
  final Auth auth;
  final AppointmentState appointments;
  final Wallet wallet;
  final UserInfo userInfo;

  AppState({
    this.auth,
    this.wallet,
    this.appointments,
    this.userInfo,
  });

  factory AppState.initial() {
    return AppState(
      auth: Auth.initial(),
      wallet: Wallet.initial(),
      appointments: AppointmentState.initial(),
      userInfo: UserInfo.initialState(),
    );
  }

  AppState copyWith({
    Auth auth,
    Wallet wallet,
    AppointmentState appointments,
    UserInfo userInfo,
  }) {
    return AppState(
      auth: auth ?? this.auth,
      userInfo: userInfo ?? this.userInfo,
      wallet: wallet ?? this.wallet,
      appointments: appointments ?? this.appointments,
    );
  }

  @override
  List<Object> get props => [
        auth,
        appointments,
        userInfo,
        wallet,
      ];
}
