import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:outernet/data/data_sources/local_datasouces/drift_database.dart';
import 'package:outernet/data/data_sources/local_datasouces/drift_database_provider.dart';
import 'package:outernet/data/models/plan/plan_request_model.dart';
import 'package:outernet/domain/entities/user_entity.dart';
import 'package:outernet/presentation/blocs/plan_bloc/plan_bloc.dart';
import 'package:outernet/presentation/blocs/plan_bloc/plan_events.dart';
import 'package:outernet/presentation/blocs/plan_bloc/plan_state.dart';
import 'package:outernet/presentation/screens/asset_links.dart';
import 'package:outernet/presentation/themes.dart';

class PlanMembers extends StatefulWidget {
  final bool isDeleteMode;
  final AppDatabase _db = dbProvider.database;

  PlanMembers({super.key, this.isDeleteMode = false});

  @override
  State<PlanMembers> createState() => _PlanMembersState();
}

class _PlanMembersState extends State<PlanMembers> with AutomaticKeepAliveClientMixin {
  bool _isDeleteMode = false;
  UserEntity? currentUser;

  @override
  void initState() {
    super.initState();
    _loadCurrentUser();
  }

  Future<void> _loadCurrentUser() async {
    currentUser = await widget._db.getCurrentUser();
    setState(() {});
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<PlanBloc, PlanState>(
      builder: (context, state) {
        if (state is LoadPlanListSuccess) {
          if (state.isRecentlyGetPlanDetail == true ||
              state.isRecentlyChangeMemberRole == true ||
              state.isRecentlyAddMember == true ||
              state.isRecentlyRemoveMember == true) {
            final members = state.specificPlan.members ?? [];
            state.isRecentlyChangeMemberRole = false;
            state.isRecentlyAddMember = false;
            state.isRecentlyRemoveMember = false;

            return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                scrolledUnderElevation: 0,
                title: const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text('Danh sách thành viên', style: AppTextStyles.heading1Semibold),
                ),
                actions: [
                  IconButton(
                    icon: Icon(_isDeleteMode ? Iconsax.user_octagon : Iconsax.user_minus, size: 24),
                    onPressed: () {
                      setState(() {
                        _isDeleteMode = !_isDeleteMode;
                      });
                    },
                  ),
                  const SizedBox(width: 20),
                ],
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
                  child: Column(
                    children: [
                      _buildMemberList(context, members, currentUser ?? UserEntity.defaultInstance),
                    ],
                  ),
                ),
              ),
            );
          } else {
            if (state.error != null || state.error!.isNotEmpty) {
              final bloc = BlocProvider.of<PlanBloc>(context);
              bloc.add(GetPlanDetail(state.specificPlan.id!));
              state.error = null;
            }
            return const Center(child: CircularProgressIndicator());
          }
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _buildMemberList(BuildContext context, List<UserEntity> members, UserEntity currentUser) {
    final currentUserRole = checkCurrentUserRole(currentUser, members);
    currentUser = currentUser.copyWith(role: currentUserRole);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        for (int i = 0; i < members.length; i++) ...[
          _buildUserRow(context, members[i], currentUser),
          const SizedBox(height: 10),
          const SizedBox(height: 10),
        ],
      ],
    );
  }

  Widget _buildUserRow(BuildContext context, UserEntity member, UserEntity currentUser) {
    return Row(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundImage: member.avatar != null && member.avatar!.isNotEmpty
              ? NetworkImage(member.avatar!)
              : AssetImage(avatarImage) as ImageProvider,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            member.nickname ?? member.fullName ?? '',
            style: AppTextStyles.body1Regular,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        if (member.role == 'ADMIN' || member.role == 'OWNER') ...[
          SizedBox(
            width: 130,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  member.role ?? '',
                  style: AppTextStyles.body1Regular,
                ),
              ],
            ),
          ),
        ] else if (currentUser.role == 'OWNER' || currentUser.role == 'ADMIN') if (!_isDeleteMode) ...[
          SizedBox(
            width: 130,
            child: _roleDropdownMenu(context, member),
          ),
        ] else ...[
          SizedBox(
            width: 130,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(Icons.cancel_outlined),
                  onPressed: () {
                    setState(() {
                      final bloc = BlocProvider.of<PlanBloc>(context);
                      final request = AddOrRemovePlanMemberRequestModel(
                        planId: (bloc.state as LoadPlanListSuccess).specificPlan.id!,
                        userId: member.id,
                      );
                      bloc.add(RemoveMemberFromPlan(request, request.planId!));
                      bloc.add(GetPlanDetail((bloc.state as LoadPlanListSuccess).specificPlan.id!));
                    });
                  },
                ),
              ],
            ),
          ),
        ] else ...[
          SizedBox(
            width: 130,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  member.role ?? '',
                  style: AppTextStyles.body1Regular,
                ),
              ],
            ),
          ),
        ]
      ],
    );
  }

  Widget _roleDropdownMenu(BuildContext context, UserEntity member) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        DropdownButton<String>(
          value: member.role,
          elevation: 0,
          underline: const SizedBox(),
          items: ['ADMIN', 'MEMBER'].map((String role) {
            return DropdownMenuItem<String>(
              value: role,
              child: Text(role),
            );
          }).toList(),
          onChanged: (String? newValue) {
            final bloc = BlocProvider.of<PlanBloc>(context);
            final request = ChangeMemberRoleRequestModel(
              userId: member.id,
              role: newValue,
            );
            bloc.add(ChangeMemberRole(request, (bloc.state as LoadPlanListSuccess).specificPlan.id!));
            bloc.add(GetPlanDetail((bloc.state as LoadPlanListSuccess).specificPlan.id!));
          },
        ),
      ],
    );
  }

  String checkCurrentUserRole(UserEntity currentUser, List<UserEntity> members) {
    for (var member in members) {
      if (currentUser.id == member.id) {
        if (member.role! == 'OWNER' || member.role! == 'ADMIN') {
          return member.role!;
        } else {
          return 'MEMBER';
        }
      }
    }
    return 'MEMBER';
  }
}