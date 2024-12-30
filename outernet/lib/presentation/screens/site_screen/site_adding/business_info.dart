import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:outernet/data/models/sites/common_site_model.dart';
import 'package:outernet/data/models/sites/site_request_model.dart';
import 'package:outernet/presentation/blocs/site_bloc/site_bloc.dart';
import 'package:outernet/presentation/blocs/site_bloc/site_event.dart';
import 'package:outernet/presentation/blocs/site_bloc/site_state.dart';
import 'package:outernet/presentation/helper_widgets/custom_popup.dart';

class BusinessInfoScreen extends StatefulWidget {
  final int index;
  final AddNewSiteRequestModel requestModel;
  final Function(AddNewSiteRequestModel) updateRequestModel;
  
  const BusinessInfoScreen({super.key, required this.index, required this.requestModel, required this.updateRequestModel});

  @override
  _BusinessInfoScreenState createState() => _BusinessInfoScreenState();
}

class _BusinessInfoScreenState extends State<BusinessInfoScreen> with AutomaticKeepAliveClientMixin {
  List<GroupedService> groupServices = []; // Danh sách nhóm dịch vụ
  List<Fee> costRanges = []; // Danh sách chi phí
  List<String> types = []; // Danh sách loại dịch vụ
  Map<int, Map<int, bool>> selectedTypes = {}; // Danh sách loại dịch vụ đã chọn
  bool isLoadedData = false;

  @override
  bool get wantKeepAlive => true;


  void addCostRange() {
    setState(() {
      costRanges.add(Fee.defaultInstance);
    });
  }

  @override
  void dispose() {
    super.dispose();
    deactivate();    
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    try {
      final bloc = BlocProvider.of<SiteBloc>(context);
      final state = bloc.state as LoadListSiteSuccess;

      if (state.isGotGroupedService == true) {
        isLoadedData = false;
        bloc.add(GetAllGroupedService(widget.requestModel.typeId!));
      }
    }
    catch (e) {
      logger.e(e);
      return CustomPopup(
        title: 'Đã xảy ra lỗi',
        content: 'Có lỗi xảy ra khi tải dữ liệu, vui lòng thử lại sau',
        confirmText: 'OK',
        onConfirm: () {
          Navigator.of(context).pop();
        },
      );
    }

    return BlocConsumer<SiteBloc, SiteState>(
      listener: (context, state) {
        if (state is LoadListSiteSuccess) {
          if (state.groupedServices != null) {
            groupServices = state.groupedServices ?? [];
            // state.isGotGroupedService = false;

            for (GroupedService service in groupServices) {
              types.add(service.serviceGroup?.serviceGroupName ?? 'Unknown Service Group');
              selectedTypes[service.serviceGroup!.id!] = {};
              for (var s in service.services!) {
                selectedTypes[service.serviceGroup!.id!]![s.id!] = false;
              }
            }
          }
        } 
        else {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return CustomPopup(
                title: 'Error',
                content: 'An error occurred again',
                confirmText: 'OK',
                onConfirm: () {
                  Navigator.of(context).pop();
                },
              );
            },
          );
        }
      },
      builder: (context, state) {
        if (state is LoadListSiteSuccess) {
          state.isGotGroupedService = false;
          return _buildContent();
        }
        logger.d('isLoadedData: $isLoadedData');

        return const Center(child: CircularProgressIndicator(),); 
      },
    );
  }

  Scaffold _buildContent() {
    return Scaffold(
    body: SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          const SizedBox(height: 16),
          _buildCostSection(),
          const SizedBox(height: 16),
          _buildServiceGroups(),
          const SizedBox(height: 16),
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
          'Thông tin doanh nghiệp',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Text(
          'Cung cấp thông tin cơ bản về doanh nghiệp của mình.',
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  Widget _buildCostSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Các loại chi phí',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: costRanges.length,
          itemBuilder: (context, index) {
            return Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: "Chi phí thấp nhất (VNĐ)",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      costRanges[index].feeLow= double.tryParse(value) ?? 0;
                    },
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: "Chi phí cao nhất (VNĐ)",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      costRanges[index].feeHigh = double.tryParse(value) ?? 0;
                    },
                  ),
                ),
                IconButton(
                  icon: const Icon(Iconsax.close_circle, color: Colors.black87),
                  onPressed: () {
                    setState(() {
                      costRanges.removeAt(index);
                    });
                  },
                ),
              ],
            );
          },
          separatorBuilder: (context, index) => const SizedBox(height: 16),
        ),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: addCostRange,
          child: const Text('+ Thêm chi phí'),
        ),
      ],
    );
  }

  Widget _buildServiceGroups() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: groupServices.map((groupService) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              groupService.serviceGroup?.serviceGroupName ?? 'Unknown Service Group',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: groupService.services!.map((service) {
                return FilterChip(
                  label: Text(service.serviceName ?? 'Unknown Service'),
                  selected: selectedTypes[groupService.serviceGroup!.id!]![service.id!] ?? false,
                  onSelected: (value) {
                    setState(() {
                      selectedTypes[groupService.serviceGroup!.id!]![service.id!] = value;

                      final List<int> selectedServiceIds = [];
                      for (var group in selectedTypes.values) {
                        for (var serviceId in group.keys) {
                          if (group[serviceId] == true) {
                            selectedServiceIds.add(serviceId);
                          }
                        }
                      }

                      widget.requestModel.copyWith(
                        services: selectedServiceIds,
                        requestModel: widget.requestModel,
                      );

                      logger.i('Selected services: $selectedServiceIds');
                      logger.i(widget.requestModel.toJson());

                      widget.updateRequestModel(
                        widget.requestModel
                      );
                    });
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
          ],
        );
      }).toList(),
    );
  }
}
