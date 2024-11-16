class LoginRequestModel {
  late final String email;
  late final String password;

  LoginRequestModel({
    required this.email,
    required this.password,
  });

  LoginRequestModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}


class RegisterRequestedModel {
  late final String email;
  late final String password;
  late final String fullname;

  RegisterRequestedModel({
    required this.email,
    required this.password,
    required this.fullname,
  });

  RegisterRequestedModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    fullname = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    data['name'] = fullname;
    return data;
  }
}

class VerifyRegisterRequestModel {
  late final String email;
  late final String otp;

  VerifyRegisterRequestModel({
    required this.email,
    required this.otp,
  });

  VerifyRegisterRequestModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    otp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['otp'] = otp;
    return data;
  }
}

class ResetPasswordRequestModel {
  late final String email;
  late final String? newPassword;
  late final String? otp;

  ResetPasswordRequestModel({
    required this.email,
    this.newPassword,
    this.otp
  });

  ResetPasswordRequestModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    newPassword = json['newPassword'];
    otp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    if (newPassword != null) {
      data['newPassword'] = newPassword;
    }
    if (otp != null) {
      data['otp'] = otp;
    }
    return data;
  }
}

class RefreshTokenRequestModel {
  
}
