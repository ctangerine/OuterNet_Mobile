import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:outernet/presentation/UI%20component%20resused/flare_icon.dart';
import 'package:outernet/presentation/blocs/AuthBloc/auth_bloc.dart';
import 'package:outernet/presentation/blocs/AuthBloc/auth_events.dart';
import 'package:outernet/presentation/blocs/AuthBloc/auth_state.dart';
import 'package:outernet/presentation/blocs/UserBloc/user_bloc.dart';
import 'package:outernet/presentation/blocs/UserBloc/user_events.dart';
import 'package:outernet/presentation/blocs/UserBloc/user_state.dart';
import 'package:outernet/presentation/screens/asset_links.dart';
import 'package:outernet/presentation/screens/device_specifications.dart';
import 'package:outernet/presentation/widgets/button_custom.dart';
import 'package:outernet/presentation/widgets/checkbox_custom.dart';
import 'package:outernet/presentation/widgets/divider_custom.dart';
import 'package:outernet/presentation/widgets/hero_image.dart';
import 'package:outernet/presentation/widgets/icon_custom.dart';
import 'package:outernet/presentation/widgets/text_input_custom.dart';

/// REGISTER SCREEN -> OTP AUTHENTICATION -> NICKNAME REGISTER SUBPAGE

class RegisterScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authBloc = BlocProvider.of<AuthorizationBloc>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                buildFlareIcon(),
                const SizedBox(height: 20),
                _buildDescriptionText(),
                const SizedBox(height: 30),
                _buildEmailInput(),
                const SizedBox(height: 30),
                _buildPasswordInput(),
                const SizedBox(height: 30),
                _buildConfirmPasswordInput(),
                const SizedBox(height: 30),
                _buildTermsCheckbox(),
                _buildRegisterButton(authBloc),
                const SizedBox(height: 10),
                const DividerCustom(text: 'Hoặc đăng nhập với'),
                const SizedBox(height: 10),
                _buildSocialLoginButtons(),
                _buildLoginLink(),
                _buildBlocConsumer(authBloc),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDescriptionText() {
    return const Text(
      'Thật tuyệt, chỉ vài bước nữa và bạn có thể tận hưởng sở thích du lịch cùng với tất cả mọi người!',
      textAlign: TextAlign.center,
      style: TextStyle(
        letterSpacing: 0.3,
        fontSize: 18,
        fontWeight: FontWeight.w600,
        fontFamily: 'Roboto',
      ),
    );
  }

  Widget _buildEmailInput() {
    return SizedBox(
      height: 60,
      child: TextInputCustom(
        validator: (value) => null,
        controller: _emailController,
        label: 'Nhập email của bạn',
        hint: 'example@gmail.com',
      ),
    );
  }

  Widget _buildPasswordInput() {
    return SizedBox(
      height: 60,
      child: TextInputCustom(
        validator: (value) => null,
        controller: _passwordController,
        obsecure: true,
        label: 'Nhập mật khẩu',
        hint: 'Mật khẩu phải có ít nhất 8 chữ số',
      ),
    );
  }

  Widget _buildConfirmPasswordInput() {
    return SizedBox(
      height: 60,
      child: TextInputCustom(
        validator: (value) => null,
        controller: _confirmPasswordController,
        obsecure: true,
        label: 'Nhập lại mật khẩu',
        hint: 'Mật khẩu phải trùng khớp',
      ),
    );
  }

  Widget _buildTermsCheckbox() {
    return Row(
      children: [
        const CheckboxCustom(value: false),
        const Text('Tôi đồng ý với'),
        TextButtonCustom(
          text: 'chính sách điều khoản',
          onPressed: () => null,
          paddingLeft: 5,
          paddingRight: 5,
        ),
      ],
    );
  }

  Widget _buildRegisterButton(AuthorizationBloc authBloc) {
    return Row(
      children: [
        Expanded(
          child: FilledButtonCustom(
            text: 'Đăng kí ngay',
            onPressed: () {
              final email = _emailController.text;
              final password = _passwordController.text;
              authBloc.add(RegisterRequested(email, password, ''));
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSocialLoginButtons() {
    return Row(
      children: [
        _buildLoginWithFacebookButton(),
        const SizedBox(width: 30),
        _buildLoginWithGoogleButton(),
      ],
    );
  }

  Widget _buildLoginWithFacebookButton() {
    return Expanded(
      child: OutlinedButtonCustom.icon(
        icon: const IconCustom(svgIcon: facebookIcon),
        text: 'Facebook',
        onPressed: () => null,
      ),
    );
  }

  Widget _buildLoginWithGoogleButton() {
    return Expanded(
      child: OutlinedButtonCustom.icon(
        icon: const IconCustom(svgIcon: googleIcon),
        text: 'Google',
        onPressed: () => null,
      ),
    );
  }

  Widget _buildLoginLink() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Đã có tài khoản'),
        TextButtonCustom(
          text: 'Đăng nhập ngay',
          onPressed: () => null,
          paddingLeft: 10,
          paddingRight: 10,
        ),
      ],
    );
  }

  Widget _buildBlocConsumer(AuthorizationBloc authBloc) {
    return BlocConsumer<AuthorizationBloc, AuthState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BlocProvider.value(
                value: BlocProvider.of<UserBloc>(context),
                child: const OTPAuthentication(),
              ),
            ),
          );
        } else if (state is RegisterFailed) {
          _showRegisterFailedDialog(context, state);
        }
      },
      builder: (context, state) {
        if (state is LoadingAuthState) {
          return const CircularProgressIndicator();
        }
        return const SizedBox.shrink();
      },
    );
  }

  void _showRegisterFailedDialog(BuildContext context, RegisterFailed state) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Đăng ký thất bại'),
        content: Text(state.failure.message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Đóng'),
          ),
        ],
      ),
    );
  }
}

