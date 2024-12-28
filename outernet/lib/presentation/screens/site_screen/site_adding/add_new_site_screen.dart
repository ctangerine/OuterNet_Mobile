import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:outernet/data/models/sites/site_request_model.dart';
import 'package:outernet/env/log_service.dart';
import 'package:outernet/presentation/blocs/media_bloc/media_bloc.dart';
import 'package:outernet/presentation/blocs/site_bloc/site_bloc.dart';
import 'package:outernet/presentation/blocs/site_bloc/site_event.dart';
import 'package:outernet/presentation/helper_widgets/custom_popup.dart';
import 'package:outernet/presentation/module_provider/init_injections.dart';
import 'package:outernet/presentation/screens/site_screen/site_adding/business_info.dart';
import 'package:outernet/presentation/screens/site_screen/site_adding/choose_site_service.dart';
import 'package:outernet/presentation/screens/site_screen/site_adding/fill_site_detail.dart';
import 'package:outernet/presentation/screens/site_screen/site_adding/site_image_upload.dart';
import 'package:outernet/presentation/screens/site_screen/site_adding/term_and_condition.dart';
import 'package:outernet/presentation/themes.dart';
import 'package:provider/provider.dart';

class AddNewSiteScreen extends StatelessWidget {
  final logger = LogService().logger;

  AddNewSiteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider<SiteBloc>(
          create: (context) {
            try {
              return sl<SiteBloc>()..add(GetAllSiteType());
            } catch (e) {
              logger.e('There is an error here: $e');
              final title = 'Error';
              final content = 'An error occurred while loading services.';
              final confirmText = 'OK';
              onConfirm() => Navigator.of(context).pop();
              showDialog(
                context: context,
                builder: (context) => CustomPopup(
                  title: title,
                  content: content,
                  confirmText: confirmText,
                  onConfirm: onConfirm,
                ),
              );
              rethrow;
            }
          },
        ),
        BlocProvider<MediaBloc>(
          create: (context) {
            try {
              return sl<MediaBloc>();
            } catch (e) {
              logger.e('There is an error here: $e');
              final title = 'Error';
              final content = 'An error occurred while loading services.';
              final confirmText = 'OK';
              onConfirm() => Navigator.of(context).pop();
              showDialog(
                context: context,
                builder: (context) => CustomPopup(
                  title: title,
                  content: content,
                  confirmText: confirmText,
                  onConfirm: onConfirm,
                ),
              );
              rethrow;
            }
          },
        )
      ],
      child: Builder(
        builder: (context) {
          return const AddNewSiteScreenContent();
        }
      ),
    );
  }
}

class AddNewSiteScreenContent extends StatefulWidget {
  const AddNewSiteScreenContent({super.key});

  @override
  State<AddNewSiteScreenContent> createState() => _AddNewSiteScreenContentState();
}

class _AddNewSiteScreenContentState extends State<AddNewSiteScreenContent>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  late AddNewSiteRequestModel _requestModel = AddNewSiteRequestModel.defaultInstance;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this, initialIndex: 0);
    _requestModel = AddNewSiteRequestModel();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _updateRequestModel(AddNewSiteRequestModel updatedModel) {
    setState(() {
      _requestModel.copyWith(
        siteName: updatedModel.siteName,
        lat: updatedModel.lat,
        lng: updatedModel.lng,
        resolvedAddress: updatedModel.resolvedAddress,
        website: updatedModel.website,
        typeId: updatedModel.typeId,
        phoneNumbers: updatedModel.phoneNumbers,
        services: updatedModel.services,
        fees: updatedModel.fees,
        openingTimes: updatedModel.openingTimes,
        medias: updatedModel.medias,
        requestModel: _requestModel
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildGreeting(),
            Expanded(
              child: _buildTabContent(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGreeting() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'THÊM ĐỊA ĐIỂM MỚI',
            style: AppTextStyles.heading1Semibold.copyWith(
              fontSize: 18,
              letterSpacing: 1.15,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Vui lòng hoàn thành các bước sau để thêm địa điểm của bạn vào hệ thống',
            style: AppTextStyles.heading2Regular.copyWith(
              height: 1.7,
              letterSpacing: 1.15,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabContent() {
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          labelColor: AppColors.primary,
          unselectedLabelColor: Colors.black87,
          indicatorColor: AppColors.primary,
          labelStyle: AppTextStyles.body1Semibold,
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          tabs: const [
            Tab(icon: Icon(Iconsax.sun_1)),
            Tab(icon: Icon(Iconsax.moon)),
            Tab(icon: Icon(Iconsax.cloud)),
            Tab(icon: Icon(Iconsax.sun_fog)),
            Tab(icon: Icon(Iconsax.sun)),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              BlocProvider.value(
                value: BlocProvider.of<SiteBloc>(context),
                child: Builder(
                  builder: (context) {
                    return ChooseSiteServiceGroup(
                      index: 1,
                      requestModel: _requestModel,
                      updateRequestModel: _updateRequestModel,
                    );
                  }
                ),
              ),
              BlocProvider.value(
                value: BlocProvider.of<SiteBloc>(context),
                child: Builder(
                  builder: (context) {
                    return FillLocationInfo(
                      index: 2,
                      requestModel: _requestModel,
                      updateRequestModel: _updateRequestModel,
                    );
                  }
                ),
              ),
              BlocProvider.value(
                value: BlocProvider.of<SiteBloc>(context),
                child: Builder(
                  builder: (context) {
                    return BusinessInfoScreen(
                      index: 3,
                      requestModel: _requestModel,
                      updateRequestModel: _updateRequestModel,
                    );
                  }
                ),
              ),
              MultiBlocProvider(
                providers: [
                  BlocProvider.value(
                    value: BlocProvider.of<SiteBloc>(context),
                  ),
                  BlocProvider.value(
                    value: BlocProvider.of<MediaBloc>(context),
                  ),
                ],
                child: Builder(
                  builder: (context) {
                    return AddSitePhotos(
                      index: 4,
                      requestModel: _requestModel,
                      updateRequestModel: _updateRequestModel,
                    );
                  }
                ),
              ),
              BlocProvider.value(
                value: BlocProvider.of<SiteBloc>(context),
                child: Builder(
                  builder: (context) {
                    return TermAndCondition(
                      index: 5,
                      requestModel: _requestModel,
                      updateRequestModel: _updateRequestModel,
                    );
                  }
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
