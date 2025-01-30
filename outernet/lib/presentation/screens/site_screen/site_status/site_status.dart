import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:outernet/domain/entities/site_entity.dart';
import 'package:outernet/presentation/blocs/site_bloc/site_bloc.dart';
import 'package:outernet/presentation/blocs/site_bloc/site_event.dart';
import 'package:outernet/presentation/blocs/site_bloc/site_state.dart';
import 'package:outernet/presentation/module_provider/init_injections.dart';
import 'package:outernet/presentation/themes.dart';
import 'package:outernet/presentation/screens/asset_links.dart';
import 'package:outernet/presentation/ui_component_resused/images_carousel.dart';

class PublishedSitesPage extends StatefulWidget {
  const PublishedSitesPage({super.key});

  @override
  _PublishedSitesPageState createState() => _PublishedSitesPageState();
}

class _PublishedSitesPageState extends State<PublishedSitesPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SiteBloc>()..add(GetSiteStatus()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Quản lý địa điểm"),
          backgroundColor: AppColors.primary,
        ),
        body: DefaultTabController(
          length: 3,
          child: Column(
            children: [
              TabBar(
                labelColor: AppColors.primary,
                indicatorColor: AppColors.primary,
                overlayColor: WidgetStateProperty.all(Colors.transparent),
                tabs: [
                  Tab(text: "Đang chờ xét duyệt"),
                  Tab(text: "Đã được xét duyệt"),
                  Tab(text: "Bị từ chối"),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    _buildSiteList(context, "PENDING"),
                    _buildSiteList(context, "APPROVED"),
                    _buildSiteList(context, "REJECTED"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSiteList(BuildContext context, String status) {
    return BlocBuilder<SiteBloc, SiteState>(
      builder: (context, state) {
        if (state is LoadListSiteSuccess) {
          final filteredSites = state.sites.where((site) => site.status == status).toList();
          if (filteredSites.isEmpty) {
            return const Center(
              child: Text(
                'Không có địa điểm nào.',
                style: AppTextStyles.body1Regular,
              ),
            );
          }
          return ListView.separated(
            itemCount: filteredSites.length,
            itemBuilder: (context, index) {
              return _buildCombinedSiteCard(filteredSites[index]);
            },
            separatorBuilder: (context, index) => const SizedBox(height: 20),
          );
        } else if (state is SiteLoading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return const Center(
            child: Text(
              'Đã xảy ra lỗi. Vui lòng thử lại sau.',
              style: AppTextStyles.body1Regular,
            ),
          );
        }
      },
    );
  }

  Widget _buildCombinedSiteCard(SiteEntity site) {
    final imagesUrl = site.medias?.where((e) => e.mediaType == 'IMAGE').map((e) => e.url).whereType<String>().toList() ?? [category1];
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: AppColors.maintheme,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: ImagesCarousel(
              images: imagesUrl.isEmpty ? [category1] : imagesUrl,
              defaultImage: category1,
              width: double.infinity,
              height: 180,
              fit: BoxFit.fitWidth,
              viewportFraction: 1.0,
              isMargin: false,
              isBorder: false,
              isPadding: false,
              isAutoPlay: false,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Trạng thái và loại chỉnh sửa
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: site.status == "APPROVED"
                            ? AppColors.primary
                            : site.status == "PENDING"
                                ? Colors.orange
                                : Colors.red,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        site.status == "APPROVED"
                            ? "Đã duyệt"
                            : site.status == "PENDING"
                                ? "Đang chờ xét duyệt"
                                : "Bị từ chối",
                        style: AppTextStyles.body2Regular.copyWith(color: Colors.white),
                      ),
                    ),
                    const SizedBox(width: 12),
                    if (site.typeOfModification == 'MODIFIED')
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          'Đã chỉnh sửa',
                          style: AppTextStyles.body2Regular.copyWith(color: Colors.white),
                        ),
                      ),
                    if (site.typeOfModification == 'NEW')
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          'Địa điểm mới',
                          style: AppTextStyles.body2Regular.copyWith(color: Colors.white),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 8),
                // Tên địa điểm
                Text(
                  site.siteName ?? '',
                  style: AppTextStyles.title1Semibold,
                ),
                const SizedBox(height: 8),
                // Địa chỉ
                Row(
                  children: [
                    const Icon(Icons.location_on, size: 18, color: Colors.grey),
                    const SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        site.resolvedAddress ?? '',
                        style: AppTextStyles.body1Regular.copyWith(color: Colors.grey),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                // Ngày đăng
                Text(
                  "Đăng ngày ${site.createdAt}",
                  style: AppTextStyles.body2Regular.copyWith(color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}