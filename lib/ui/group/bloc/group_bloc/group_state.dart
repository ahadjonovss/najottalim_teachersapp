part of 'group_bloc.dart';

@immutable
class GroupState extends Equatable {
  ResponseStatus status;
  List<GroupModel> groups;
  String message;
  List<StudentModel> groupsStudents;
  ResponseStatus groupsStudentsStatus;

  GroupState(
      {this.message = '',
      required this.groups,
      required this.groupsStudents,
      this.groupsStudentsStatus = ResponseStatus.pure,
      this.status = ResponseStatus.pure});

  copyWith(
          {ResponseStatus? status,
          List<GroupModel>? groups,
          String? message,
          List<StudentModel>? groupsStudents,
          ResponseStatus? groupsStudentsStatus}) =>
      GroupState(
          message: message ?? this.message,
          groupsStudents: groupsStudents ?? this.groupsStudents,
          groupsStudentsStatus:
              groupsStudentsStatus ?? this.groupsStudentsStatus,
          status: status ?? this.status,
          groups: groups ?? this.groups);
  @override
  List<Object?> get props =>
      [status, groups, message, groupsStudentsStatus, groupsStudents];
}
