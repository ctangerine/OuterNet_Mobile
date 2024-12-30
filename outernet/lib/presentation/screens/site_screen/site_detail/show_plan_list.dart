import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:outernet/domain/entities/plan_entity.dart';
import 'package:outernet/presentation/blocs/plan_bloc/plan_bloc.dart';
import 'package:outernet/presentation/blocs/plan_bloc/plan_events.dart';
import 'package:outernet/presentation/blocs/plan_bloc/plan_state.dart';
import 'package:outernet/presentation/module_provider/init_injections.dart';
import 'package:outernet/presentation/screens/site_screen/site_detail/add_site_to_plan_popup.dart';
import 'package:outernet/presentation/themes.dart';

class ShowPlanListPopup extends StatefulWidget {
  final int siteId;

  const ShowPlanListPopup({super.key, required this.siteId});

  @override
  _ShowPlanListPopupState createState() => _ShowPlanListPopupState();
}

class _ShowPlanListPopupState extends State<ShowPlanListPopup> {
  PlanBloc? _planBloc;
  PlanEntity? _selectedPlan;

  @override
  void initState() {
    super.initState();
    try {
      _planBloc = BlocProvider.of<PlanBloc>(context);
    } catch (e) {
      _planBloc = sl<PlanBloc>();
    }
    _planBloc!.add(GetAllPlan());
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: BlocProvider.value(
        value: _planBloc!,
        child: BlocBuilder<PlanBloc, PlanState>(
          builder: (context, state) {
            if (state is LoadPlanListSuccess) {
              if (state.isRecentlyGetAllPlan == true) {
                return _buildPlanList(context, state.plans);
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            } else {
              return const Center(
                child: Text('Có gì đó không đúng, hãy thử lại sau nhé!'),
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildPlanList(BuildContext context, List<PlanEntity> plans) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Chọn kế hoạch',
              style: AppTextStyles.heading1Medium,
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: plans.length,
              itemBuilder: (context, index) {
                final plan = plans[index];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedPlan = plan;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: _selectedPlan == plan ? Colors.green : Colors.transparent,
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
                        plan.name!,
                        style: AppTextStyles.heading1Semibold.copyWith(
                          height: 1.5,
                          letterSpacing: 1.15,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (plan.description != null) const SizedBox(height: 4),
                          Text(
                            plan.description!,
                            style: AppTextStyles.body1Semibold.copyWith(
                              height: 1.5,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Bắt đầu từ: ${plan.startTime!.day}/${plan.startTime!.month}/${plan.startTime!.year}',
                            style: AppTextStyles.body1Regular.copyWith(
                              height: 1.5,
                              letterSpacing: 1.15,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Kết thúc vào: ${plan.endTime!.day}/${plan.endTime!.month}/${plan.endTime!.year}',
                            style: AppTextStyles.body1Regular.copyWith(
                              height: 1.5,
                              letterSpacing: 1.15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: FilledButton(
              onPressed: _selectedPlan == null
                  ? null
                  : () {
                      _showSiteDetailsPopup(context);
                    },
              child: const Text('Thêm địa điểm vào kế hoạch này'),
            ),
          ),
        ],
      ),
    );
  }

  void _showSiteDetailsPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return BlocProvider.value(
          value: _planBloc!,
          child: SiteDetailsPopup(
            siteId: widget.siteId,
            planId: _selectedPlan!.id!,
            plan: _selectedPlan!,
            planBloc: _planBloc!,
          ),
        );
      },
    );
  }
}
