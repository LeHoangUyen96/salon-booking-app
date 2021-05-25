import 'package:equatable/equatable.dart';
import 'package:salon_booking_app/modules/auth/constants/demo_user.dart';

class UserInfo extends Equatable {
  final String fullName;
  final String image;
  final String phone;
  final String email;
  final String password;
  UserInfo({
    this.fullName,
    this.image,
    this.phone,
    this.email,
    this.password,
  });
  factory UserInfo.initialState() {
    return UserInfo(
      fullName: "Jennifer Watson",
      image: "assets/images/user-avatar.jpg",
      phone: "+91 9876503640",
      email: DemoUser.email,
      password: DemoUser.password,
    );
  }
  UserInfo copyWith({
    String fullName,
    String image,
    String phone,
    String email,
    String password,
  }) {
    return UserInfo(
      fullName: fullName ?? this.fullName,
      image: image ?? this.image,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  List<Object> get props => [
        fullName,
        image,
        phone,
        email,
        password,
      ];
}
