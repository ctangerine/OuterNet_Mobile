import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

class AddNewSiteToPlanPopup extends StatefulWidget {
  final String? title;
  final String? startDate;
  final String? endDate;

  const AddNewSiteToPlanPopup({
    super.key,
    this.title = '',
    this.startDate = '',
    this.endDate = '',
  });

  @override
  _AddNewSiteToPlanPopupState createState() => _AddNewSiteToPlanPopupState();
}

class _AddNewSiteToPlanPopupState extends State<AddNewSiteToPlanPopup> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  DateTime? _startDate;
  DateTime? _endDate;
  String? _startDateError;
  String? _endDateError;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // const SizedBox(height: 15,),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: (widget.title?.isEmpty ?? true) ? 'Tên Kế Hoạch' : widget.title,
                  icon: Icon(Iconsax.pen_add),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập tên kế hoạch';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              GestureDetector(
                onTap: () => _selectDate(context, true),
                child: AbsorbPointer(
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: (widget.startDate?.isEmpty ?? true) ? 'Thời Gian Bắt Đầu' : widget.startDate,
                      errorText: _startDateError,
                      icon: Icon(Iconsax.calendar),
                    ),
                    controller: TextEditingController(
                      text: _startDate == null
                          ? ''
                          : DateFormat('yyyy-MM-dd').format(_startDate!),
                    ),
                    validator: (value) {
                      if (_startDate == null) {
                        return 'Vui lòng chọn thời gian bắt đầu';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              GestureDetector(
                onTap: () => _selectDate(context, false),
                child: AbsorbPointer(
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: (widget.endDate?.isEmpty ?? true) ? 'Thời Gian Kết Thúc' : widget.endDate,
                      errorText: _endDateError,
                      icon: Icon(Iconsax.calendar),
                    ),
                    controller: TextEditingController(
                      text: _endDate == null
                          ? ''
                          : DateFormat('yyyy-MM-dd').format(_endDate!),
                    ),
                    validator: (value) {
                      if (_endDate == null) {
                        return 'Vui lòng chọn thời gian kết thúc';
                      } else if (_endDate!.isBefore(_startDate!)) {
                        return 'Thời gian kết thúc phải sau thời gian bắt đầu';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              FilledButton(
                onPressed: _submitForm,
                child: Text('Tạo Mới'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context, bool isStartDate) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      setState(() {
        if (isStartDate) {
          _startDate = pickedDate;
          if (_endDate != null && _endDate!.isBefore(_startDate!)) {
            _endDateError = 'Thời gian kết thúc phải sau thời gian bắt đầu';
          } else {
            _startDateError = null;
            _endDateError = null;
          }
        } else {
          _endDate = pickedDate;
          if (_endDate!.isBefore(_startDate!)) {
            _endDateError = 'Thời gian kết thúc phải sau thời gian bắt đầu';
          } else {
            _endDateError = null;
          }
        }
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }
}
