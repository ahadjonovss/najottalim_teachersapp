part of 'scoring_bloc.dart';

@immutable
abstract class ScoringEvent {}

class AddScoresToTheStudentsEvent extends ScoringEvent {}

class PostScoresToTheStudentsEvent extends ScoringEvent {
  List<StudentModel> students;
  String date;
  PostScoresToTheStudentsEvent(this.students, this.date);
}
