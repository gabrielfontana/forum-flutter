import 'package:flutter/material.dart';

class AlignTextbutton extends StatelessWidget {
  final String label;
  final Function() onPressed;
  final AlignmentGeometry alignment;

  const AlignTextbutton({
    Key? key,
    required this.label,
    required this.onPressed,
    required this.alignment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: TextButton(
        onPressed: onPressed,
        child: Text(label),
      ),
    );
  }
}
