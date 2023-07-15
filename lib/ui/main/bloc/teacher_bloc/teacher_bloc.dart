import 'package:najottalim_teachersapp/ui/main/data/models/teacher_model.dart';

import '../../../../utils/tools/file_importer.dart';

part 'teacher_event.dart';
part 'teacher_state.dart';

class TeacherBloc extends Bloc<TeacherEvent, TeacherState> {
  TeacherBloc() : super(TeacherState()) {
    on<GetTeacherEvent>(getTeacher);
  }

  getTeacher(event, emit) async {
    emit(state.copyWith(status: ResponseStatus.inProgress));
    MyResponse myResponse = await getIt<TeacherRepository>().getUserData();
    if (myResponse.message.isNull) {
      emit(state.copyWith(
          status: ResponseStatus.inSuccess, teacher: myResponse.data));
    } else {
      emit(state.copyWith(
          status: ResponseStatus.inFail, message: myResponse.message));
    }
  }
}
