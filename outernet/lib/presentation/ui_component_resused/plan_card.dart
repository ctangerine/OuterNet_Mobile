import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:outernet/data/data_sources/local_datasouces/drift_database.dart';
import 'package:outernet/data/data_sources/local_datasouces/drift_database_provider.dart';
import 'package:outernet/data/models/sites/site_request_model.dart';
import 'package:outernet/domain/entities/plan_entity.dart';
import 'package:outernet/presentation/blocs/plan_bloc/plan_bloc.dart';
import 'package:outernet/presentation/blocs/plan_bloc/plan_state.dart';
import 'package:outernet/presentation/screens/asset_links.dart';
import 'package:outernet/presentation/themes.dart';

class PlanCard extends StatefulWidget {
  final String title;
  final String description;
  final String startDate;
  final String endDate;
  final String backgroundImage;
  final int? planId;
  final AppDatabase _db = dbProvider.database;

  PlanCard._({
    super.key,
    required this.title,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.backgroundImage,
    this.planId,
  });

  factory PlanCard({
    Key? key,
    required String title,
    String description = "",
    String? startDate,
    String? endDate,
    String? backgroundImage,
    int? planId,
  }) {
    return PlanCard._(
      key: key,
      title: title,
      description: description,
      startDate: startDate ?? "${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}",
      endDate: endDate ?? "${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}",
      backgroundImage: backgroundImage ?? category1,
      planId: planId,
    );
  }

  @override
  _PlanCardState createState() => _PlanCardState();
}

class _PlanCardState extends State<PlanCard> {
  late String _backgroundImage;

  @override
  void initState() {
    super.initState();
    _backgroundImage = widget.backgroundImage;
  }

  void _showThemeChooser() {
    showThemeChooserPopup(context, (selectedTheme) async {
      final bloc = BlocProvider.of<PlanBloc>(context);
      await widget._db.upsertPlan(
        widget.planId,
        (bloc.state as LoadPlanListSuccess).plans.firstWhere((e) => e.id! == widget.planId).copyWith(coverUrl: selectedTheme)
      );

      setState(() {
        _backgroundImage = selectedTheme;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(_backgroundImage),
            fit: BoxFit.fitWidth,
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.15), BlendMode.darken),
          ),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: AppTextStyles.heading1Semibold.copyWith(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Icon(Iconsax.calendar, color: Colors.white, size: 24),
                const SizedBox(width: 8),
                Text(
                  '${widget.startDate} - ${widget.endDate}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Icon(Iconsax.user_tag, color: Colors.white, size: 24),
                const SizedBox(width: 8),
                Text(
                  '${widget.description.isNotEmpty ? widget.description : 0} người tham gia',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: _showThemeChooser,
                  child: const Icon(
                    Icons.more_horiz,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void showThemeChooserPopup(BuildContext context, Function(String) onThemeSelected) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Choose a Theme'),
        content: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                leading: Image.asset(cardSpringConcept, width: 50, height: 50),
                title: const Text('Spring Concept'),
                onTap: () {
                  onThemeSelected(cardSpringConcept);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Image.asset(cardSummerConcept, width: 50, height: 50),
                title: const Text('Summer Concept'),
                onTap: () {
                  onThemeSelected(cardSummerConcept);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Image.asset(cardWinterConcept, width: 50, height: 50),
                title: const Text('Winter Concept'),
                onTap: () {
                  onThemeSelected(cardWinterConcept);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Image.asset(cardMountainConcept, width: 50, height: 50),
                title: const Text('Mountain Concept'),
                onTap: () {
                  onThemeSelected(cardMountainConcept);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}