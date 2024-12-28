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

  // copyWith method
  LoginRequestModel copyWith({
    String? email,
    String? password,
  }) {
    return LoginRequestModel(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  // default request model
  static LoginRequestModel defaultInstance = LoginRequestModel(
    email: '',
    password: '',
  );
}


class RegisterRequestedModel {
  late final String email;
  late final String password;
  late final String fullname;
  late final String nickname;

  RegisterRequestedModel({
    required this.email,
    required this.password,
    required this.fullname,
    required this.nickname,
  });

  RegisterRequestedModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    fullname = json['name'];
    nickname = json['nickname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    data['name'] = fullname;
    data['nickname'] = nickname;
    return data;
  }

  RegisterRequestedModel copyWith({
    String? email,
    String? password,
    String? fullname,
    String? nickname,
  }) {
    return RegisterRequestedModel(
      email: email ?? this.email,
      password: password ?? this.password,
      fullname: fullname ?? this.fullname,
      nickname: nickname ?? this.nickname,
    );
  }

  static RegisterRequestedModel defaultInstance = RegisterRequestedModel(
    email: '',
    password: '',
    fullname: '',
    nickname: '',
  );
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

  VerifyRegisterRequestModel copyWith({
    String? email,
    String? otp,
  }) {
    return VerifyRegisterRequestModel(
      email: email ?? this.email,
      otp: otp ?? this.otp,
    );
  }

  static VerifyRegisterRequestModel defaultInstance = VerifyRegisterRequestModel(
    email: '',
    otp: '',
  );
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

  ResetPasswordRequestModel copyWith({
    String? email,
    String? newPassword,
    String? otp,
  }) {
    return ResetPasswordRequestModel(
      email: email ?? this.email,
      newPassword: newPassword ?? this.newPassword,
      otp: otp ?? this.otp,
    );
  }

  static ResetPasswordRequestModel defaultInstance = ResetPasswordRequestModel(
    email: '',
    newPassword: '',
    otp: '',
  );
}

class RefreshTokenRequestModel {
  
}
