import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forum/core/configs/app_errors.dart';
import 'package:forum/core/helpers/snackbar_helper.dart';
import 'package:forum/core/widgets/appbars/simple_appbar.dart';
import 'package:forum/core/widgets/buttons/primary_button.dart';
import 'package:forum/core/widgets/dialogs/loading_dialog.dart';
import 'package:forum/core/widgets/forms/form_scaffold.dart';
import 'package:forum/core/widgets/forms/text_area_input_field.dart';
import 'package:forum/core/widgets/forms/text_input_field.dart';
import 'package:forum/modules/posts/controllers/posts_editor_controller.dart';

class PostsEditorPage extends StatefulWidget {
  const PostsEditorPage({Key? key}) : super(key: key);

  @override
  _PostsEditorPageState createState() => _PostsEditorPageState();
}

class _PostsEditorPageState
    extends ModularState<PostsEditorPage, PostsEditorController> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return FormScaffold(
      appBar: const SimpleAppBar(title: 'Nova mensagem'),
      formKey: _formKey,
      children: [
        TextInputField(
          label: 'Título',
          initialValue: controller.title,
          onSaved: controller.setTitle,
        ),
        TextAreaInputField(
          label: 'Descrição',
          initialValue: controller.description,
          onSaved: controller.setDescription,
        ),
        PrimaryButton(
          label: 'Salvar',
          onPressed: _onSave,
        )
      ],
    );
  }

  Future<void> _onSave() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      LoadingDialog.show(context, message: 'Salvando...');
      final result = await controller.save();
      LoadingDialog.hide();
      result.fold(_onFailure, _onSuccess);
    }
  }

  void _onFailure(Failure failure) {
    SnackBarHelper.showFailureMessage(context, message: failure.toString());
  }

  void _onSuccess(bool success) {
    Modular.to.navigate('/home/posts');
    SnackBarHelper.showFailureMessage(
      context,
      message: 'Problema ao tentar criar nova dúvida',
    );
  }
}
