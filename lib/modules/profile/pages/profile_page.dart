import 'package:flutter/material.dart';
import 'package:forum/core/widgets/appbars/simple_appbar.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SimpleAppBar(title: 'Perfil'),
      body: Container(),
    );
  }
}
