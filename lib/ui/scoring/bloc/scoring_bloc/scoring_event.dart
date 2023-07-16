part of 'scoring_bloc.dart';

@immutable
abstract class ScoringEvent {}

class AddScoresToTheStudentsEvent extends ScoringEvent {}

class PostScoresToTheStudentsEvent extends ScoringEvent {
  List<StudentModel> students;
  PostScoresToTheStudentsEvent(this.students);
}
