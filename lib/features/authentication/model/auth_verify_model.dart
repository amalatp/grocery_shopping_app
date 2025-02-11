class AuthVerifyModel {
  final String otp;
  final String token;
  final bool user;

  AuthVerifyModel({required this.otp, required this.token, required this.user});

  factory AuthVerifyModel.fromJson(Map<String, dynamic> json) {
    return AuthVerifyModel(
      otp: json['otp'],
      token: json['token'],
      user: json['user'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'otp': otp,
      'token': token,
      'user': user,
    };
  }
}
