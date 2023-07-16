import '../../../../utils/tools/file_importer.dart';

class ScoringRepository {
  static FirebaseFirestore? firebaseFirestore;

  static FirebaseFirestore getFirebaseInstance() =>
      firebaseFirestore ?? FirebaseFirestore.instance;

  Future<MyResponse> postScoresToStudents(List<StudentModel> students) async {
    MyResponse myResponse = MyResponse();
    FirebaseFirestore instance = getFirebaseInstance();
    try {
      for (StudentModel student in students) {
        await instance
            .collection("students")
            .doc(student.docId)
            .update({"balls": student.balls.map((e) => e.toJson())});
      }
    } catch (e) {
      print("Mana error ${e.toString()}");
      myResponse.message = e.toString();
    }

    return myResponse;
  }
}
