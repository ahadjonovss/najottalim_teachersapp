part of 'group_bloc.dart';

@immutable
abstract class GroupEvent {}

class GetGroupsStudentsEvent extends GroupEvent {
  List studentIds;
  GetGroupsStudentsEvent(this.studentIds);
}
