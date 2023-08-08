import 'package:dio/dio.dart';

import '../../../../utils/tools/file_importer.dart';

class ScoringRepository {
  static FirebaseFirestore? firebaseFirestore;

  static FirebaseFirestore getFirebaseInstance() =>
      firebaseFirestore ?? FirebaseFirestore.instance;

  Future<MyResponse> postScoresToStudents(
      List<StudentModel> students, String date) async {
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

    for (var i in students) {
      if (i.fcmToken.isNotEmpty) {
        await sendNotification(i, date);
      }
    }

    return myResponse;
  }

  sendNotification(StudentModel student, String date) async {
    print("Name : ${student.name}");
    print("surname : ${student.surname}");
    print("token : ${student.fcmToken}");
    print("date : ${date}");
    var postUrl = "https://fcm.googleapis.com/fcm/send";

    final headers = {
      'content-type': 'application/json',
      'Authorization':
          'key=AAAA0T8ct8I:APA91bGHrJYkHMKfu-zoMNCjuEgdilfpNlw1axttVCCZKlSgqb2vgvNtxJ8TclWwTqUEmL7YYaX6ybwlAz77qMBp1f6QkMOJ7o_QJ2wNo8LEGYqsvzMJvPQUYlif-whR2YpOGeUmFhLD'
    };

    BaseOptions options = BaseOptions(
      connectTimeout: 5000,
      receiveTimeout: 3000,
      headers: headers,
    );

    final response = await Dio(options).post(postUrl, data: {
      "notification": {
        "title": "Vazifangiz baholandi!",
        "body":
            "Hurmatli ${student.name} ${student.surname} $date sanaga berilgan uyga vazifangiz baholandi! Ilova orqali tekshirishingiz mumkin!"
      },
      "priority": "high",
      "data": {
        "title": "Vazifangiz baholandi!",
        "body":
            "Hurmatli ${student.name} ${student.surname} $date sanaga berilgan uyga vazifangiz baholandi! Ilova orqali tekshirishingiz mumkin!"
      },
      "to": student.fcmToken
    });

    if (response.statusCode == 200) {
      print("Jo'nadi");
    } else {
      print('notification sending failed');
      // on failure do sth
    }
  }
}
