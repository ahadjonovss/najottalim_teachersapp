import 'package:najottalim_teachersapp/ui/main/data/models/teacher_model.dart';
import 'package:najottalim_teachersapp/utils/tools/file_importer.dart';

class TeacherRepository {
  FirebaseAuth? auth;
  FirebaseFirestore? firebaseFirestore;

  FirebaseAuth getAuthInstance() => auth ?? FirebaseAuth.instance;

  FirebaseFirestore getFirebaseInstance() =>
      firebaseFirestore ?? FirebaseFirestore.instance;

  Future<MyResponse> getUserData() async {
    MyResponse myResponse = MyResponse();
    FirebaseFirestore instance = getFirebaseInstance();
    FirebaseAuth auth = getAuthInstance();

    try {
      var some = await instance
          .collection("teachers")
          .where("userId", isEqualTo: auth.currentUser!.uid)
          .get();
      TeacherModel teacher = TeacherModel.fromJson(some.docs.first.data());
      myResponse.data = teacher;
    } catch (e) {
      myResponse.message = e.toString();
    }

    return myResponse;
  }
}
