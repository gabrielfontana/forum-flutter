import 'package:forum/modules/profile/repositories/profile_repository.dart';
import 'package:mobx/mobx.dart';
part 'profile.controller.g.dart';

class ProfileController = _ProfileControllerBase with _$ProfileController;

abstract class _ProfileControllerBase with Store {
  final ProfileRepository _repository;

  _ProfileControllerBase(this._repository);

  @observable
  String name = 'Gabriel Fontana';

  @observable
  String email = 'gabrielf.junqueira74@gmail.com';

  @observable
  String pictureUrl = '';

  @action
  Future logout() async {
    return await _repository.logout();
  }
}
