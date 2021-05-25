import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:salon_booking_app/modules/profile/helper/check_data.dart';
import 'package:salon_booking_app/modules/profile/helper/save_data.dart';
import 'package:salon_booking_app/modules/profile/models/user_info.dart';
import 'package:salon_booking_app/modules/profile/redux/action.dart';
import 'package:salon_booking_app/redux/IStore.dart';

final Reducer<UserInfo> userInfoReducer =
    combineReducers(<UserInfo Function(UserInfo, dynamic)>[
  TypedReducer<UserInfo, SetEmail>(onSetEmail),
  TypedReducer<UserInfo, SetImage>(onSetImage),
  TypedReducer<UserInfo, SetPassword>(onSetPassword),
  TypedReducer<UserInfo, SetFullName>(onSetFullName),
  TypedReducer<UserInfo, SetPhone>(onSetPhone),
  TypedReducer<UserInfo, SaveInfo>(onSaveInfo)
]);

UserInfo onSetFullName(UserInfo state, SetFullName action) {
  state = state.copyWith(fullName: action.fullName);
  return state;
}

UserInfo onSetImage(UserInfo state, SetImage action) {
  state = state.copyWith(image: action.image);
  return state;
}

UserInfo onSetPhone(UserInfo state, SetPhone action) {
  state = state.copyWith(phone: action.phone);
  return state;
}

UserInfo onSetEmail(UserInfo state, SetEmail action) {
  state = state.copyWith(email: action.email);
  return state;
}

UserInfo onSetPassword(UserInfo state, SetPassword action) {
  state = state.copyWith(password: action.password);
  return state;
}

UserInfo onSaveInfo(UserInfo state, SaveInfo action) {
  state = state.copyWith(
    fullName: action.fullName,
    image: action.image,
    email: action.email,
    phone: action.phone,
    password: action.password,
  );
  return state;
}

ThunkAction<AppState> setUserInfoActions({
  String fullName,
  String image,
  String phone,
  String email,
  String password,
}) {
  return (Store<AppState> store) async {
    await store.dispatch(SaveInfo(
        fullName: getString(fullName),
        image: getString(image),
        phone: getString(phone),
        email: getString(email),
        password: getString(password)));
    await saveData(
      fullName: fullName,
      image: image,
      email: email,
      password: password,
      phone: phone,
    );
  };
}
