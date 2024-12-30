import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:outernet/data/models/sites/common_site_model.dart';
import 'package:outernet/data/models/sites/site_request_model.dart';
import 'package:outernet/presentation/blocs/site_bloc/site_bloc.dart';
import 'package:outernet/presentation/blocs/site_bloc/site_event.dart';
import 'package:outernet/presentation/blocs/site_bloc/site_state.dart';
import 'package:outernet/presentation/helper_widgets/custom_popup.dart';

class ChooseSiteServiceGroup extends StatefulWidget {
  final int index;
  final AddNewSiteRequestModel requestModel;
  final Function(AddNewSiteRequestModel) updateRequestModel;
  
  const ChooseSiteServiceGroup({super.key, required this.index, required this.requestModel, required this.updateRequestModel});

  @override
  State<ChooseSiteServiceGroup> createState() => _ChooseSiteServiceGroupState();
}

class _ChooseSiteServiceGroupState extends State<ChooseSiteServiceGroup> with AutomaticKeepAliveClientMixin {
  List<SiteType> sitypes = [];
  List<String> locationTypes = [];
  String? selectedType;
  int? serviceIndex = 0;

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
    return BlocConsumer<SiteBloc,SiteState>(
      listener: (context, state) {
        if (state is LoadListSiteSuccess) {
          if (state.isGotGroupedService == true) {
            sitypes = state.siteTypes ?? [];
            locationTypes = [];
            for (SiteType service in sitypes) {
              locationTypes.add(service.name!);
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
          return _buildContent();
        }
        BlocProvider.of<SiteBloc>(context).add(GetAllSiteType());
        return const Center(child: CircularProgressIndicator(),);
      },
    );
  }

  Scaffold _buildContent() {
    return Scaffold(
    body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Lựa chọn loại hình địa điểm của bạn',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Hãy cho chúng tôi biết loại hình địa điểm của bạn để phục vụ cho việc phân loại.',
            style: TextStyle(fontSize: 16, height: 1.5,),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: locationTypes.isEmpty
              ? const Center(child: CircularProgressIndicator(),)
              : GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.8,
                ),
                itemCount: locationTypes.length,
                itemBuilder: (context, index) {
                  String type =  locationTypes[index];
                  bool isSelected = index == serviceIndex;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedType = type;
                        serviceIndex = index;
                      });

                      final bloc = BlocProvider.of<SiteBloc>(context);
                      (bloc.state as LoadListSiteSuccess).isGotGroupedService = true;

                      widget.requestModel.copyWith(
                        typeId: sitypes[serviceIndex!].id!,
                        requestModel: widget.requestModel,
                      );
                      
                      widget.updateRequestModel(
                        widget.requestModel
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12,),
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.orange.withOpacity(0.2) : Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: isSelected ? Colors.orange : Colors.grey.shade300,
                          width: 2,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          type,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: isSelected ? Colors.orange : Colors.black87,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    ),
  );
  }
}