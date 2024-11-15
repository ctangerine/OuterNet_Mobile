import 'package:flutter/material.dart';
import 'package:outernet/presentation/screens/asset_links.dart';
import 'package:outernet/presentation/themes.dart';
import 'package:outernet/presentation/widgets/back_button.dart';

class PersonalInformationScreen extends StatelessWidget {
  const PersonalInformationScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButtonCustom(),
        centerTitle: true,
        title: _buildAppTitle(),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              _buildAvatar(),
              const SizedBox(height: 20),
              _buildInfo(context),
            ],
          ),
        ),
      ),
      floatingActionButton: _buildEditFloatingButton(),
    );
  }

  Widget _buildAppTitle() {
    return const Text('Thông tin cá nhân của bạn', style: AppTextStyles.body1Semibold);
  }


  Widget _buildAvatar() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage(avatarImage),
        ),
        const SizedBox(height: 10),
        const Text(
          'Wander Lorem Ispum',
          style: AppTextStyles.body2Semibold,
        ),
        const SizedBox(height: 5,),
        Text('loremispum@gmail.com', style: AppTextStyles.body2Regular.copyWith(color: AppColors.textPrimary),)
      ],
    );
  }

  Widget _buildInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Tên người dùng', style: AppTextStyles.body2Semibold.copyWith(color: AppColors.textOnMainTheme),),
        const SizedBox(height: 10), 
        _usernameInput(),
        const SizedBox(height: 10),
        Text('Giới tính', style: AppTextStyles.body2Semibold.copyWith(color: AppColors.textOnMainTheme),),
        const SizedBox(height: 10),
        _genderInput(),
        const SizedBox(height: 10),
        Text('Số điện thoại', style: AppTextStyles.body2Semibold.copyWith(color: AppColors.textOnMainTheme),),
        const SizedBox(height: 10),
        _phoneInput(),
        const SizedBox(height: 10),
        Text('Ngày sinh', style: AppTextStyles.body2Semibold.copyWith(color: AppColors.textOnMainTheme),),
        const SizedBox(height: 10),
        _dateOfBirthInput(context),
        const SizedBox(height: 10),
        Text('Địa chỉ', style: AppTextStyles.body2Semibold.copyWith(color: AppColors.textOnMainTheme),),
        const SizedBox(height: 10),
        _addressInput(),
      ],
    );
  }

  Widget _usernameInput() {
    return TextFormField(
      initialValue: 'Wander Lorem Ispum',
      readOnly: true,
      style: AppTextStyles.body1Medium.copyWith(color: AppColors.textPrimary),
    );
  }

  Widget _genderInput() {
    return DropdownButtonFormField(
      style: AppTextStyles.body1Medium.copyWith(color: AppColors.textPrimary),
      icon: const Icon(Icons.arrow_drop_down_rounded),
      dropdownColor: AppColors.themeSecondary,
      value: 'Nam',
      items: ['Nam', 'Nữ', 'Khác'].map((String value) {
        return DropdownMenuItem(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? newValue) {},
    );
  }

  Widget _phoneInput() {
    return TextFormField(
      initialValue: '0123456789',
      decoration: const InputDecoration(
        prefixText: '+84',
        prefixIcon: Icon(Icons.phone),
      ),
      readOnly: true,
      style: AppTextStyles.body1Medium.copyWith(color: AppColors.textPrimary),
    );
  }

  Widget _dateOfBirthInput(BuildContext context) {
    return TextFormField(
      style: AppTextStyles.body1Medium.copyWith(color: AppColors.primary),
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.calendar_today, size: 20),
        hintText: 'Select your birth date',
        hintStyle: TextStyle(color: AppColors.textPrimary),
      ),
      readOnly: true,
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        );
        if (pickedDate != null) {
          // _birthDateController.text = "${pickedDate.toLocal()}".split(' ')[0];
        }
      },
    );
  }

  Widget _addressInput() {
    return TextFormField(
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.location_on)
      ),
      initialValue: 'Thành phố Đà Nẵng, Việt Nam',
      style: AppTextStyles.body1Medium.copyWith(color: AppColors.textPrimary),
    );
  }

  Widget _buildEditFloatingButton() {
    return FloatingActionButton.extended(
      onPressed: () => {}, 
      label: const Text('Chỉnh sửa thông tin', style: AppTextStyles.body1Semibold,),
      icon: const Icon(Icons.edit, size: 20,),
      backgroundColor: AppColors.primary,
      extendedPadding: const EdgeInsets.symmetric(vertical: 3, horizontal: 15),
    );
  }
}