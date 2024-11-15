import 'package:flutter/material.dart';
import 'package:outernet/presentation/themes.dart';
import 'package:outernet/presentation/helper_widgets/back_button.dart';

class SecurityScreen extends StatelessWidget {
  const SecurityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: const BackButtonCustom(),
        title: const Text('Mật khẩu và bảo mật', style: AppTextStyles.heading1Semibold),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildPasswordForm(),
              const SizedBox(height: 40, child: Divider(),),
              _buildAccountDeleteForm(),
            ],
          ),
        ),
      )
    );
  }

  Widget _buildPasswordForm() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        const Text('Đổi mật khẩu', style: AppTextStyles.heading1Semibold,),
        const SizedBox(height: 30),
        const Text('Mật khẩu cũ', style: AppTextStyles.body2Semibold,),
        const SizedBox(height: 10),
        _buildOldPasswordField(),
        const SizedBox(height: 20),
        const Text('Mật khẩu mới', style: AppTextStyles.body2Semibold,),
        const SizedBox(height: 10),
        _buildNewPasswordField(),
        const SizedBox(height: 20),
        const Text('Nhập lại mật khẩu mới', style: AppTextStyles.body2Semibold,),
        const SizedBox(height: 10),
        _buildConfirmPasswordField(),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FilledButton(
              onPressed: () => {}, 
              child: Text('Lưu thay đổi', style: AppTextStyles.body2Semibold.copyWith(color: AppColors.maintheme),)
            )
          ],
        )
      ],
    );
  }

  Widget _buildOldPasswordField() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Nhập mật khẩu cũ',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  Widget _buildNewPasswordField() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Nhập mật khẩu mới',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  Widget _buildConfirmPasswordField() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Nhập lại mật khẩu mới',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  Widget _buildAccountDeleteForm() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Xóa tài khoản', style: AppTextStyles.heading1Semibold,),
        const SizedBox(height: 20),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     const Expanded(
        //       flex: 7,
        //       child: Column(
        //         children: [
        //           Text ('Một khi bạn quyết định xóa tài khoản, sẽ không thể hoàn tác, hãy cân nhắc!', style: AppTextStyles.body1Semibold,),
        //         ]
        //       ),
        //     ),
        //     Column(
        //       children: [
        //         FilledButton(
        //           onPressed: () => {},
        //           style: ButtonStyle(
        //             backgroundColor: WidgetStateProperty.all(AppColors.error),
        //           ), 
        //           child: const Text('Xóa tài khoản', style: AppTextStyles.body2Semibold,),
        //         )
        //       ],
        //     )
        //   ],
        // )
        Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: FilledButton(
                    onPressed: () => {},
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(AppColors.error),
                    ), 
                    child: const Text('Xóa tài khoản', style: AppTextStyles.body2Semibold,),
                  )
                )
              ]
            ),
            const SizedBox(height: 10),
            const Text('Một khi bạn quyết định xóa tài khoản, sẽ không thể hoàn tác, hãy cân nhắc!', style: AppTextStyles.body1Semibold,),
          ],
        )
      ],
    );
  }
}