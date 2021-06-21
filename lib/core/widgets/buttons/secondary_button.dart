import 'package:flutter/material.dart';
import 'package:forum/core/configs/app_colors.dart';

class SecondaryButton extends StatelessWidget {
  final String label;
  final Function() onPressed;
  final EdgeInsets padding;
  final double radius;
  final double height;

  const SecondaryButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.height = 48.0,
    this.radius = 50.0,
    this.padding = const EdgeInsets.only(top: 20.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          label.toUpperCase(),
          style: const TextStyle(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
