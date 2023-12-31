import 'package:riverpod_annotation/riverpod_annotation.dart';

import '/feature/firm/domain/models/firm_model.dart';
import '../../domain/app_user.dart';

part 'local_user.g.dart';

abstract interface class LocalUserRepository {
  Future<void> saveUser(AppUser user);
  AppUser? get getUser;
  Future<void> deleteUser();

  Future<void> saveFirm(FirmModel firm);
  FirmModel? get currentFirm;
}

@Riverpod(keepAlive: true)
LocalUserRepository localUserRepository(LocalUserRepositoryRef ref) {
  throw UnimplementedError();
}
