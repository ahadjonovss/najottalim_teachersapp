part of 'teacher_bloc.dart';

@immutable
abstract class TeacherEvent {}

class GetTeacherEvent extends TeacherEvent {}

class GetTeachersGroupsEvent extends TeacherEvent {
  List groupIds;
  GetTeachersGroupsEvent(this.groupIds);
}
