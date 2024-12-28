import 'package:flutter/material.dart';
import 'package:outernet/presentation/themes.dart';
import 'package:outernet/presentation/helper_widgets/back_button.dart';

class PersonalAccountScreen extends StatelessWidget {
  const PersonalAccountScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButtonCustom(),
        title: _buildHeader(),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildAccountInfo(),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: _buildUpdateFloatingActionButton(),
    );
  }

  Widget _buildHeader() {
    return const Text('Dữ liệu cá nhân', style: AppTextStyles.heading1Semibold,);
  }

  Widget _buildAccountInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Biệt danh', style: AppTextStyles.body2Semibold,),
        const SizedBox(height: 10),
        _buildNickName(),
        const SizedBox(height: 20),
        const Text('Email', style: AppTextStyles.body2Semibold,),
        const SizedBox(height: 10),
        _buildEmail(),
        const SizedBox(height: 20),
        const Text('Liên kết mạng xã hội', style: AppTextStyles.body2Semibold,),
        const SizedBox(height: 10),
        _buildSocialNetwork(),
        const SizedBox(height: 20),
        _buildJoinTime(),
      ],
    );
  }

  Widget _buildNickName() {
    return TextFormField(
      initialValue: 'Wander lorem ispum',
      readOnly: true,
      style: AppTextStyles.body1Regular,
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      initialValue: 'loremispum@gmail.com',
      readOnly: true,
      style: AppTextStyles.body1Regular,
    );
  }

  Widget _buildSocialNetwork() {
    return TextFormField(
      initialValue: 'https://www.facebook.com/loremispum',
      readOnly: true,
      style: AppTextStyles.body1Regular,
    );
  }

  Widget _buildJoinTime() {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Tham gia từ', style: AppTextStyles.body2Semibold,),
        SizedBox(width: 10),
        Text('20/10/2021', style: AppTextStyles.body2Semibold,),
      ],
    );
  }

  Widget _buildUpdateFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () {},
      backgroundColor: AppColors.primary,
      child: const Icon(Icons.edit),
    );
  }
}