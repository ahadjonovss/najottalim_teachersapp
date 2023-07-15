import 'package:najottalim_teachersapp/utils/tools/file_importer.dart';

class AuthorizationRepository {
  FirebaseAuth? auth;

  FirebaseAuth getAuthInstance() => auth ?? FirebaseAuth.instance;

  Future<MyResponse> signIn(UserModel user) async {
    MyResponse myResponse = MyResponse();
    FirebaseAuth authInstance = getAuthInstance();
    try {
      UserCredential result = await authInstance.signInWithEmailAndPassword(
          email: user.email, password: user.password);
    } catch (e) {
      if (e is FirebaseAuthException) {
        if (e.code == "user-not-found") {
          myResponse.message = "Kiritilgan hisob mavjud emas!";
        } else if (e.code == "wrong-password") {
          myResponse.message = "Parol xato kiritildi!";
        } else {
          myResponse.message =
              "Server bilan muammo mavjud.\nIltimos keyinroq urinib ko'ring!";
        }
      } else {
        myResponse.message =
            "Server bilan muammo mavjud.\nIltimos keyinroq urinib ko'ring!";
      }
    }
    return myResponse;
  }
}
