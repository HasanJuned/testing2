import 'package:crafty_bay/data/models/create_product_review.dart';
import 'package:crafty_bay/presentation/state_holders/create_product_review_controller.dart';
import 'package:crafty_bay/presentation/widgets/snack_message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateReviewScreen extends StatefulWidget {
  const CreateReviewScreen({super.key});

  @override
  State<CreateReviewScreen> createState() => _CreateReviewScreenState();
}

class _CreateReviewScreenState extends State<CreateReviewScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _productIdEditingController =
      TextEditingController();
  final TextEditingController _productRatingEditingController =
      TextEditingController();
  final TextEditingController _writeReviewEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Review"),
      ),
      body: GetBuilder<CreateProductReviewController>(
          builder: (createProductReviewController) {
        if (createProductReviewController.inProgress) {
          return const CircularProgressIndicator();
        }

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                _buildCreateReviewForm(),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      CreateProductReview createProductReview =
                          CreateProductReview(
                        description: _writeReviewEditingController.text,
                        productId: int.tryParse(
                            _productIdEditingController.text.trim()),
                        rating: int.tryParse(
                            _productRatingEditingController.text.trim()),
                      );

                      bool isSuccess = await createProductReviewController
                          .createProductReviewList(createProductReview);

                      if (isSuccess) {
                        if (mounted) {
                          showSnackMessage(
                              context, 'Successfully created review');
                        }
                        Get.back();
                      } else {
                        if (mounted) {
                          showSnackMessage(context,
                              createProductReviewController.errorMessage);
                        }
                      }
                    }
                  },
                  child: const Text("Submit"),
                )
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget _buildCreateReviewForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.number,
            controller: _productIdEditingController,
            decoration: const InputDecoration(hintText: 'Product Id'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your product id';
              }
              return null;
            },
          ),
          const SizedBox(height: 12),
          TextFormField(
            keyboardType: TextInputType.number,
            controller: _productRatingEditingController,
            decoration: const InputDecoration(hintText: 'Rating'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your Rating';
              }
              return null;
            },
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _writeReviewEditingController,
            maxLines: 8,
            decoration: const InputDecoration(hintText: 'Write Review'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please write your review';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _productIdEditingController.dispose();
    _productRatingEditingController.dispose();
    _writeReviewEditingController.dispose();
    super.dispose();
  }
}
