import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:outernet/presentation/blocs/plan_bloc/plan_bloc.dart';
import 'package:outernet/presentation/blocs/plan_bloc/plan_events.dart';
import 'package:outernet/presentation/blocs/plan_bloc/plan_state.dart';
import 'package:outernet/presentation/helper_widgets/custom_popup.dart';
import 'package:outernet/presentation/module_provider/init_injections.dart';
import 'package:outernet/presentation/screens/asset_links.dart';
import 'package:outernet/presentation/screens/planning/add_new_plan_popup.dart';
import 'package:outernet/presentation/screens/planning/plan_detail.dart';
import 'package:outernet/presentation/themes.dart';
import 'package:outernet/presentation/ui_component_resused/plan_card.dart';

class PlanSetupScreen extends StatelessWidget {
  const PlanSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PlanBloc>(
          create: (context) {
            try {
              return context.read<PlanBloc>();
            } catch (e) {
              return sl<PlanBloc>();
            }
          },
        )
      ],
      child: Builder(
        builder: (context) {
          return PlanSetupScreenContent();
        }
      ),
    );
  }
}

class PlanSetupScreenContent extends StatelessWidget {
  const PlanSetupScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    final planBloc = BlocProvider.of<PlanBloc>(context);
    planBloc.add(GetAllPlan());

    return _buildContent(context);
  }

  Scaffold _buildContent(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 50,
            width: MediaQuery.of(context).size.width - 40,
            child: FilledButton.icon(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext dialogContext) {
                    return BlocProvider.value(
                      value: BlocProvider.of<PlanBloc>(context),
                      child: AddNewPlanPopup(),
                    );
                  },
                );
              },
              label: const Text(
                'Thêm hành trình mới',
                style: AppTextStyles.heading2Semibold,
              ),
              icon: Icon(Iconsax.add, color: Colors.white,),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 40),
              BlocBuilder<PlanBloc, PlanState>(
                builder: (context, state) {
                  if (state is LoadPlanListSuccess) {
                    if (state.isRecentlyGetAllPlan == true) {
                      // state.isRecentlyGetAllPlan = false;
                      return _buildPlanList(context, state);
                    }
                    BlocProvider.of<PlanBloc>(context).add(GetAllPlan());
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is LoadPlanListFailed) {
                    return Center(child: Text(state.message));
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
              const SizedBox(height: 30,),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Lập kế hoạch',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildPlanList(BuildContext context, LoadPlanListSuccess state) {
    if (state.plans.isEmpty) {
      return const Center(
        child: Text(
          'Không có hành trình nào. Vui lòng thêm hành trình mới.',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      );
    }

    return Column(
      children: state.plans.map((plan) {
        return Column(
          children: [
            GestureDetector(
              onTap: () {
                final planBloc = BlocProvider.of<PlanBloc>(context);
                planBloc.add(GetPlanDetail(plan.id!));
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlocProvider.value(
                      value: planBloc,
                      child: PlanDetail(),
                    ),
                  ),
                );
              },
              onLongPress: () {
                showDialog(
                  context: context,
                  builder: (BuildContext dialogContext) {
                    return CustomPopup(
                      title: 'Xóa hành trình',
                      content: 'Bạn có chắc chắn muốn xóa hành trình này?',
                      confirmText: 'Xóa',
                      onConfirm: () {
                        final planBloc = BlocProvider.of<PlanBloc>(context);
                        planBloc.add(DeletePlan(plan.id!));
                        planBloc.add(GetAllPlan());
                        Navigator.of(dialogContext).pop();
                      },
                      onReturn: () {
                        Navigator.of(dialogContext).pop();
                      },
                    );
                  },
                );
              },
              child: BlocProvider.value(
                value: BlocProvider.of<PlanBloc>(context),
                child: PlanCard(
                  title: plan.name ?? '',
                  startDate: plan.startTime != null
                    ? '${plan.startTime!.month}/${plan.startTime!.day}/${plan.startTime!.year}'
                    : '',
                  endDate: plan.endTime != null
                    ? '${plan.endTime!.month}/${plan.endTime!.day}/${plan.endTime!.year}'
                    : '',
                  description: plan.members?.length.toString() ?? '',
                  backgroundImage: plan.coverUrl ?? cardSpringConcept,
                  planId: plan.id!,
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        );
      }).toList(),
    );
  }
}