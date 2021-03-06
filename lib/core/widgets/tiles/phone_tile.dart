import 'package:flutter/material.dart';
import 'package:forum/core/helpers/services_helper.dart';
import 'package:forum/core/widgets/tiles/action_tile.dart';

class PhoneTile extends StatelessWidget {
  final String title;
  final String phone;
  final bool useInitials;

  PhoneTile({
    this.title = 'Telefone',
    required this.phone,
    this.useInitials = false,
  });

  @override
  Widget build(BuildContext context) {
    return ActionTile(
      title: title,
      subtitle: phone,
      prefixIcon: Icons.phone_outlined,
      suffixIcon: Icons.navigate_next,
      onTap: () => ServicesHelper.call(phone),
    );
  }
}
