part of 'lessons_bloc.dart';

@immutable
class LessonsState extends Equatable {
  ResponseStatus status;
  String message;
  List lessons;

  LessonsState(
      {this.status = ResponseStatus.pure,
      this.message = '',
      required this.lessons});

  copyWith({
    ResponseStatus? status,
    String? message,
    List? lessons,
  }) =>
      LessonsState(
          lessons: lessons ?? this.lessons,
          message: message ?? this.message,
          status: status ?? this.status);
  @override
  List<Object?> get props => [status, lessons, message];
}
