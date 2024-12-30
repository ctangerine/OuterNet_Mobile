import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:outernet/data/models/plan/plan_request_model.dart';
import 'package:outernet/domain/entities/plan_entity.dart';
import 'package:outernet/presentation/blocs/plan_bloc/plan_bloc.dart';
import 'package:outernet/presentation/blocs/plan_bloc/plan_events.dart';
import 'package:outernet/presentation/blocs/plan_bloc/plan_state.dart';
import 'package:outernet/presentation/helper_widgets/custom_popup.dart';
import 'package:outernet/presentation/themes.dart';

class SiteDetailsPopup extends StatefulWidget {
  final int siteId;
  final int planId;
  final PlanEntity plan;
  final PlanBloc planBloc;

  const SiteDetailsPopup({
    super.key,
    required this.siteId,
    required this.plan,
    required this.planId,
    required this.planBloc,
  });

  @override
  _SiteDetailsPopupState createState() => _SiteDetailsPopupState();
}

class _SiteDetailsPopupState extends State<SiteDetailsPopup> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  DateTime? _startTime;
  DateTime? _endTime;

  @override
  Widget build(BuildContext context) {
    return BlocListener<PlanBloc, PlanState> (
      listener:  (context, state) {
        if (state is LoadPlanListSuccess) {
          if (state.isRecentlyAddSite == true) {
            state.isRecentlyAddSite = false;
            showDialog(
              context: context,
              builder: (context) {
                return CustomPopup(
                  title: 'Thêm địa điểm',
                  content: 'Thêm địa điểm vào kế hoạch thành công',
                  confirmText: 'OK',
                  onConfirm: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  },
                );
              }
            );
          }
        }
      },
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Thêm thông tin địa điểm',
                  style: AppTextStyles.heading1Medium,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Tên địa điểm',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập tên địa điểm';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: 'Thời gian bắt đầu',
                    hintText: _startTime == null
                        ? 'Chọn thời gian'
                        : DateFormat('dd/MM/yyyy HH:mm').format(_startTime!),
                  ),
                  onTap: () async {
                    final picked = await showDatePicker(
                      context: context,
                      initialDate: widget.plan.startTime!,
                      firstDate: widget.plan.startTime!,
                      lastDate: widget.plan.endTime!,
                    );
                    if (picked != null) {
                      final time = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );
                      if (time != null) {
                        setState(() {
                          _startTime = DateTime(
                            picked.year,
                            picked.month,
                            picked.day,
                            time.hour,
                            time.minute,
                          );
                        });
                      }
                    }
                  },
                  validator: (value) {
                    if (_startTime == null) {
                      return 'Vui lòng chọn thời gian bắt đầu';
                    }
                    if (_startTime!.isBefore(widget.plan.startTime!) ||
                        _startTime!.isAfter(widget.plan.endTime!)) {
                      return 'Thời gian bắt đầu phải trong khoảng thời gian của kế hoạch';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: 'Thời gian kết thúc',
                    hintText: _endTime == null
                        ? 'Chọn thời gian'
                        : DateFormat('dd/MM/yyyy HH:mm').format(_endTime!),
                  ),
                  onTap: () async {
                    final picked = await showDatePicker(
                      context: context,
                      initialDate: widget.plan.startTime!,
                      firstDate: widget.plan.startTime!,
                      lastDate: widget.plan.endTime!,
                    );
                    if (picked != null) {
                      final time = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );
                      if (time != null) {
                        setState(() {
                          _endTime = DateTime(
                            picked.year,
                            picked.month,
                            picked.day,
                            time.hour,
                            time.minute,
                          );
                        });
                      }
                    }
                  },
                  validator: (value) {
                    if (_endTime == null) {
                      return 'Vui lòng chọn thời gian kết thúc';
                    }
                    if (_startTime != null && _endTime!.isBefore(_startTime!)) {
                      return 'Thời gian kết thúc phải sau thời gian bắt đầu';
                    }
                    if (_endTime!.isBefore(widget.plan.startTime!) ||
                        _endTime!.isAfter(widget.plan.endTime!)) {
                      return 'Thời gian kết thúc phải trong khoảng thời gian của kế hoạch';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                FilledButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      PlanSiteManagementRequestModel request = PlanSiteManagementRequestModel(
                        siteId: widget.siteId,
                        name: _nameController.text,
                        startTime: _startTime!,
                        endTime: _endTime!,
                      );
                      widget.planBloc.add(AddSiteToPlan(request, widget.planId));
                      // Navigator.of(context).pop();
                    }
                  },
                  child: const Text('Thêm địa điểm vào kế hoạch này'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}