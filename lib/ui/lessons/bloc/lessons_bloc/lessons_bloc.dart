import 'package:najottalim_teachersapp/utils/tools/file_importer.dart';

part 'lessons_event.dart';
part 'lessons_state.dart';

class LessonsBloc extends Bloc<LessonsEvent, LessonsState> {
  LessonsBloc() : super(LessonsState(lessons: [])) {
    on<AddLessonToTheGroupEvent>(addLessonToTheGroup);
  }

  addLessonToTheGroup(AddLessonToTheGroupEvent event, emit) async {
    emit(state.copyWith(status: ResponseStatus.inProgress));
    MyResponse myResponse = await getIt<LessonsRepository>()
        .addLessonToTheGroup(event.groupId, event.lessons);
    if (myResponse.message.isNull) {
      emit(state.copyWith(status: ResponseStatus.inSuccess));
    } else {
      emit(state.copyWith(
          status: ResponseStatus.inFail, message: myResponse.message));
    }
    emit(state.copyWith(status: ResponseStatus.pure));
  }
}