/// NICKNAME REGISTER SUBPAG
/// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
/// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
/// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

class NickNameRegisterSubPage extends StatelessWidget {
  const NickNameRegisterSubPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nickNameController = TextEditingController();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: SafeArea(
          child: Column(
            children: [
              buildFlareIcon(),
              const SizedBox(height: 20),
              _buildDescriptionText(),
              const SizedBox(height: 30),
              _buildNicknameInput(nickNameController),
              const SizedBox(height: 30),
              _buildSubmitButton(context, nickNameController),
              _buildBlocListener(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDescriptionText() {
    return const Text(
      'Đặt cho bản thân một biệt danh và mọi người sẽ gọi bạn bằng biệt danh đó',
      textAlign: TextAlign.center,
      style: TextStyle(
        letterSpacing: 0.3,
        fontSize: 18,
        fontWeight: FontWeight.w600,
        fontFamily: 'Roboto',
      ),
    );
  }

  Widget _buildNicknameInput(TextEditingController controller) {
    return SizedBox(
      height: 60,
      child: TextInputCustom(
        validator: (value) => null,
        controller: controller,
        label: 'Nhập tên hiển thị của bạn',
        hint: 'Mona Lisa 123 unique',
      ),
    );
  }

  Widget _buildSubmitButton(BuildContext context, TextEditingController controller) {
    return Row(
      children: [
        Expanded(
          child: FilledButtonCustom(
            text: 'Xác nhận',
            onPressed: () {
              final nickName = controller.text;
              BlocProvider.of<UserBloc>(context).add(AddUserName(nickName));
            },
          ),
        ),
      ],
    );
  }

  Widget _buildBlocListener() {
    return BlocConsumer<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserLogedIn) {
          return Column(
            children: [
              const Text('Đăng ký thành công'),
              Text('Xin chào ${state.user.name}'),
              Text('Email: ${state.user.email}'),
              Text('Profile Image: ${state.user.profileImage}'),
            ],
          );
        } else {
          return const SizedBox.shrink();
        }
      },
      listener: (context, state) {
        if (state is LoadUserFailed) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Đăng ký thất bại'),
              content: Text(state.message),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Đóng'),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}




/// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
/// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
/// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

class OTPAuthentication extends StatelessWidget {  
  const OTPAuthentication({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = DeviceSpecs.getWidth(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: SafeArea(
          child: Column(
            children: [
              HeroImage(assetsLink: otpHeroImage, width: screenWidth),
              const SizedBox(height: 20),
              _buildDescriptionText(),
              const SizedBox(height: 30),
              _buildOTPInput(context),
              const SizedBox(height: 30),
              _buildSubmitButton(context),
             // _buildBlocListener(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDescriptionText() {
    return const Text(
      'Nhập mã xác nhận đã được gửi tới email của bạn',
      textAlign: TextAlign.center,
      style: TextStyle(
        letterSpacing: 0.3,
        fontSize: 18,
        fontWeight: FontWeight.w600,
        fontFamily: 'Roboto',
      ),
    );
  }

  Widget _buildOTPInput(BuildContext context) {
    return OtpTextField(
      numberOfFields: 6,
      borderColor: Colors.grey,
      showFieldAsBox: true,
      focusedBorderColor: Colors.black,
      margin: const EdgeInsets.all(5),
      fieldWidth: 40,
      onCodeChanged: (code) {
        //handle validation or checks here
      },
      onSubmit: (String verificationCode){  
        final state = BlocProvider.of<AuthorizationBloc>(context).state;
        if (state is RegisterSuccess && state.otp == verificationCode) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text("Verification Code"),
                content: Text('Code entered is $verificationCode'),
              );
            }
          );
        } else {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text("Verification Failed"),
                content: Text('The entered code is incorrect. Correct code is ${(state as RegisterSuccess).otp}'),
              );
            }
          );
        }
      }, // end onSubmit
    );
  }

  Widget _buildSubmitButton(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: FilledButtonCustom(
            text: 'Xác nhận',
            onPressed: () {
              //BlocProvider.of<AuthorizationBloc>(context).add(OTPAuthenticationRequested('123456'));
            },
          ),
        ),
      ],
    );
  }

  Widget? _buildBlocListener() {
    return null;
  }   
}