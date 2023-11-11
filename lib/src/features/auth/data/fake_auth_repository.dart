import 'package:mechanic_baato/src/features/auth/data/auth_repository.dart';

import '../../../utils/validators/model_utils.dart';

class FakeAuthRepository implements AuthRepository {
  @override
  Future<dynamic> createUserWithIdAndPassword(
      String uId, String password) async {
    await Future.delayed(const Duration(seconds: 2));

    return Success(code: 201, response: {
      'id': uId,
      'name': 'Created User',
      'email': null,
      'phone': '00876567433',
      'profilePic': 'assets/images/no-profile.png',
      'role': 'Consumer',
    });
  }

  @override
  Future<dynamic> signInWithIdAndPassword(String uId, String password) async {
    await Future.delayed(const Duration(seconds: 2));
    return Success(code: 200, response: {
      "refresh":
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY5OTgwNTkwNiwiaWF0IjoxNjk5NzE5NTA2LCJqdGkiOiI0M2JlNmUwYWM5NmQ0YTZlYjk2ZDJkNTllNzA2NzQ1NCIsInVzZXJfaWQiOjF9.gzTNoinFoaJ2dXViYxq2dFeBfjbnK-Z761q7sWOGEDQ",
      "access":
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjk5ODA1OTA2LCJpYXQiOjE2OTk3MTk1MDYsImp0aSI6IjU1MWMwZDMwZWZiMTRiMGZhMmU2ODhkNjM1NGY0OTI4IiwidXNlcl9pZCI6MX0.c7_yqTpBEZblPyBf5mKtH6CvSq2xgdySBQquXSPaLC4"
    });
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future fetchUserInfo(String uId) async {
    await Future.delayed(const Duration(seconds: 2));

    return Success(code: 201, response: {
      'id': uId,
      'name': 'Created User',
      'email': null,
      'phone': '00876567433',
      'profilePic': 'assets/images/no-profile.png',
      'role': 'Consumer',
    });
  }
}
