import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:outernet/data/data_sources/dio_network/base_api_service.dart';
import 'package:outernet/presentation/blocs/plan_bloc/plan_bloc.dart';
import 'package:outernet/presentation/blocs/plan_bloc/plan_events.dart';
import 'package:outernet/presentation/blocs/plan_bloc/plan_state.dart';
import 'package:outernet/presentation/helper_widgets/custom_popup.dart';
import 'package:outernet/presentation/helper_widgets/image_handler.dart';
import 'package:outernet/presentation/screens/asset_links.dart';
import 'package:outernet/presentation/screens/planning/add_new_member_to_plan.dart';
import 'package:outernet/presentation/screens/planning/add_new_site_to_plan_popup.dart';
import 'package:outernet/presentation/screens/planning/plan_members.dart';
import 'package:outernet/presentation/screens/planning/trip_detail.dart';
import 'package:outernet/presentation/themes.dart';

class PlanDetail extends StatelessWidget {
  const PlanDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PlanBloc, PlanState>(
      listener: (context, state) {
        if (state is LoadPlanListFailed) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return CustomPopup(
                title: 'Kế hoạch chi tiết',
                content: 'Không thể lấy được thông tin chi tiết kế hoạch, hãy thử lại sau',
                confirmText: 'OK',
                onConfirm: () => Navigator.of(context).pop(),
              );
            },
          );
        } else if (state is LoadPlanListSuccess) {
          if (state.error != null && state.error!.isNotEmpty) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return CustomPopup(
                  title: 'Kế hoạch chi tiết',
                  content: 'Không thể lấy được thông tin chi tiết kế hoạch, hãy thử lại sau, error: ${state.error}',
                  confirmText: 'OK',
                  onConfirm: () {
                    state.error = null;
                    Navigator.of(context).pop();
                  },
                );
              },
            );
            state.error = null;
          }
        }
      },
      builder: (context, state) {
        if (state is LoadPlanListSuccess) {
          if (state.isRecentlyGetPlanDetail == true) {
            return Scaffold(
              
              floatingActionButton: Column(
                children: [
                  const SizedBox(height: 10),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: IconButton(
                      onPressed: () {
                        BlocProvider.of<PlanBloc>(context).add(GetAllPlan());
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Iconsax.arrow_left_2,
                      ),
                    ),
                  ),
                ],
              ),
              floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
              body: SafeArea(child: PlanDetailContent()),
            );
          } else {
            return Scaffold(appBar: AppBar());
          }
        } else {
          logger.e('LoadPlanListSuccess state is not found');
          return Scaffold(appBar: AppBar());
        }
      },
    );
  }
}

class PlanDetailContent extends StatelessWidget {
  const PlanDetailContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildHeroSection(context),
        Expanded(child: _buildSubtabMenu(context)),
      ],
    );
  }

  Widget _buildHeroSection(BuildContext context) {
    final state = BlocProvider.of<PlanBloc>(context).state as LoadPlanListSuccess;
    final List<String> avatarList = state.specificPlan.members!.map((e) => e.avatar ?? avatarImage).toList();

    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        ImageHandler(
          imageUrl: state.specificPlan.coverUrl ?? cardSpringConcept,
          defaultImage: cardSpringConcept,
          width: MediaQuery.of(context).size.width,
          height: 250,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, bottom: 30),
          child: avatarList.isEmpty ? const SizedBox.shrink() : _buildAvatarRow(avatarList),
        ),
      ],
    );
  }

  Widget _buildAvatarRow(List<String> avatarList) {
    if (avatarList.isEmpty) {
      return SizedBox.shrink();
    }

    const double avatarRadius = 20.0;
    const double overlap = 12.5;
    int displayCount = avatarList.length > 5 ? 5 : avatarList.length;
    int remainingCount = avatarList.length - displayCount;

    return SizedBox(
      height: avatarRadius * 2,
      child: Stack(
        children: [
          ...List.generate(displayCount, (index) {
            return Positioned(
              left: index * (avatarRadius * 2 - overlap),
              child: Container(
                width: avatarRadius * 2,
                height: avatarRadius * 2,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 0.75,
                  ),
                ),
                child: CircleAvatar(
                  backgroundImage: avatarList[index].isNotEmpty
                    ? NetworkImage(avatarList[index])
                    : AssetImage(avatarImage) as ImageProvider,
                  radius: avatarRadius - 2,
                ),
              ),
            );
          }),
          if (remainingCount > 0)
            Positioned(
              left: displayCount * (avatarRadius * 2 - overlap),
              child: CircleAvatar(
                backgroundColor: AppColors.primary,
                radius: avatarRadius,
                child: Text(
                  '+$remainingCount',
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildSubtabMenu(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          TabBar(
            labelColor: AppColors.primary,
            unselectedLabelColor: Colors.black87,
            indicatorColor: AppColors.primary,
            splashFactory: NoSplash.splashFactory,
            labelStyle: AppTextStyles.body1Semibold,
            tabs: const [
              Tab(text: 'Hành trình'),
              Tab(text: 'Thành viên'),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                Scaffold(
                  body: TripDetail(),
                  floatingActionButton: _addNewSiteButton(context),
                ),
                Scaffold(
                  body: PlanMembers(),
                  floatingActionButton: _addNewMemberButton(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _addNewSiteButton(BuildContext context) {
    return FloatingActionButton(
      heroTag: 'addNewSiteButton', // Add unique hero tag
      backgroundColor: AppColors.primary,
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext dialogContext) {
            return BlocProvider.value(
              value: BlocProvider.of<PlanBloc>(context),
              child: AddNewSiteToPlanPopup(),
            );
          },
        );
      },
      child: const Icon(Iconsax.add),
    );
  }

  Widget _addNewMemberButton(BuildContext context) {
    return FloatingActionButton(
      heroTag: 'addNewMemberButton', // Add unique hero tag
      backgroundColor: AppColors.primary,
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext dialogContext) {
            return BlocProvider.value(
              value: BlocProvider.of<PlanBloc>(context),
              child: AddNewMemberToPlan(),
            );
          },
        );
      },
      child: const Icon(Iconsax.add),
    );
  }
}