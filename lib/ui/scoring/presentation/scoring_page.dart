import 'package:najottalim_teachersapp/ui/scoring/presentation/widgets/scorable_student_item.dart';

import '../../../utils/tools/file_importer.dart';

class ScoringPage extends StatelessWidget {
  String lesson;
  ScoringPage({required this.lesson, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          OnTap(
              onTap: () {
                context.read<ScoringBloc>().add(AddScoresToTheStudentsEvent());
              },
              child: Text("save".tr,
                  style: AppTextStyles.labelLarge(context, color: Colors.blue)))
        ],
        title: Text(lesson, style: AppTextStyles.labelLarge(context)),
        backgroundColor: AdaptiveTheme.of(context).theme.backgroundColor,
      ),
      backgroundColor: AdaptiveTheme.of(context).theme.backgroundColor,
      body: BlocBuilder<GroupBloc, GroupState>(
        builder: (context, state) {
          if (state.groupsStudentsStatus == ResponseStatus.inSuccess) {
            state.groupsStudents.sort((a, b) => a.surname.compareTo(b.surname));
            return BlocListener<ScoringBloc, ScoringState>(
              listener: (context, scoreState) {
                if (scoreState is AddScoreToStudentsState) {
                  context
                      .read<ScoringBloc>()
                      .add(PostScoresToTheStudentsEvent(state.groupsStudents));
                } else if (scoreState.status == ResponseStatus.inProgress) {
                  showLoadingDialog(context);
                } else if (scoreState.status == ResponseStatus.inSuccess) {
                  Navigator.pop(context);
                  Navigator.pop(context);
                }
              },
              child: SizedBox(
                height: height(context),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) => ScorableStudentItem(
                      student: state.groupsStudents[index], label: lesson),
                  itemCount: state.groupsStudents.length,
                ),
              ),
            );
          }
          return CircularProgressIndicator(
              color: AdaptiveTheme.of(context).theme.cardColor);
        },
      ),
    );
  }
}
