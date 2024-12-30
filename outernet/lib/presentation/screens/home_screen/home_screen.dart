import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:outernet/data/data_sources/dio_network/base_api_service.dart';
import 'package:outernet/domain/entities/site_entity.dart';
import 'package:outernet/presentation/blocs/UserBloc/user_bloc.dart';
import 'package:outernet/presentation/blocs/site_bloc/site_bloc.dart';
import 'package:outernet/presentation/blocs/site_bloc/site_event.dart';
import 'package:outernet/presentation/blocs/site_bloc/site_state.dart';
import 'package:outernet/presentation/helper_widgets/image_handler.dart';
import 'package:outernet/presentation/module_provider/init_injections.dart';
import 'package:outernet/presentation/screens/asset_links.dart';
import 'package:outernet/presentation/screens/site_screen/site_adding/add_new_site_screen.dart';
import 'package:outernet/presentation/screens/site_screen/site_detail/site_detail_screen.dart';
import 'package:outernet/presentation/themes.dart';
import 'package:outernet/presentation/ui_component_resused/images_carousel.dart';
import 'package:outernet/presentation/ui_component_resused/site_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>(
          create: (context) {
            try {
              return context.read<UserBloc>();
            } catch (e) {
              return sl<UserBloc>();
            }
          },
        ),
        BlocProvider<SiteBloc>(
          create: (context) {
            try {
              return BlocProvider.of<SiteBloc>(context);
            } catch (e) {
              return sl<SiteBloc>();
            }
          },
        ),
      ],
      child: const HomeScreenContent(),
    );
  }
}

class HomeScreenContent extends StatefulWidget {
  const HomeScreenContent({super.key});

  @override
  _HomeScreenContentState createState() => _HomeScreenContentState();
}

class _HomeScreenContentState extends State<HomeScreenContent> {
  @override
  void initState() {
    super.initState();
    final bloc = BlocProvider.of<SiteBloc>(context);
    bloc.add(GetDiscoverySites(1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            HeroSection(),
            SizedBox(height: 20),
            IntroductionSection(),
            SizedBox(height: 20),
            SiteSuggestions(),
            SizedBox(height: 20),
            AddSiteSection(),
          ],
        ),
      ),
    );
  }
}

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ImageHandler(
          imageUrl: homeScreenn,
          defaultImage: homeScreenn,
          width: MediaQuery.of(context).size.width,
          height: 250,
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}

class IntroductionSection extends StatelessWidget {
  const IntroductionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          QuoteSection(),
        ],
      ),
    );
  }
}

class QuoteSection extends StatelessWidget {
  const QuoteSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "\"Chúng ta đi không phải để đến nơi, mà để đi, để thấy, để nghe, để trải nghiệm, để chia sẻ, để đồng cảm, để ghi lại những câu chuyện, những kỷ niệm, những cảm xúc trên hành trình cuộc đời mình.\"",
          style: GoogleFonts.fuzzyBubbles(
            textStyle: AppTextStyles.body1Regular,
            fontSize: 15,
            height: 1.4,
            color: AppColors.textOnMainTheme,
            fontWeight: FontWeight.w400,
            letterSpacing: 1.1,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          "- vô danh",
          style: GoogleFonts.fuzzyBubbles(
            textStyle: AppTextStyles.body1Regular,
            fontSize: 15,
            height: 1.4,
            color: AppColors.textOnMainTheme,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.italic,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class SiteSuggestions extends StatelessWidget {
  const SiteSuggestions({super.key});

  @override
  Widget build(BuildContext context) {
    final provinces = ['Huế', 'Đà Nẵng', 'Quảng Nam'];
    final provinceImages = [category1, category2, category3];
    final bloc = BlocProvider.of<SiteBloc>(context);

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Khám phá đặc trưng tỉnh thành trên mọi miền đất nước',
                  style: AppTextStyles.heading1Medium.copyWith(
                    fontSize: 24,
                    height: 1.3,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Cùng du ngoạn để hiểu hết đất nước mình',
                  style: AppTextStyles.body1Medium.copyWith(
                    letterSpacing: 1.2,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          ImagesCarousel(
            images: provinceImages,
            defaultImage: category1,
            imagesDescription: provinces,
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Điểm đến hàng đầu được được đề xuất cho bạn',
                  style: AppTextStyles.heading1Medium.copyWith(
                    fontSize: 24,
                    height: 1.3,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Những địa điểm này được gợi ý cho bạn, hãy thử trải nghiệm',
                  style: AppTextStyles.body1Medium.copyWith(
                    letterSpacing: 1.2,
                    fontWeight: FontWeight.w400,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          BlocConsumer<SiteBloc, SiteState>(
            listener: (context, state) {
            },
            builder: (context, state) {
              if (state is LoadListSiteSuccess) {
                if (state.isListRecentlyChanged == true) {
                  state.isListRecentlyChanged = false;
                  return _buildSiteList(context, state.sites);
                } else {
                  if (state.message != null && state.message!.isNotEmpty) {
                    final bloc = BlocProvider.of<SiteBloc>(context);
                    bloc.add(GetDiscoverySites(1));
                  }
                  return const Center(
                    child: Text('Đang tải danh sách địa điểm, vui lòng chờ ...'),
                  );
                }
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSiteList(BuildContext context, List<SiteEntity> sites) {
    return SizedBox(
      height: 260 * 0.6 + 50, // Set a fixed height for the horizontal ListView
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: sites.length,
        itemBuilder: (context, index) {
          final site = sites[index];
          return GestureDetector(
            onTap: () {
              final bloc = BlocProvider.of<SiteBloc>(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BlocProvider.value(
                    value: bloc,
                    child: SiteDetailScreen(siteId: site.siteId!,),
                  ),
                ),
              ).then((_) {
                try {
                  bloc.add(GetDiscoverySites(1)); // Trigger the event when coming back
                } catch (e) {
                  logger.e('I cant wake the bloc, error: $e');
                }
                
              });
            },
            child: _buildSiteCardWithGesture(context, site),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(width: 20);
        },
      ),
    );
  }

  SizedBox _buildSiteCardWithGesture(BuildContext context, SiteEntity site) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.6,
      height: 260 * 0.6 + 50,
      child: SiteCard(site: site),
    );
  }
}

class AddSiteSection extends StatelessWidget {
  const AddSiteSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Travel Buddy bị thiếu một địa điểm?',
            style: AppTextStyles.heading1Semibold,
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 40,
            child: FilledButton.icon(
              icon: const Icon(Iconsax.location),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddNewSiteScreen(),
                  ),
                );
              },
              label: const Text(
                'Thêm địa điểm mới',
                style: AppTextStyles.body1Semibold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}