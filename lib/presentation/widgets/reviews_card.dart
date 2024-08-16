import 'package:crafty_bay/data/models/review_product_list_data.dart';
import 'package:flutter/material.dart';

class ReviewsCard extends StatelessWidget {
  final ReviewProductListData reviewProductListData;
  const ReviewsCard({
    super.key,
    required this.reviewProductListData,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        surfaceTintColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey[200],
                    child: const Icon(
                      Icons.person,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    reviewProductListData.profile?.cusName ?? '',
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                reviewProductListData.description ?? '',
                style: TextStyle(fontSize: 14, color: Colors.grey[700]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
