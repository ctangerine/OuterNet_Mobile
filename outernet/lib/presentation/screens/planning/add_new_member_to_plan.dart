import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:outernet/data/models/plan/plan_request_model.dart';
import 'package:outernet/data/models/user/user_request_model.dart';
import 'package:outernet/presentation/blocs/UserBloc/user_bloc.dart';
import 'package:outernet/presentation/blocs/UserBloc/user_events.dart';
import 'package:outernet/presentation/blocs/UserBloc/user_state.dart';
import 'package:outernet/presentation/blocs/plan_bloc/plan_bloc.dart';
import 'package:outernet/presentation/blocs/plan_bloc/plan_events.dart';
import 'package:outernet/presentation/blocs/plan_bloc/plan_state.dart';
import 'package:outernet/presentation/themes.dart';

class AddNewMemberToPlan extends StatefulWidget {
  const AddNewMemberToPlan({super.key});

  @override
  _AddNewMemberToPlanState createState() => _AddNewMemberToPlanState();
}

class _AddNewMemberToPlanState extends State<AddNewMemberToPlan> {
  final TextEditingController nameController = TextEditingController();
  Timer? _debounce;
  int? _selectedUserId;

  @override
  void dispose() {
    _debounce?.cancel();
    nameController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      final userBloc = BlocProvider.of<UserBloc>(context);
      final request = SearchUserRequestModel(q: nameController.text, page: 1);
      userBloc.add(SearchUserEvent(request));
    });
  }

  @override
  Widget build(BuildContext context) {
    final planBloc = BlocProvider.of<PlanBloc>(context);

    return BlocListener<PlanBloc, PlanState>(
      listener: (context, state) {
        if (state is LoadPlanListSuccess) {
          if (state.isRecentlyAddMember == true) {
            state.isRecentlyAddMember = false;
            planBloc.add(GetPlanDetail(state.specificPlan.id!));
            Navigator.of(context).pop();
          }
        }
      },
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Thêm thành viên vào kế hoạch',
                style: AppTextStyles.heading1Medium,
              ),
              const SizedBox(height: 16),
              _buildSearchField(),
              const SizedBox(height: 16),
              _buildUserList(),
              const SizedBox(height: 16),
              _buildConfirmButton(planBloc),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Nhập tên thành viên',
        filled: true,
        fillColor: Colors.white,
        focusColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
      controller: nameController,
      onChanged: (value) => _onSearchChanged(),
    );
  }

  Widget _buildUserList() {
    return Expanded(
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserLogedIn && state.isUserSearched == true) {
            final users = state.users;
            return ListView.builder(
              itemCount: users!.length,
              itemBuilder: (context, index) {
                final user = users[index];
                final isSelected = _selectedUserId == user.id;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedUserId = user.id;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.blue[50] : Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: isSelected ? Colors.blue : Colors.transparent,
                        width: 2.0,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4.0,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ListTile(
                      title: Text(
                        user.nickname ?? user.fullName ?? '',
                        style: AppTextStyles.heading1Semibold.copyWith(
                          height: 1.5,
                          letterSpacing: 1.15,
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          } else if (state is LoadUserFailed) {
            return Center(child: Text(state.message));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget _buildConfirmButton(PlanBloc planBloc) {
    return FilledButton(
      onPressed: _selectedUserId == null
          ? null
          : () {
              final request = AddOrRemovePlanMemberRequestModel(
                planId: (planBloc.state as LoadPlanListSuccess).specificPlan.id,
                userId: _selectedUserId!,
              );
              planBloc.add(AddMemberToPlan(request, request.planId!));
            },
      child: const Text('Xác nhận'),
    );
  }
}
