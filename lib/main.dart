import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:salon_booking_app/constants/main_constants.dart';
import 'package:salon_booking_app/modules/dashboard/screens/dashboard_screen.dart';
import 'package:salon_booking_app/modules/auth/helpers/check_user.dart';
import 'package:salon_booking_app/modules/auth/redux/reducer.dart';
import 'package:salon_booking_app/modules/dashboard/screens/boarding_screen.dart';
import 'package:salon_booking_app/redux/IStore.dart';
import 'package:salon_booking_app/redux/store.dart';
import 'package:salon_booking_app/routes.dart';
import 'package:redux/redux.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Color(MainConstant.black),
  ));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) => runApp(SalonBookingApp()));
}

class SalonBookingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'Salon Booking App',
        onGenerateRoute: onGenerateRoute,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          unselectedWidgetColor: Color(MainConstant.white),
          primaryColor: Color(MainConstant.white),
          appBarTheme: AppBarTheme(
            elevation: 0,
            iconTheme: IconThemeData(
              color: Color(MainConstant.white),
            ),
            actionsIconTheme: IconThemeData(
              color: Color(MainConstant.white),
            ),
            backgroundColor: Color(MainConstant.black),
            textTheme: Theme.of(context).textTheme.apply(
                  fontFamily: 'Oswald',
                  bodyColor: Color(MainConstant.white),
                  displayColor: Color(MainConstant.white),
                ),
          ),
          textTheme: Theme.of(context).textTheme.apply(
                fontFamily: 'Oswald',
                bodyColor: Color(MainConstant.black),
                displayColor: Color(MainConstant.black),
              ),
          scaffoldBackgroundColor: Color(MainConstant.white),
          fontFamily: 'Oswald',
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class ViewModel extends Equatable {
  final String email;
  final String password;
  ViewModel({@required this.email, this.password});
  @override
  List<Object> get props => [email, password];
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<void> onInit(store) async {
    await store.dispatch(loadDataAction());
  }

  ViewModel converter(Store<AppState> store) {
    final email = store.state.auth.email;
    final password = store.state.auth.password;
    return ViewModel(email: email, password: password);
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ViewModel>(
        onInit: (store) async => await onInit(store),
        converter: (Store<AppState> store) => converter(store),
        builder: (BuildContext context, ViewModel viewModel) {
          if (checkUser(viewModel.email, viewModel.password)) {
            return DashboardScreen();
          }
          return BoardingScreen();
        });
  }
}
