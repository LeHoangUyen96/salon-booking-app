import 'package:salon_booking_app/modules/appointments/redux/reducers.dart';
import 'package:salon_booking_app/modules/auth/redux/reducer.dart';
import 'package:salon_booking_app/modules/profile/redux/reducer.dart';
import 'package:salon_booking_app/modules/wallet/redux/reducers.dart';
import 'IStore.dart';

AppState appStateReducer(AppState state, action) {
  return AppState(
    auth: authReducer(state.auth, action),
    appointments: appointmentReducer(state.appointments, action),
    userInfo: userInfoReducer(state.userInfo, action),
    wallet: walletReducer(state.wallet, action),
  );
}
