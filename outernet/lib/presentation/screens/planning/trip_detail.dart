import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:outernet/domain/entities/site_entity.dart';
import 'package:outernet/presentation/blocs/plan_bloc/plan_bloc.dart';
import 'package:outernet/presentation/blocs/plan_bloc/plan_state.dart';
import 'package:outernet/presentation/themes.dart';
import 'package:outernet/presentation/ui_component_resused/site_card.dart';

class TripDetail extends StatefulWidget {
  const TripDetail({super.key});

  @override
  State<TripDetail> createState() => _TripDetailState();
}

class _TripDetailState extends State<TripDetail> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final state = BlocProvider.of<PlanBloc>(context).state;

    if (state is LoadPlanListSuccess && state.specificPlan.sites!.isNotEmpty && state.isRecentlyGetPlanDetail == true) {
      final List<SiteEntity> siteList = state.specificPlan.sites!;
      final List<String> timeStarts = siteList.map((site) {
        return site.startTime != null ? '${site.startTime!.hour}:${site.startTime!.minute}' : '';
      }).toList();
      final List<String> timeEnds = siteList.map((site) {
        return site.endTime != null ? '${site.endTime!.hour}:${site.endTime!.minute}' : '';
      }).toList(); 

      return ListView.separated(
        padding: const EdgeInsets.all(20.0),
        itemCount: siteList.length,
        itemBuilder: (context, index) {
          return SizedBox(
            width: MediaQuery.of(context).size.width - 40,
            height: 260,
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                SiteCard(site: siteList[index]),
                _ultilitiesButton(context, siteList[index]),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              Row(
                children: [
                  const Icon(Iconsax.clock, size: 24, color: Colors.black87),
                  const SizedBox(width: 5),
                  Text(
                    'Start: ${timeStarts[index]} - End: ${timeEnds[index]}',
                    style: AppTextStyles.body1Semibold,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Divider(),
              const SizedBox(height: 20),
            ],
          );
        },
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Ở đây hơi trống trải, hãy thêm hành trình của bạn!',
                style: AppTextStyles.heading1Semibold,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              FilledButton(
                onPressed: () {},
                child: const Text(
                  'Thêm hành trình',
                  style: AppTextStyles.body1Semibold,
                ),
              ),
            ],
          ),
        ),
      );
    }
  }

  Widget _ultilitiesButton(BuildContext context, SiteEntity site) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        IconButton(
          icon: Icon(Icons.cancel_outlined, size: 24, color: Colors.white70),
          onPressed: () {},
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const SizedBox(width: 10),
                Icon(Iconsax.arrow_left, size: 24, color: Colors.white38),
              ],
            ),
            Row(
              children: [
                Icon(Iconsax.arrow_right_1, size: 24, color: Colors.white38),
                const SizedBox(width: 10),
              ],
            ),
          ],
        ),
        IconButton(
          icon: Icon(Iconsax.edit, size: 24, color: Colors.black87),
          onPressed: () {},
        )
      ],
    );
  }
}