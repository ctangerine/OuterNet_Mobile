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

class AddNewMemberToPlan extends StatefulWidget {
  const AddNewMemberToPlan({super.key});

  @override
  _AddNewMemberToPlanState createState() => _AddNewMemberToPlanState();
}

class _AddNewMemberToPlanState extends State<AddNewMemberToPlan> {
  final TextEditingController nameController = TextEditingController();
  Timer? _debounce;

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
      final SearchUserRequestModel request = SearchUserRequestModel(q: nameController.text, page: 1);
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
          borderRadius: BorderRadius.circular(24.0),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Nhập tên thành viên',
                ),
                controller: nameController,
                onChanged: (value) => _onSearchChanged(),
              ),
              const SizedBox(height: 16.0),
              BlocBuilder<UserBloc, UserState>(
                builder: (context, state) {
                  if (state is UserLogedIn) {
                    if (state.isUserSearched == true) {
                      final users = state.users;
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: users!.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(users[index].nickname ?? users[index].fullName ?? ''),
                            onTap: () {
                              final AddOrRemovePlanMemberRequestModel request = AddOrRemovePlanMemberRequestModel(
                                planId: (planBloc.state as LoadPlanListSuccess).specificPlan.id,
                                userId: users[index].id,
                              );
                              planBloc.add(AddMemberToPlan(request, request.planId!));
                            },
                          );
                        },
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  } else if (state is LoadUserFailed) {
                    return Text(state.message);
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}