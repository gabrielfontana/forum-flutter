import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forum/core/helpers/snackbar_helper.dart';
import 'package:forum/core/widgets/appbars/simple_appbar.dart';
import 'package:forum/core/widgets/buttons/primary_button.dart';
import 'package:forum/core/widgets/dialogs/loading_dialog.dart';
import 'package:forum/core/widgets/forms/email_input_field.dart';
import 'package:forum/core/widgets/forms/form_scaffold.dart';
import 'package:forum/modules/reset/controllers/reset_controller.dart';

class ResetPage extends StatefulWidget {
  @override
  _ResetPageState createState() => _ResetPageState();
}

class _ResetPageState extends ModularState<ResetPage, ResetController> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return FormScaffold(
      appBar: const SimpleAppBar(title: 'Redefinir senha'),
      formKey: _formKey,
      children: [
        EmailInputField(
          label: 'E-mail',
          initialValue: controller.email,
          onSaved: controller.setEmail,
        ),
        PrimaryButton(
          label: 'Enviar e-mail',
          onPressed: _onPasswordReset,
        )
      ],
    );
  }

  Future<void> _onPasswordReset() async {
    if (!_formKey.currentState!.validate()) return;
    LoadingDialog.show(context, message: 'Verificando e-mail');
    _formKey.currentState!.save();
    final result = await controller.passwordReset();
    LoadingDialog.hide();
    result.fold(_onFailure, _onSuccess);
  }

  void _onFailure(failure) {
    SnackBarHelper.showFailureMessage(context, message: failure.toString());
  }

  void _onSuccess(user) {
    Modular.to.pop();
    SnackBarHelper.showSuccessMessage(context, message: 'Sucesso!');
  }
}
