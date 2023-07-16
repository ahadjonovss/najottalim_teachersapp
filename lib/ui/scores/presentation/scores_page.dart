import 'package:najottalim_teachersapp/ui/scores/presentation/widgets/student_score_item.dart';

import '../../../utils/tools/file_importer.dart';

class ScoresPage extends StatelessWidget {
  String lesson;
  ScoresPage({required this.lesson, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(lesson, style: AppTextStyles.labelLarge(context)),
        backgroundColor: AdaptiveTheme.of(context).theme.backgroundColor,
        elevation: 0,
      ),
      backgroundColor: AdaptiveTheme.of(context).theme.backgroundColor,
      body: BlocBuilder<GroupBloc, GroupState>(
        builder: (context, state) {
          return SizedBox(
            height: height(context),
            child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) => StudentScoreItem(
                  student: state.groupsStudents[index], lesson: lesson),
              itemCount: state.groupsStudents.length,
            ),
          );
        },
      ),
    );
  }
}
