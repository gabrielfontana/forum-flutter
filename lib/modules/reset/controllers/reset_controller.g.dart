// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ResetController on _ResetControllerBase, Store {
  final _$emailAtom = Atom(name: '_ResetControllerBase.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$passwordResetAsyncAction =
      AsyncAction('_ResetControllerBase.passwordReset');

  @override
  Future<Either<Failure, bool>> passwordReset() {
    return _$passwordResetAsyncAction.run(() => super.passwordReset());
  }

  final _$_ResetControllerBaseActionController =
      ActionController(name: '_ResetControllerBase');

  @override
  void setEmail(dynamic value) {
    final _$actionInfo = _$_ResetControllerBaseActionController.startAction(
        name: '_ResetControllerBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_ResetControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email}
    ''';
  }
}
