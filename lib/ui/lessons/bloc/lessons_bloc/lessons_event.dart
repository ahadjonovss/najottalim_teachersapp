part of 'lessons_bloc.dart';

@immutable
abstract class LessonsEvent {}

class AddLessonToTheGroupEvent extends LessonsEvent {
  String groupId;
  List lessons;

  AddLessonToTheGroupEvent(this.groupId, this.lessons);
}
