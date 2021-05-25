import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveLogin({
  String email,
  String password,
}) async {
  final Map<String, String> auth = {
    'email': email,
    'password': password,
  };
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  auth.forEach((key, value) {
    if (value != null && value != '') {
      preferences.setString(key, value);
    }
  });
}
