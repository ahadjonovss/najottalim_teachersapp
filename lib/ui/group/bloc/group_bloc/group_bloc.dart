import '../../../../utils/tools/file_importer.dart';

part 'group_event.dart';
part 'group_state.dart';

class GroupBloc extends Bloc<GroupEvent, GroupState> {
  GroupBloc() : super(GroupState(groups: [], groupsStudents: [])) {
    on<GetGroupsStudentsEvent>(getGroupsStudents);
  }

  getGroupsStudents(GetGroupsStudentsEvent event, emit) async {
    emit(state.copyWith(groupsStudentsStatus: ResponseStatus.inProgress));
    MyResponse myResponse =
        await getIt<GroupRepository>().getGroupsStudents(event.studentIds);
    if (myResponse.message.isNull) {
      emit(state.copyWith(
          groupsStudentsStatus: ResponseStatus.inSuccess,
          groupsStudents: myResponse.data));
    } else {
      emit(state.copyWith(groupsStudentsStatus: ResponseStatus.inFail));
    }
  }
}
