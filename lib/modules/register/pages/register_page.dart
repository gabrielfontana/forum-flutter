import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forum/core/helpers/snackbar_helper.dart';
import 'package:forum/core/widgets/appbars/simple_appbar.dart';
import 'package:forum/core/widgets/buttons/primary_button.dart';
import 'package:forum/core/widgets/dialogs/loading_dialog.dart';
import 'package:forum/core/widgets/forms/email_input_field.dart';
import 'package:forum/core/widgets/forms/form_scaffold.dart';
import 'package:forum/core/widgets/forms/password_input_field.dart';
import 'package:forum/core/widgets/forms/text_input_field.dart';
import 'package:forum/modules/register/controllers/register_controller.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState
    extends ModularState<RegisterPage, RegisterController> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return FormScaffold(
      appBar: const SimpleAppBar(title: 'Registro'),
      formKey: _formKey,
      children: [
        TextInputField(
          label: 'Nome',
          initialValue: controller.name,
          onSaved: controller.setName,
        ),
        EmailInputField(
          label: 'Email',
          initialValue: controller.email,
          onSaved: controller.setEmail,
        ),
        PasswordInputField(
          label: 'Senha',
          initialValue: controller.password,
          onSaved: controller.setPassword,
        ),
        PasswordInputField.confirm(
          label: 'Confirmar senha',
          initialValue: controller.confirmPassword,
          onSaved: controller.setConfirmPassword,
        ),
        PrimaryButton(
          label: 'Registrar',
          onPressed: _onRegister,
        )
      ],
    );
  }

  Future<void> _onRegister() async {
    if (!_formKey.currentState!.validate()) return;
    LoadingDialog.show(context, message: 'Registrando usuário');
    _formKey.currentState!.save();
    final result = await controller.register();
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
