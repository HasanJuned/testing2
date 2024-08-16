import 'package:crafty_bay/presentation/utility/app_colors.dart';
import 'package:flutter/material.dart';

class WishButtonCard extends StatefulWidget {
  const WishButtonCard(
      {super.key,
      this.showAddToWishList = true,
      this.isSelected = false,
      required this.onTap});

  final bool showAddToWishList;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  State<WishButtonCard> createState() => _WishButtonCardState();
}

class _WishButtonCardState extends State<WishButtonCard> {
  late bool _isSelected;

  @override
  void initState() {
    super.initState();
    _isSelected = widget.isSelected;
  }

  void _toggleSelection() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.showAddToWishList,
      replacement: _getIconButton(Icons.delete_outline),
      child: InkWell(
        onTap: () {
          widget.onTap();
          _toggleSelection();
        },
        child: _getIconButton(
          _isSelected ? Icons.favorite : Icons.favorite_outline_rounded,
        ),
      ),
    );
  }

  Widget _getIconButton(IconData icon) {
    return Card(
      color: AppColors.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Icon(
          icon,
          size: 16,
          color: Colors.white,
        ),
      ),
    );
  }
}
