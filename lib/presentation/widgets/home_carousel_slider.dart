import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay/data/models/slider_data.dart';
import 'package:crafty_bay/presentation/utility/app_colors.dart';
import 'package:crafty_bay/presentation/widgets/network_image_widget.dart';
import 'package:flutter/material.dart';

class HomeCarouselSlider extends StatefulWidget {
  const HomeCarouselSlider({
    super.key,
    required this.sliderList,
  });

  final List<SliderData> sliderList;

  @override
  State<HomeCarouselSlider> createState() => _HomeCarouselSliderState();
}

class _HomeCarouselSliderState extends State<HomeCarouselSlider> {
  final ValueNotifier<int> _selectedPageIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildCaroselSlider(),
        const SizedBox(
          height: 8,
        ),
        _buildDotIndicator(),
      ],
    );
  }

  Widget _buildCaroselSlider() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 180.0,
        viewportFraction: 1,
        onPageChanged: (index, _) {
          _selectedPageIndex.value = index;
        },
      ),
      items: widget.sliderList.map(
        (slider) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                alignment: Alignment.center,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: NetworkImageWidget(
                        url: slider.image ?? '',
                        height: double.maxFinite,
                        width: double.maxFinite,
                        boxFit: BoxFit.cover,
                      ),
                    ),
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          color: Colors.black.withOpacity(0.5),
                          child: _buildSliderProductDescription(slider),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ).toList(),
    );
  }

  Widget _buildSliderProductDescription(SliderData slider) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            slider.title ?? '',
            style: const TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600),
          ),
          Text(
            slider.shortDes ?? '',
            maxLines: 3,
            style: const TextStyle(
                color: Colors.white, overflow: TextOverflow.ellipsis),
          ),
          const SizedBox(
            height: 8,
          ),
          SizedBox(
            width: 100,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: AppColors.primaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  textStyle: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  )),
              onPressed: () {},
              child: const Text('Buy now'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDotIndicator() {
    return ValueListenableBuilder(
      valueListenable: _selectedPageIndex,
      builder: (context, currentPage, _) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < widget.sliderList.length; i++)
              Container(
                width: 15,
                height: 15,
                margin: const EdgeInsets.symmetric(horizontal: 2),
                decoration: BoxDecoration(
                  color: i == currentPage ? AppColors.primaryColor : null,
                  border: Border.all(
                    color:
                        i == currentPage ? AppColors.primaryColor : Colors.grey,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
          ],
        );
      },
    );
  }
}
