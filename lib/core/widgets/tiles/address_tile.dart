import 'package:flutter/material.dart';
import 'package:forum/core/helpers/services_helper.dart';
import 'action_tile.dart';

class AddressTile extends StatelessWidget {
  final String title;
  final String address;

  AddressTile({
    this.title = 'Endereço',
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return ActionTile(
      title: title,
      subtitle: address,
      prefixIcon: Icons.public_outlined,
      suffixIcon: Icons.navigate_next,
      onTap: () => ServicesHelper.directions(address),
    );
  }
}
