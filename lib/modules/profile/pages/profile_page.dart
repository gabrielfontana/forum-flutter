import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forum/core/configs/app_colors.dart';
import 'package:forum/core/configs/app_errors.dart';
import 'package:forum/core/helpers/snackbar_helper.dart';
import 'package:forum/core/widgets/dialogs/loading_dialog.dart';
import 'package:forum/core/widgets/dialogs/logout_dialog.dart';
import 'package:forum/core/widgets/tiles/action_tile.dart';
import 'package:forum/modules/profile/controlles/profile.controller.dart';
import 'package:forum/modules/profile/widgets/account_header_tile.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends ModularState<ProfilePage, ProfileController> {
  @override
  void initState() {
    super.initState();
    controller.getCurrentUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Container(
        child: Column(
          children: [
            Observer(
              builder: (_) {
                return ProfileHeaderTile(
                  name: controller.name,
                  email: controller.email,
                  pictureUrl: controller.avatar,
                );
              },
            ),
            const Divider(color: AppColors.white),
            _buildPersonalDataTile(),
            _buildNotificationsTile(),
            _buildSettingsTile(),
            _buildFaqTile(),
            const Divider(color: AppColors.white),
            _buildPrivacyPolicyTile(),
            _buildAboutTile(),
            const Divider(color: AppColors.white),
            _buildLogoutTile(),
          ],
        ),
      ),
    );
  }

  ActionTile _buildPersonalDataTile() {
    return ActionTile.next(
      title: 'Dados pessoais',
      prefixIcon: Icons.person_outlined,
      iconColor: AppColors.white,
      backgroundColor: AppColors.transparent,
      brightness: ActionTileBrightness.dart,
      onTap: () {},
    );
  }

  ActionTile _buildNotificationsTile() {
    return ActionTile.next(
      title: 'Notificações',
      prefixIcon: Icons.notifications_none_outlined,
      iconColor: AppColors.white,
      backgroundColor: AppColors.transparent,
      brightness: ActionTileBrightness.dart,
      onTap: () {},
    );
  }

  ActionTile _buildSettingsTile() {
    return ActionTile.next(
      title: 'Configurações',
      backgroundColor: AppColors.transparent,
      prefixIcon: Icons.settings_outlined,
      iconColor: AppColors.white,
      brightness: ActionTileBrightness.dart,
      onTap: () {},
    );
  }

  ActionTile _buildFaqTile() {
    return ActionTile.next(
      title: 'Dúvidas',
      backgroundColor: AppColors.transparent,
      prefixIcon: Icons.help_outlined,
      iconColor: AppColors.white,
      brightness: ActionTileBrightness.dart,
      onTap: () {},
    );
  }

  ActionTile _buildPrivacyPolicyTile() {
    return ActionTile.next(
      title: 'Política de Privacidade',
      backgroundColor: AppColors.transparent,
      prefixIcon: Icons.verified_user_outlined,
      iconColor: AppColors.white,
      brightness: ActionTileBrightness.dart,
      onTap: () {},
    );
  }

  ActionTile _buildAboutTile() {
    return ActionTile.next(
      title: 'Sobre o aplicativo',
      backgroundColor: AppColors.transparent,
      prefixIcon: Icons.info_outlined,
      iconColor: AppColors.white,
      brightness: ActionTileBrightness.dart,
      onTap: () {},
    );
  }

  ActionTile _buildLogoutTile() {
    return ActionTile(
      title: 'Sair',
      backgroundColor: AppColors.transparent,
      prefixIcon: Icons.logout_outlined,
      iconColor: AppColors.white,
      brightness: ActionTileBrightness.dart,
      onTap: _onLogout,
    );
  }

  Future _onLogout() async {
    final result = await LogoutDialog.show(context);
    if (result) {
      LoadingDialog.show(context, message: 'Saindo...');
      final result = await controller.logout();
      LoadingDialog.hide();
      result.fold(_onLogoutFailure, _onLogoutSuccess);
    }
  }

  void _onLogoutFailure(Failure failure) {
    SnackBarHelper.showFailureMessage(context, message: failure.message);
  }

  void _onLogoutSuccess(bool success) {
    Modular.to.navigate('/login');
  }
}
