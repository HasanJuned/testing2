import 'package:crafty_bay/data/models/category.dart';
import 'package:crafty_bay/data/models/product.dart';
import 'package:crafty_bay/presentation/state_holders/category_list_controller.dart';
import 'package:crafty_bay/presentation/state_holders/home_slider_controller.dart';
import 'package:crafty_bay/presentation/state_holders/main_bottom_nav_bar_controller.dart';
import 'package:crafty_bay/presentation/state_holders/new_product_list_controller.dart';
import 'package:crafty_bay/presentation/state_holders/popular_product_list_controller.dart';
import 'package:crafty_bay/presentation/state_holders/special_product_list_controller.dart';
import 'package:crafty_bay/presentation/utility/assets_path.dart';
import 'package:crafty_bay/presentation/widgets/app_bar_icon_button.dart';
import 'package:crafty_bay/presentation/widgets/category_item.dart';
import 'package:crafty_bay/presentation/widgets/centered_circular_progress_indicator.dart';
import 'package:crafty_bay/presentation/widgets/home_carousel_slider.dart';
import 'package:crafty_bay/presentation/widgets/product_card.dart';
import 'package:crafty_bay/presentation/widgets/section_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildApBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              _buildSearchTextField(),
              const SizedBox(
                height: 16,
              ),
              GetBuilder<HomeSliderController>(builder: (sliderController) {
                if (sliderController.inProgress) {
                  return const SizedBox(
                      height: 200, child: CenteredCircularProgressIndicator());
                }

                return HomeCarouselSlider(
                  sliderList: sliderController.sliderList,
                );
              }),
              const SizedBox(
                height: 16,
              ),
              SectionHeader(
                title: "All Categories",
                onTapSeeAll: () {
                  Get.find<MainBottomNavBarController>().selectToCategory();
                },
              ),
              const SizedBox(
                height: 16,
              ),
              GetBuilder<CategoryListController>(
                  builder: (categoryListController) {
                if (categoryListController.inProgress) {
                  return const SizedBox(
                      height: 100, child: CenteredCircularProgressIndicator());
                }
                return _buildCategoryListView(
                    categoryListController.categoryList);
              }),
              const SizedBox(
                height: 8,
              ),
              SectionHeader(
                title: "Popular",
                onTapSeeAll: () {},
              ),
              const SizedBox(
                height: 10,
              ),
              GetBuilder<PopularProductListController>(
                builder: (popularProductListController) {
                  if (popularProductListController.popularProductInProgress) {
                    return const SizedBox(
                      height: 240,
                      child: CenteredCircularProgressIndicator(),
                    );
                  }

                  return _buildProductListView(
                      popularProductListController.popularProductList);
                },
              ),
              const SizedBox(
                height: 8,
              ),
              SectionHeader(
                title: "Special",
                onTapSeeAll: () {},
              ),
              const SizedBox(
                height: 10,
              ),
              GetBuilder<SpecialProductListController>(
                builder: (specialProductListController) {
                  if (specialProductListController.specialProductInProgress) {
                    return const SizedBox(
                      height: 240,
                      child: CenteredCircularProgressIndicator(),
                    );
                  }
                  return _buildProductListView(
                      specialProductListController.specialProductList);
                },
              ),
              const SizedBox(
                height: 8,
              ),
              SectionHeader(
                title: "New",
                onTapSeeAll: () {},
              ),
              const SizedBox(
                height: 10,
              ),
              GetBuilder<NewProductListController>(
                  builder: (newProductListController) {
                if (newProductListController.newProductInProgress) {
                  return const SizedBox(
                    height: 240,
                    child: CenteredCircularProgressIndicator(),
                  );
                }
                return _buildProductListView(
                    newProductListController.newProductList);
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryListView(List<Category> categoryList) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: () {
          List<Widget> categoryCards = [];
          for (int i = 0; i < categoryList.length; i++) {
            categoryCards.add(Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CategoryItem(category: categoryList[i]),
                const SizedBox(
                  width: 8,
                ),
              ],
            ));
          }
          return categoryCards;
        }(),
      ),
    );
  }

  Widget _buildProductListView(List<Product> productList) {
    return SizedBox(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: () {
            List<Widget> productCards = [];
            for (int i = 0; i < productList.length; i++) {
              productCards.add(ProductCard(product: productList[i]));
            }
            return productCards;
          }(),
        ),
      ),
    );
  }

  Widget _buildSearchTextField() {
    return TextField(
      controller: _searchTEController,
      decoration: InputDecoration(
        hintText: "Search",
        fillColor: Colors.grey.shade200,
        filled: true,
        prefix: const Icon(Icons.search),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  AppBar _buildApBar() {
    return AppBar(
      leading: SvgPicture.asset(AssetsPath.appNavLogoSvg),
      actions: [
        AppbarIconButton(
          icon: Icons.people,
          onTap: () {},
        ),
        const SizedBox(
          width: 8,
        ),
        AppbarIconButton(
          icon: Icons.call,
          onTap: () {},
        ),
        const SizedBox(
          width: 8,
        ),
        AppbarIconButton(
          icon: Icons.notifications_active_outlined,
          onTap: () {},
        ),
      ],
    );
  }

  @override
  void dispose() {
    _searchTEController.dispose();
    super.dispose();
  }
}
