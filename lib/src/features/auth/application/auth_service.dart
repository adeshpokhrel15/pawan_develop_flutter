// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mechanic_baato/src/features/auth/data/auth_repository.dart';
import 'package:mechanic_baato/src/features/auth/domain/user.dart';
import 'package:mechanic_baato/src/features/core/application/user_service.dart';
import 'package:mechanic_baato/src/utils/validators/model_utils.dart';

class AuthService {
  AuthService({
    required this.ref,
  });

  final Ref ref;

  Future<void> signInWithIdAndPassword(String uId, String password) async {
    final response = await ref
        .read(authRepositoryProvider)
        .signInWithIdAndPassword(uId, password);

    if (response is Success) {
      User user = User.fromJson(jsonEncode(response.response));
      ref.read(userServiceProvider).setCurrentUser(user);
    }
  }

  Future<void> createUserWithIdAndPassword(String uId, String password) async {
    final response = await ref
        .read(authRepositoryProvider)
        .createUserWithIdAndPassword(uId, password);

    if (response is Success) {
      User user = User.fromJson(jsonEncode(response.response));
      ref.read(userServiceProvider).setCurrentUser(user);
    }
  }
}

final authServiceProvider = Provider((ref) {
  return AuthService(ref: ref);
});
