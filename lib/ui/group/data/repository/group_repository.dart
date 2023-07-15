import '../../../../utils/tools/file_importer.dart';

class GroupRepository {
  static FirebaseFirestore? firebaseFirestore;
  static FirebaseAuth? auth;

  static FirebaseAuth getAuthInstance() => auth ?? FirebaseAuth.instance;

  static FirebaseFirestore getFirebaseInstance() =>
      firebaseFirestore ?? FirebaseFirestore.instance;

  Future<MyResponse> getAllGroups() async {
    MyResponse myResponse = MyResponse();
    FirebaseFirestore instance = getFirebaseInstance();

    try {
      var some = await instance.collection("groups").get();
      List<GroupModel> groups =
          some.docs.map((e) => GroupModel.fromJson(e.data())).toList();
      myResponse.data = groups;
    } catch (e) {
      myResponse.message = e.toString();
    }

    return myResponse;
  }

  Future<MyResponse> getGroupsStudents(List docIds) async {
    MyResponse myResponse = MyResponse();
    FirebaseFirestore instance = getFirebaseInstance();
    List documents = [];
    try {
      for (String documentId in docIds) {
        var snapshot = await instance
            .collection("students")
            .where("docId", isEqualTo: documentId)
            .get();
        documents.add(snapshot.docs.first);
      }
      myResponse.data =
          documents.map((e) => StudentModel.fromJson(e.data())).toList();
    } catch (e) {
      myResponse.message = e.toString();
    }

    return myResponse;
  }
}
