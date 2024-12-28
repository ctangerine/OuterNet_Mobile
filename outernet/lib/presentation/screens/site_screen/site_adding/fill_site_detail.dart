import 'package:flutter/material.dart';
import 'package:outernet/data/models/sites/site_request_model.dart';
import 'package:outernet/env/log_service.dart';
import 'package:outernet/presentation/helper_widgets/image_handler.dart';
import 'package:outernet/presentation/screens/asset_links.dart';

class FillLocationInfo extends StatefulWidget {
  final int index;
  final AddNewSiteRequestModel requestModel;
  final Function(AddNewSiteRequestModel) updateRequestModel;

  const FillLocationInfo({super.key, required this.index, required this.requestModel, required this.updateRequestModel});

  @override
  _FillLocationInfoState createState() => _FillLocationInfoState();
}

class _FillLocationInfoState extends State<FillLocationInfo> with AutomaticKeepAliveClientMixin {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController websiteController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  String defaultMap = mapPlaceholder; // Placeholder cho bản đồ
  List<bool> openingDays = List.generate(7, (index) => false);
  List<OpeningTime> openingTimes = List.generate(7, (index) => OpeningTime.defaultInstance);

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    super.dispose();
    deactivate();    
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 16),
            _buildTextField(nameController, 'Tên địa điểm'),
            const SizedBox(height: 16),
            _buildTextField(websiteController, 'Website truy cập'),
            const SizedBox(height: 16),
            _buildTextField(phoneController, 'Số điện thoại liên hệ'),
            const SizedBox(height: 16),
            _buildTextField(addressController, 'Địa chỉ'),
            const SizedBox(height: 16),
            _buildMapPlaceholder(),
            const SizedBox(height: 16),
            _buildTextField(descriptionController, 'Giới thiệu về địa điểm', maxLines: 3),
            const SizedBox(height: 16),
            _buildOpeningHours(),
            const SizedBox(height: 16),
            _buildNextButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Thông tin địa điểm',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Text(
          'Hãy bắt đầu với một vài thông tin về địa điểm của bạn.',
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  Widget _buildTextField(TextEditingController controller, String labelText, {int maxLines = 1}) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(),
      ),
      onChanged:(value) {
        widget.requestModel.copyWith(
          siteName: nameController.text,
          website: websiteController.text,
          phoneNumbers: [phoneController.text],
          resolvedAddress: addressController.text,
          description: descriptionController.text,
          requestModel: widget.requestModel,
        );
        LogService().logger.i(widget.requestModel.toJson());
        widget.updateRequestModel(
          widget.requestModel
        );
        // LogService().logger.d(widget.requestModel.toJson());
      },
    );
  }

  Widget _buildMapPlaceholder() {
    return GestureDetector(
      onTap: () {
        widget.requestModel.copyWith(
          lat: 106.688,
          lng: 10.762,
          requestModel: widget.requestModel,
        );
        LogService().logger.i(widget.requestModel.toJson());
        widget.updateRequestModel(
          widget.requestModel
        );
      },
      child: ImageHandler(imageUrl: defaultMap, defaultImage: defaultMap),
    );
  }

  Widget _buildOpeningHours() {
    final days = [
      'Thứ Hai',
      'Thứ Ba',
      'Thứ Tư',
      'Thứ Năm',
      'Thứ Sáu',
      'Thứ Bảy',
      'Chủ Nhật'
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Giờ mở cửa (không bắt buộc)',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 7,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: openingDays[index],
                      onChanged: (value) {
                        setState(() {
                          openingDays[index] = value!;
                          openingTimes[index] = openingTimes[index].copyWith(
                            dayOfWeek: value? OpeningTime.convertToStringDay(index+1) : '0',
                          );
                          
                          widget.requestModel.copyWith(
                            openingTimes: openingTimes.where((e) => e.dayOfWeek != '0').toList(),
                            requestModel: widget.requestModel,
                          );

                          widget.updateRequestModel(
                            widget.requestModel
                          );

                          LogService().logger.i(widget.requestModel.toJson());
                        });
                      },
                    ),
                    Expanded(
                      child: Text(days[index]),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                if (openingDays[index]) ...[
                  Row(
                    children: [
                      Expanded(
                        child: TimePickerField(
                          label: 'Thời gian mở cửa',
                          selectedTime: openingTimes[index].getOpenTime(),
                          onTimePicked: (time) {
                            setState(() {
                              openingTimes[index] = openingTimes[index].copyWith(
                                openTime: OpeningTime.convertTimeOfDay(time),
                              );

                              widget.requestModel.copyWith(
                                openingTimes: openingTimes.where((e) => e.dayOfWeek != '0').toList(),
                                requestModel: widget.requestModel,
                              );

                              widget.updateRequestModel(
                                widget.requestModel
                              );
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: TimePickerField(
                          label: 'Thời gian đóng cửa',
                          selectedTime: openingTimes[index].getCloseTime(),
                          onTimePicked: (time) {
                            setState(() {
                              openingTimes[index] = openingTimes[index].copyWith(
                                closeTime: OpeningTime.convertTimeOfDay(time),
                              );

                              widget.requestModel.copyWith(
                                openingTimes: openingTimes.where((e) => e.dayOfWeek != '0').toList(),
                                requestModel: widget.requestModel,
                              );

                              widget.updateRequestModel(
                                widget.requestModel
                              );
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            );
          },
        ),
      ],
    );
  }

  Widget _buildNextButton() {
    return Center(
      child: FilledButton(
        onPressed: () {
          // Xử lý logic khi nhấn "Tiếp theo"
          print("Tên địa điểm: ${nameController.text}");
          print("Website: ${websiteController.text}");
          print("Số điện thoại: ${phoneController.text}");
          print("Địa chỉ: ${addressController.text}");
          print("Giới thiệu: ${descriptionController.text}");
        },
        child: const Text(
          'Tiếp theo',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}

class TimePickerField extends StatelessWidget {
  final String label;
  final TimeOfDay? selectedTime;
  final ValueChanged<TimeOfDay> onTimePicked;

  const TimePickerField({
    super.key,
    required this.label,
    required this.selectedTime,
    required this.onTimePicked,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: true,
      onTap: () async {
        TimeOfDay? time = await showTimePicker(
          context: context,
          initialTime: selectedTime ?? TimeOfDay.now(),
        );
        if (time != null) {
          onTimePicked(time);
        }
      },
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
        suffixIcon: const Icon(Icons.access_time),
      ),
      controller: TextEditingController(
        text: selectedTime != null
            ? selectedTime!.format(context)
            : '--:--',
      ),
    );
  }
}