import 'package:crafty_bay/presentation/screens/create_review_screen.dart';
import 'package:crafty_bay/presentation/state_holders/review_product_list_controller.dart';
import 'package:crafty_bay/presentation/utility/app_colors.dart';
import 'package:crafty_bay/presentation/widgets/centered_circular_progress_indicator.dart';
import 'package:crafty_bay/presentation/widgets/reviews_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewsListScreen extends StatefulWidget {
  const ReviewsListScreen({super.key, required this.productId});
  final int productId;

  @override
  State<ReviewsListScreen> createState() => _ReviewsListScreenState();
}

class _ReviewsListScreenState extends State<ReviewsListScreen> {
  @override
  void initState() {
    Get.find<ReviewProductListController>()
        .getReviewProductList(widget.productId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reviews"),
      ),
      body: GetBuilder<ReviewProductListController>(
          builder: (reviewProductListController) {
        if (reviewProductListController.inProgress) {
          return const CenteredCircularProgressIndicator();
        }

        if (reviewProductListController.errorMessage.isNotEmpty) {
          return Center(
            child: Text(
              reviewProductListController.errorMessage,
              style: const TextStyle(color: Colors.red, fontSize: 16),
            ),
          );
        }
        if (reviewProductListController.reviewProductListData.isEmpty) {
          return const Center(
            child: Text('No reviews available.'),
          );
        }

        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount:
                    reviewProductListController.reviewProductListData.length,
                itemBuilder: (context, index) {
                  return ReviewsCard(
                    reviewProductListData: reviewProductListController
                        .reviewProductListData[index],
                  );
                },
              ),
            ),
            _buildReviewsSection(reviewProductListController),
          ],
        );
      }),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  Widget _buildFloatingActionButton() {
    return FloatingActionButton(
      backgroundColor: AppColors.primaryColor,
      tooltip: 'Add Review',
      shape: const CircleBorder(),
      onPressed: () {
        Get.to(() => const CreateReviewScreen());
      },
      child: const Icon(
        Icons.add,
        color: Colors.white,
        size: 30,
      ),
    );
  }

  Widget _buildReviewsSection(
      ReviewProductListController reviewProductListController) {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.1),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: SizedBox(
        width: double.infinity,
        child: Text(
          "Reviews ${reviewProductListController.reviewProductListData.length}",
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
