import '../../../../utils/tools/file_importer.dart';

class BallModel {
  int? ball;
  String date;
  BallSpecifics? specifics;

  BallModel({this.specifics, this.ball, required this.date});

  factory BallModel.fromJson(Map<String, dynamic> json) {
    return BallModel(
        specifics: makeBallSpecifics(json["ball"]),
        ball: json["ball"],
        date: json["date"]);
  }

  toJson() {
    return {"ball": ball, "date": date};
  }
}

class BallSpecifics {
  int ball;
  List<Color> gradient;
  Alignment backgroundAllignment;
  String backgroundImage;

  BallSpecifics(
      {required this.backgroundImage,
      required this.ball,
      required this.backgroundAllignment,
      required this.gradient});
}
