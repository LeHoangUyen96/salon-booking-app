class Auth {
  final String email;
  final String password;

  factory Auth.initial() {
    return Auth(
      email: '',
      password: '',
    );
  }

  Auth({this.email, this.password});

  Auth copywith({
    String email,
    String password,
  }) {
    return Auth(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
