import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mechanic_baato/src/features/auth/data/fake_auth_repository.dart';

abstract class AuthRepository {
  Future<dynamic> signInWithIdAndPassword(String uId, String password);
  Future<dynamic> createUserWithIdAndPassword(String uId, String password);
  Future<dynamic> signOut();
  Future<dynamic> fetchUserInfo(String uId);
}

final authRepositoryProvider = Provider<FakeAuthRepository>((ref) {
  return FakeAuthRepository();
});
