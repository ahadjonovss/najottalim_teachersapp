import 'package:najottalim_teachersapp/ui/main/data/models/teacher_model.dart';

import '../../../../utils/tools/file_importer.dart';

part 'teacher_event.dart';
part 'teacher_state.dart';

class TeacherBloc extends Bloc<TeacherEvent, TeacherState> {
  TeacherBloc() : super(TeacherState(groups: [])) {
    on<GetTeacherEvent>(getTeacher);
    on<GetTeachersGroupsEvent>(getTeachersGroups);
  }

  getTeacher(event, emit) async {
    emit(state.copyWith(status: ResponseStatus.inProgress));
    MyResponse myResponse = await getIt<TeacherRepository>().getUserData();
    if (myResponse.message.isNull) {
      emit(state.copyWith(
          status: ResponseStatus.inSuccess, teacher: myResponse.data));
      add(GetTeachersGroupsEvent(state.teacher!.groupIds));
    } else {
      emit(state.copyWith(
          status: ResponseStatus.inFail, message: myResponse.message));
    }
  }

  getTeachersGroups(GetTeachersGroupsEvent event, emit) async {
    emit(state.copyWith(groupsStatus: ResponseStatus.inProgress));
    MyResponse myResponse =
        await getIt<TeacherRepository>().getTeachersGroup(event.groupIds);
    if (myResponse.message.isNull) {
      emit(state.copyWith(
          groupsStatus: ResponseStatus.inSuccess, groups: myResponse.data));
    } else {
      emit(state.copyWith(groupsStatus: ResponseStatus.inFail));
    }
  }
}
