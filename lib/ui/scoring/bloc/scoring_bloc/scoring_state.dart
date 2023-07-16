part of 'scoring_bloc.dart';

@immutable
class ScoringState extends Equatable {
  String message;
  ResponseStatus status;

  ScoringState({this.status = ResponseStatus.pure, this.message = ''});

  copyWith({String? message, ResponseStatus? status}) => ScoringState(
      message: message ?? this.message, status: status ?? this.status);

  @override
  List<Object?> get props => [message, status];
}

class AddScoreToStudentsState extends ScoringState {}
