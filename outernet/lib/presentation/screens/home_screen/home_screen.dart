import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:outernet/presentation/blocs/UserBloc/user_bloc.dart';
import 'package:outernet/presentation/helper_widgets/image_handler.dart';
import 'package:outernet/presentation/module_provider/init_injections.dart';
import 'package:outernet/presentation/screens/asset_links.dart';
import 'package:outernet/presentation/themes.dart';
import 'package:outernet/presentation/ui_component_resused/images_carousel.dart';

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
        )
      ],
      child: Builder(
        builder: (context) {
          return const HomeScreenContent();
        }
      ),
    );
  }
}


class HomeScreenContent extends StatelessWidget {
  const HomeScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildHeroSection(context),
            const SizedBox(height: 20),
            _buildIntroductionSection(context),
            const SizedBox(height: 20),
            _buildSiteSuggestions(context),
            const SizedBox(height: 20),
            _buildAddSiteSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context) {
    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: [
          ImageHandler(
            imageUrl: homeScreenn,
            defaultImage: homeScreenn,
            width: MediaQuery.of(context).size.width,
            height: 250,
            fit: BoxFit.cover,
          ),
          // Positioned.fill(
          //   child: Container(
          //     color: Colors.black.withOpacity(0.2),
          //   ),
          // ),
          // SizedBox(
          //   width: 300,
          //   child: Text(
          //   "\"chúng ta đi không phải để đến nơi, mà để đi, để thấy, để nghe, để trải nghiệm, để chia sẻ, để đồng cảm, để ghi lại những câu chuyện, những kỷ niệm, những cảm xúc trên hành trình đời mình.\"",
          //   style: GoogleFonts.fuzzyBubbles(
          //     textStyle: AppTextStyles.body1Regular,
          //     fontSize: 15,
          //     height: 1.5,
          //     color: const Color.fromARGB(221, 255, 255, 255),
          //     fontWeight: FontWeight.w900
          //   ),
          //   textAlign: TextAlign.center,
          // ),
          // ),
        ],
      ),
    );
  }

  Widget _buildIntroductionSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _quoteSection(),
        ],
      ),
    );
  }

  Container _quoteSection() {
    return Container(
      // decoration: BoxDecoration(
      //     border: Border.all(
      //   color: Colors.black87.withOpacity(0.8),
      //   width: 1,
      // )),
      // padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Text(
            "\"Chúng ta đi không phải để đến nơi, mà để đi, để thấy, để nghe, để trải nghiệm, để chia sẻ, để đồng cảm, để ghi lại những câu chuyện, những kỷ niệm, những cảm xúc trên hành trình cuộc đời mình.\"",
            style: GoogleFonts.fuzzyBubbles(
              textStyle: AppTextStyles.body1Regular,
              fontSize: 15,
              height: 1.4,
              color: AppColors.textOnMainTheme,
              fontWeight: FontWeight.w400,
              letterSpacing: 1.1
            ),
            textAlign: TextAlign.center,
          ),
          //SizedBox(height: 10),
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
      ),
    );
  }

  Widget _buildSiteSuggestions(BuildContext context) {
    final provinces = ['Huế', 'Đà Nẵng', 'Quảng Nam'];
    final provinceImages = [category1, category2, category3];
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
                  'Điểm đến hàng được được đề xuất cho bạn',
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
          ImagesCarousel(
            images: provinceImages,
            defaultImage: category1,
            imagesDescription: provinces,
            width: 230,
            fit: BoxFit.cover,
            viewportFraction: 0.55,
            isEnlarge: false,
          ),
        ],
      ),
    );
  }

  Widget _buildAddSiteSection(BuildContext context) {
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
                // Navigator.pushNamed(context, Routes.addSite);
              },
              label: const Text('Thêm địa điểm mới', style: AppTextStyles.body1Semibold,),
            ),
          ),
        ],
      ),
    );
  }
}