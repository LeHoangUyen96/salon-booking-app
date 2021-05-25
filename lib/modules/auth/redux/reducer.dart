import 'package:flutter/material.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:salon_booking_app/modules/auth/helpers/check_user.dart';
import 'package:salon_booking_app/modules/auth/helpers/save_login.dart';
import 'package:salon_booking_app/modules/auth/models/auth.dart';
import 'package:salon_booking_app/modules/auth/redux/action.dart';
import 'package:salon_booking_app/redux/IStore.dart';
import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';

final Reducer<Auth> authReducer =
    combineReducers(<Auth Function(Auth, dynamic)>[
  TypedReducer<Auth, SetEmail>(onSetEmail),
  TypedReducer<Auth, SetPassword>(onSetPassword),
  TypedReducer<Auth, ClearLogin>(onClearLogin),
]);

Auth onSetEmail(Auth state, SetEmail action) {
  state = state.copywith(email: action.email);
  return state;
}

Auth onSetPassword(Auth state, SetPassword action) {
  state = state.copywith(
    password: action.password,
  );
  return state;
}

ThunkAction<AppState> onLoginActions(
    String email, String password, BuildContext context) {
  return (store) async {
    try {
      await store.dispatch(SetEmail(email));
      await store.dispatch(SetPassword(password));
      if (checkUser(email, password)) {
        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text('Sign in Success')));
        Navigator.of(context).pop();
        await saveLogin(email: email, password: password);

        return;
      }
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text('Failed Sign in')));
    } catch (e) {
      print(e);
    }
  };
}

ThunkAction<AppState> loadDataAction() {
  return (store) async {
    try {
      final SharedPreferences preferences =
          await SharedPreferences.getInstance();
      String email = preferences.getString('email') ?? '';
      String password = preferences.getString('password') ?? '';
      await store.dispatch(SetEmail(email));
      await store.dispatch(SetPassword(password));
    } catch (e) {
      print(e);
    }
  };
}

ThunkAction<AppState> logoutAction(BuildContext context) {
  return (store) async {
    try {
      final preferences = await SharedPreferences.getInstance();
      await preferences.remove('email');
      await preferences.remove('password');
      await store.dispatch(ClearLogin());
      Navigator.of(context).pop();
    } catch (e) {
      print(e);
    }
  };
}

Auth onClearLogin(Auth state, ClearLogin action) {
  state = state.copywith(
    email: '',
    password: '',
  );
  return state;
}
