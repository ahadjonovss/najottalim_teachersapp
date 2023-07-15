class GroupModel {
  final String lessonTime;
  final String groupName;
  final String groupId;
  final String room;
  final List students;
  List lessons;

  GroupModel(
      {required this.groupName,
      required this.lessonTime,
      required this.lessons,
      required this.room,
      required this.groupId,
      required this.students});

  factory GroupModel.fromJson(Map<String, dynamic> json) {
    return GroupModel(
        lessons: json["lessons"] ?? [],
        groupId: json["groupId"] ?? '',
        groupName: json["name"] ?? '',
        lessonTime: json["lessonTime"] ?? '',
        students: json["students"] ?? [],
        room: json["room"] ?? '');
  }

  toJson() {
    return {
      "lessons": lessons,
      "name": groupName,
      "lessonTime": lessonTime,
      "room": room,
      "groupId": groupId,
      "students": students
    };
  }
}
