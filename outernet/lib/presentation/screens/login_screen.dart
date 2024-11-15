// import necessary packages, remember bloc also
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:outernet/presentation/blocs/AuthBloc/auth_events.dart';
import 'package:outernet/presentation/blocs/AuthBloc/auth_state.dart';
import 'package:outernet/presentation/blocs/bloc_package.dart';
import 'package:outernet/presentation/screens/asset_links.dart';
import 'package:outernet/presentation/screens/device_specifications.dart';
import 'package:outernet/presentation/widgets/back_button.dart';
import 'package:outernet/presentation/widgets/button_custom.dart';
import 'package:outernet/presentation/widgets/checkbox_custom.dart';
import 'package:outernet/presentation/widgets/divider_custom.dart';
import 'package:outernet/presentation/widgets/hero_image.dart';
import 'package:outernet/presentation/widgets/icon_custom.dart';
import 'package:outernet/presentation/widgets/text_input_custom.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final ValueNotifier<bool> _rememberMeNotifier = ValueNotifier<bool>(false);

  LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final double screenWidth = DeviceSpecs.getWidth(context);
    final authBloc = BlocProvider.of<AuthorizationBloc>(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BackButtonCustom(),
                const SizedBox(height: 5),
                HeroImage(assetsLink: otpHeroImage, width: screenWidth),
                const SizedBox(height: 5),
                SizedBox(
                  height: 50,
                  child: TextInputCustom(
                    validator: (value) => null,
                    controller: _emailController,
                    label: 'Email',
                    hint: 'Example@gmail.com'
                  )
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 50,
                  child: TextInputCustom(
                    validator: (value) => null,
                    controller: _passwordController,
                    obsecure: true,
                    label: 'Password',
                    hint: 'Mật khẩu phải có ít nhất 8 chữ số'
                  )
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildCheckbox(),
                    TextButtonCustom(text: 'Quên mật khẩu', onPressed: () => null)
                  ],
                ),
                _buildLoginButton(authBloc, screenWidth),
                const SizedBox(height: 10),
                const DividerCustom(text: 'Hoặc đăng nhập với'),
                Row(
                  children: [
                    _buildLoginWithFacebookButton(),
                    const SizedBox(width: 30),
                    _buildLoginWithGoogleButton()
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Chưa có tài khoản?'),
                    TextButtonCustom(text: 'Đăng ký ngay', onPressed: () => null)
                  ],
                ),
                BlocConsumer<AuthorizationBloc, AuthState>(
                  listener: (context, state) {
                    if (state is Authenticated) {
                      showDialog(
                        context: context,
                        builder: (context) => const AlertDialog(
                          title: Text('Đăng nhập thành công'),
                        ),
                      );
                      Future.delayed(const Duration(seconds: 2), () {
                        Navigator.of(context).pop();
                        Navigator.of(context).pushNamed('/home');
                      });
                    }
                  },
                  builder: (context, state) {
                    if (state is LoadingAuthState) {
                      return const CircularProgressIndicator();
                    } else if (state is AuthFailed) {
                      return Text(state.failure.message,
                          style: const TextStyle(color: Colors.red, fontSize: 16));
                    } else if (state is Authenticated) {
                      return const Text('Đăng nhập thành công',
                          style: TextStyle(color: Colors.green, fontSize: 16));
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
              ],
            ),
          ),
        )
      ),
    );
  }

  Widget _buildCheckbox() {
    return ValueListenableBuilder<bool>(
      valueListenable: _rememberMeNotifier,
      builder: (context, value, child) {
        return CheckboxCustom(
          value: value,
          label: 'Nhớ mật khẩu',
          onChanged: (bool? newValue) {
            _rememberMeNotifier.value = newValue ?? false;
          },
        );
      },
    );
  }

  Widget _buildLoginButton(AuthorizationBloc bloc, double screenWidth) {
    return Container(
        padding: const EdgeInsets.all(0),
        width: screenWidth,
        child: FilledButtonCustom(
            text: 'Đăng nhập',
            onPressed: () {
              final email = _emailController.text;
              final password = _passwordController.text;
              final rememberMe = _rememberMeNotifier.value;
              bloc.add(LoginRequested(email, password, rememberMe));
            }));
  }

  Widget _buildLoginWithFacebookButton() {
    return Expanded(
        child: OutlinedButtonCustom.icon(
      icon: const IconCustom(svgIcon: paperPlaneIcon),
      text: 'Facebook',
      onPressed: () => null,
    ));
  }

  Widget _buildLoginWithGoogleButton() {
    return Expanded(
        child: OutlinedButtonCustom.icon(
      icon: const IconCustom(svgIcon: paperPlaneIcon),
      text: 'Google',
      onPressed: () => null,
    ));
  }
}
