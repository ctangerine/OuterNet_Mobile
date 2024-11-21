import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:outernet/data/models/sites/site_by_loc_response_model.dart';
import 'package:outernet/data/models/sites/site_request_model.dart';
import 'package:outernet/data/models/sites/site_response_model.dart';
import 'package:outernet/data/models/sites/site_review_response_model.dart';
import 'package:outernet/presentation/helper_widgets/custom_popup.dart';
import 'package:outernet/presentation/ui_component_resused/site_card.dart';
import 'package:outernet/presentation/blocs/site_bloc/site_bloc.dart';
import 'package:outernet/presentation/blocs/site_bloc/site_event.dart';
import 'package:outernet/presentation/blocs/site_bloc/site_state.dart';
import 'package:outernet/presentation/themes.dart';

class SiteNearbyPart extends StatefulWidget {
  final SiteResponseModel siteDetail;
  final SiteReviewResponseModel siteReview;

  const SiteNearbyPart({super.key, required this.siteDetail, required this.siteReview});

  @override
  _SiteNearbyPartState createState() => _SiteNearbyPartState();
}

class _SiteNearbyPartState extends State<SiteNearbyPart> {
  String selectedRadius = '1km';
  late ScrollController _scrollController;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _startAutoScroll();
  }

  @override
  void dispose() {
    _timer.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_scrollController.hasClients) {
        final maxScrollExtent = _scrollController.position.maxScrollExtent;
        final currentScrollPosition = _scrollController.position.pixels;
        final newScrollPosition = currentScrollPosition + 200;

        if (newScrollPosition >= maxScrollExtent) {
          _scrollController.jumpTo(0);
        } else {
          _scrollController.animateTo(
            newScrollPosition,
            duration: const Duration(seconds: 2),
            curve: Curves.easeInOut,
          );
        }
      }
    });
  }

  Future<Map<String, dynamic>> _fetchSiteNearby(BuildContext context, GetSiteRequestModel request) async {
    final siteBloc = context.read<SiteBloc>();
    if (siteBloc.state is LoadListSiteSuccess && (siteBloc.state as LoadListSiteSuccess).isSiteByLocChanged == true) {
      (siteBloc.state as LoadListSiteSuccess).isSiteByLocChanged = false;
      return {
        'siteNearBy': (siteBloc.state as LoadListSiteSuccess).siteByLoc,
      };
    }

    siteBloc.add(GetSiteByLocation(request));

    await for (final state in siteBloc.stream) {
      if (state is LoadListSiteSuccess && state.isSiteByLocChanged == true) {
        state.isSiteByLocChanged = false;
        return {
          'siteNearBy': state.siteByLoc,
        };
      } else if (state is LoadListSiteFailed) {
        throw Exception(state.message);
      }
    }

    throw Exception('Failed to load site nearby');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: _buildSiteNearbyBox(context, widget.siteDetail),
    );
  }

  Widget _buildSiteNearbyBox(BuildContext context, SiteResponseModel siteDetail) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Đi đâu gần đây', style: AppTextStyles.heading1Semibold),
        const SizedBox(height: 15),
        _buildRadiusDropdown(),
        const SizedBox(height: 15),
        _buildNearbySites(context, siteDetail),
        const SizedBox(height: 40),
      ],
    );
  }

  Widget _buildRadiusDropdown() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text('Trong bán kính ', style: AppTextStyles.body1Regular),
        const SizedBox(width: 10),
        SizedBox(
          height: 30,
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              dropdownColor: AppColors.maintheme,
              value: selectedRadius,
              items: <String>['1km', '3km', '5km', '10km'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    selectedRadius = newValue;
                  });
                }
              },
            ),
          ),
        ),
        const SizedBox(width: 5),
        const Text('quanh đây có:', style: AppTextStyles.body1Regular),
      ],
    );
  }

  Widget _buildNearbySites(BuildContext context, SiteResponseModel siteDetail) {
    return FutureBuilder<Map<String, dynamic>>(
      future: _fetchSiteNearby(context, GetSiteRequestModel(
        lat: siteDetail.lat,
        lng: siteDetail.lng,
        degRadius: {
          '1km': 0.01,
          '3km': 0.03,
          '5km': 0.05,
          '10km': 0.1,
        }[selectedRadius]!,
      )),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return _placeholderNearbyList();
        } else if (snapshot.hasError) {
          return Center(
            child: CustomPopup(
              title: 'Chi tiết địa điểm',
              content: 'Không thể tải các địa điểm liên quan gần đây.\nMã lỗi: ${snapshot.error}',
              confirmText: 'Đóng',
              onConfirm: () => Navigator.of(context).pop(),
              showAction: false,
              onReturn: () => Navigator.of(context).pop(),
            ),
          );
        } else if (snapshot.hasData) {
          final siteNearBy = snapshot.data!['siteNearBy'] as List<SiteByLocResponseModel>?;
          if (siteNearBy == null || siteNearBy.isEmpty) {
            return const Center(
              child: Text('Không có địa điểm nào gần đây.'),
            );
          }
          return _buildSiteNearbyList(siteNearBy);
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  Widget _buildSiteNearbyList(List<SiteByLocResponseModel> siteNearBy) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        height: 230,
        autoPlay: true,
        enlargeCenterPage: false,
        viewportFraction: 0.8,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        enableInfiniteScroll: true,
      ),
      itemCount: siteNearBy.length,
      itemBuilder: (context, index, realIndex) {
        return Container(
          margin: const EdgeInsets.only(right: 10),
          child: SiteCard(site: siteNearBy[index]),
        );
      },
    );
  }

  Widget _placeholderNearbyList() {
    final List<SiteByLocResponseModel> mockSites = List.generate(5, (index) => SiteByLocResponseModel.defaultInstance);
    return CarouselSlider.builder(
      options: CarouselOptions(
        height: 230,
        autoPlay: true,
        enlargeCenterPage: false,
        viewportFraction: 0.8,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        enableInfiniteScroll: true,
      ),
      itemCount: mockSites.length,
      itemBuilder: (context, index, realIndex) {
        return Container(
          margin: const EdgeInsets.only(right: 10),
          child: SiteCard(site: mockSites[index]),
        );
      },
    );
  }
}