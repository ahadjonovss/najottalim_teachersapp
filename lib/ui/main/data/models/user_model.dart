import 'package:najottalim_teachersapp/ui/main/data/models/ball_model.dart';
import 'package:najottalim_teachersapp/ui/main/data/models/group_model.dart';

class UserDataModel {
  final String userId;
  final String docId;
  final String groupId;
  final String name;
  final String surname;
  final List balls;
  GroupModel? group;

  UserDataModel(
      {required this.balls,
      required this.docId,
      this.group,
      required this.groupId,
      required this.name,
      required this.surname,
      required this.userId});

  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
        balls: json['balls'].map((e) => BallModel.fromJson(e)).toList(),
        docId: json["docId"],
        groupId: json["groupId"],
        name: json["name"],
        surname: json["surname"],
        userId: json["userId"]);
  }
}
