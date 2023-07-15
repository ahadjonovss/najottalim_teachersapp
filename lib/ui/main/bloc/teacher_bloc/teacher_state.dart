part of 'teacher_bloc.dart';

@immutable
class TeacherState extends Equatable {
  TeacherModel? teacher;
  ResponseStatus status;
  String message;

  TeacherState(
      {this.status = ResponseStatus.pure, this.message = '', this.teacher});

  copyWith({TeacherModel? teacher, ResponseStatus? status, String? message}) {
    return TeacherState(
        message: message ?? this.message,
        status: status ?? this.status,
        teacher: teacher ?? this.teacher);
  }

  @override
  List<Object?> get props => [teacher, status, message];
}
