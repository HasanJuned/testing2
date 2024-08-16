import 'package:crafty_bay/data/models/product.dart';
import 'package:crafty_bay/presentation/screens/product_details_screen.dart';
import 'package:crafty_bay/presentation/state_holders/delete_wish_list_controller.dart';
import 'package:crafty_bay/presentation/state_holders/wish_list_controller.dart';
import 'package:crafty_bay/presentation/utility/app_colors.dart';
import 'package:crafty_bay/presentation/widgets/snack_message.dart';
import 'package:crafty_bay/presentation/widgets/wish_button_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCard extends StatelessWidget {
  const ProductCard(
      {super.key, this.showAddToWishList = true, required this.product});

  final bool showAddToWishList;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          () => ProductDetailsScreen(
            productId: product.id!,
          ),
        );
      },
      child: Card(
        elevation: 3,
        surfaceTintColor: Colors.white,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: SizedBox(
          width: 150,
          child: Column(
            children: [
              Container(
                width: 150,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withOpacity(0.1),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(product.image ?? ''),
                ),
              ),
              _buildProductCartDetails(showAddToWishList, context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductCartDetails(
      bool showAddToWishList, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.title ?? '',
            maxLines: 2,
            style: const TextStyle(
              overflow: TextOverflow.ellipsis,
              fontSize: 13,
              color: Colors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),
          Wrap(
            spacing: 5,
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text(
                "\$${product.price}",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryColor,
                ),
              ),
              Wrap(
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 20,
                  ),
                  Text("${product.star}"),
                ],
              ),
              WishButtonCard(
                showAddToWishList: showAddToWishList,
                isSelected: false,
                onTap: () async {
                  final deleteWishListController =
                      Get.find<DeleteWishListController>();
                  final wishListController = Get.find<WishListController>();

                  bool isDeleted = await deleteWishListController
                      .deleteWishList(product.id!);

                  if (isDeleted) {
                    showSnackMessage(context, 'Item Removed from Wishlist');
                    await wishListController
                        .getWishList(); // Fetch updated wishlist
                  } else {
                    showSnackMessage(
                        context, deleteWishListController.errorMessage);
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
