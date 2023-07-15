import '../../../../utils/tools/file_importer.dart';

class LessonsRepository {
  FirebaseFirestore? firebaseFirestore;

  FirebaseFirestore getFirebaseInstance() =>
      firebaseFirestore ?? FirebaseFirestore.instance;

  Future<MyResponse> addLessonToTheGroup(String groupId, List lessons) async {
    MyResponse myResponse = MyResponse();
    FirebaseFirestore instance = getFirebaseInstance();

    try {
      var some = await instance
          .collection("groups")
          .doc(groupId)
          .update({"lessons": lessons});
    } catch (e) {
      myResponse.message = e.toString();
    }

    return myResponse;
  }
}
