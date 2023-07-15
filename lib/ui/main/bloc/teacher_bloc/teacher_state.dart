part of 'teacher_bloc.dart';

@immutable
class TeacherState extends Equatable {
  TeacherModel? teacher;
  ResponseStatus status;
  String message;
  List<GroupModel> groups;
  ResponseStatus groupsStatus;

  TeacherState(
      {this.status = ResponseStatus.pure,
      this.message = '',
      this.teacher,
      required this.groups,
      this.groupsStatus = ResponseStatus.pure});

  copyWith({
    TeacherModel? teacher,
    ResponseStatus? status,
    String? message,
    ResponseStatus? groupsStatus,
    List<GroupModel>? groups,
  }) {
    return TeacherState(
        groups: groups ?? this.groups,
        message: message ?? this.message,
        groupsStatus: groupsStatus ?? this.groupsStatus,
        status: status ?? this.status,
        teacher: teacher ?? this.teacher);
  }

  @override
  List<Object?> get props => [teacher, status, message, groups, groupsStatus];
}
