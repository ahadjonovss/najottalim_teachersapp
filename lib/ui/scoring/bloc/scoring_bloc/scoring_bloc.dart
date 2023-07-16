import 'package:najottalim_teachersapp/utils/tools/file_importer.dart';

part 'scoring_event.dart';
part 'scoring_state.dart';

class ScoringBloc extends Bloc<ScoringEvent, ScoringState> {
  ScoringBloc() : super(ScoringState()) {
    on<AddScoresToTheStudentsEvent>(addScoresToTheStudents);
    on<PostScoresToTheStudentsEvent>(postScoresToTheStudents);
  }

  addScoresToTheStudents(event, emit) {
    emit(AddScoreToStudentsState());
  }

  postScoresToTheStudents(PostScoresToTheStudentsEvent event, emit) async {
    if (state is AddScoreToStudentsState) {
      emit(ScoringState(status: ResponseStatus.inProgress));
    } else {
      emit(state.copyWith(status: ResponseStatus.inProgress));
    }

    MyResponse myResponse =
        await getIt<ScoringRepository>().postScoresToStudents(event.students);

    if (myResponse.message.isNull) {
      emit(state.copyWith(status: ResponseStatus.inSuccess));
    } else {
      emit(state.copyWith(
          status: ResponseStatus.inFail, message: myResponse.message));
    }
  }
}
