import 'package:flutter/material.dart';

class InputDetails extends StatelessWidget {
  const InputDetails({
    super.key,
    required this.ageController,
    required this.labelText,
  });

  final TextEditingController ageController;
  final String? labelText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 50,
      child: TextFormField(
        controller: ageController,
        decoration: InputDecoration(
          labelText: labelText,
        ),
      ),
    );
  }
}