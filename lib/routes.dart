import 'package:flutter/material.dart';
import 'package:salon_booking_app/modules/appointments/screens/appointment_list.dart';
import 'package:salon_booking_app/modules/appointments/screens/book_appointments.dart';
import 'package:salon_booking_app/modules/auth/screens/login_screen.dart';
import 'package:salon_booking_app/modules/dashboard/components/custom_drawer.dart';
import 'package:salon_booking_app/modules/dashboard/screens/contact_screen.dart';
import 'package:salon_booking_app/modules/profile/screens/edit_profile.dart';
import 'package:salon_booking_app/modules/profile/screens/profile_screen.dart';
import 'package:salon_booking_app/modules/payment/screens/my_offers.dart';
import 'package:salon_booking_app/modules/payment/screens/payment.dart';
import 'package:salon_booking_app/modules/wallet/screens/my_wallet.dart';
import 'package:salon_booking_app/modules/services/screens/service_screen.dart';

Route onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case 'appointment':
      return PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 500),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          animation =
              CurvedAnimation(parent: animation, curve: Curves.easeInSine);
          // Animation<Offset> custom = Tween<Offset>(begin: Offset(15.0,0.0),end: Offset(0.0,0.0),).animate(animation);
          return ScaleTransition(
            scale: animation,
            alignment: Alignment.center,
            child: child,
          );
        },
        pageBuilder: (context, animation, secondaryAnimation) {
          return ServiceScreen(
            title: settings.arguments,
          );
        },
      );
    case 'login':
      return MaterialPageRoute(builder: (context) => LoginScreen());
    case 'profile':
      return MaterialPageRoute(builder: (context) => ProfileScreen());
    case 'edit_profile':
      return MaterialPageRoute(builder: (context) => EditProfile());
    case 'custom_drawer':
      return MaterialPageRoute(builder: (context) => CustomDrawer());
    case 'my_offers':
      final arg = settings.arguments as Map<String, dynamic>;
      return MaterialPageRoute(
          builder: (context) => MyOffersScreen(
                title: arg['title'],
                sale: arg['discount'],
              ));
    case 'payment':
      return MaterialPageRoute(builder: (context) => PaymentScreen());
    case 'my_appointments':
      return MaterialPageRoute(builder: (context) => AppointmentList());
    case 'book_appointment':
      return MaterialPageRoute(builder: (context) => BookAppointment());
    case 'my_wallet':
      return MaterialPageRoute(builder: (context) => MyWallet());
    case 'contact':
      return MaterialPageRoute(builder: (context) => ContactScreen());
    default:
      return MaterialPageRoute(
        builder: (context) => Container(),
        settings: settings,
      );
  }
}
