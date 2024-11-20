import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:outernet/presentation/helper_widgets/image_handler.dart';
import 'package:outernet/presentation/screens/asset_links.dart';
import 'package:outernet/presentation/themes.dart';
import 'package:outernet/presentation/ui_component_resused/images_carousel.dart';

class DiscoverCategories extends StatelessWidget {
  final imageList = [category1, category2, category3, category4, category5];
  final descriptions = [
    'Địa điểm tham quan',
    'Điểm đến giải trí',
    'Hòa vào thiên nhiên',
    'Khám phá ẩm thực',
    'Khách sạn & Resort'
  ];

  DiscoverCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                automaticallyImplyLeading: false,
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Iconsax.arrow_left_2, color: Colors.white),
                ),
                expandedHeight: 280.0,
                pinned: true,
                toolbarHeight: 65,
                backgroundColor: Colors.transparent,
                flexibleSpace: LayoutBuilder(
                  builder: (context, constraints) {
                    // Calculate scroll-dependent opacity
                    final scrolledExtent = (constraints.maxHeight - kToolbarHeight);
                    final opacity = (1 - (scrolledExtent / (280 - kToolbarHeight)))
                        .clamp(0.0, 1.0);

                    return Stack(
                      fit: StackFit.expand,
                      children: [
                        // Background Hero Image
                        const ImageHandler(
                          imageUrl: category1,
                          defaultImage: category1,
                          fit: BoxFit.cover,
                        ),
                        // Transparent Overlay
                        Container(
                          color: const Color.fromARGB(255, 112, 111, 111).withOpacity(0.5 * opacity),
                        ),
                        // Title and Search Bar
                        Positioned(
                          left: 40,
                          right: 16,
                          bottom: 5,
                          top: 10,
                          child: _buildSearchBar(),
                        ),
                      ],
                    );
                  },
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    const SizedBox(height: 20),
                    _buildGreetings(),
                    const SizedBox(height: 10),
                    _buildCategoriesHeader(),
                    ImagesCarousel(
                      images: imageList,
                      defaultImage: category1,
                      imagesDescription: descriptions,
                    ),
                    ImagesCarousel(
                      images: imageList,
                      defaultImage: category1,
                      imagesDescription: descriptions,
                    ),
                    ImagesCarousel(
                      images: imageList,
                      defaultImage: category1,
                      imagesDescription: descriptions,
                    ),
                    ImagesCarousel(
                      images: imageList,
                      defaultImage: category1,
                      imagesDescription: descriptions,
                    ),
                    ImagesCarousel(
                      images: imageList,
                      defaultImage: category1,
                      imagesDescription: descriptions,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: TextField(
        cursorColor: Colors.white,
        enableInteractiveSelection: false,
        style: AppTextStyles.body1Semibold.copyWith(color: const Color.fromARGB(255, 255, 255, 255)),
        decoration: InputDecoration(
          hintText: 'Search...',
          hintStyle: AppTextStyles.body1Semibold.copyWith(color: const Color.fromARGB(255, 255, 255, 255)),
          //prefixIcon: const Icon(Iconsax.search_normal, color: Color.fromARGB(255, 255, 255, 255)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: Colors.white),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: Colors.white)
          ),
          
        ),
      ),
    );
  }

  Widget _buildGreetings() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: const Text(
        'Khám phá những địa điểm tuyệt vời nhất của cộng đồng Travelers',
        style: AppTextStyles.heading1Semibold,
      ),
    );
  }

  Widget _buildCategoriesHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: const Text(
        'Khám những địa điểm được xếp hạng bởi đánh giá của cộng đồng travelers',
      ),
    );
  }
}
