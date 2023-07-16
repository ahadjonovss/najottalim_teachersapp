import 'package:flutter/cupertino.dart';
import 'package:najottalim_teachersapp/utils/tools/file_importer.dart';

class LessonsPage extends StatefulWidget {
  LessonInputDataModel inputData;
  LessonsPage({required this.inputData, super.key});

  @override
  State<LessonsPage> createState() => _LessonsPageState();
}

class _LessonsPageState extends State<LessonsPage> {
  @override
  Widget build(BuildContext context) {
    GroupModel group = widget.inputData.group;
    return BlocListener<LessonsBloc, LessonsState>(
      listener: (context, state) {
        if (state.status == ResponseStatus.inProgress) {
          Navigator.pop(context);
          showCupertinoDialog(
              context: context,
              builder: (context) => const CupertinoAlertDialog(
                    content: CircularProgressIndicator(),
                  ));
        } else if (state.status == ResponseStatus.inSuccess) {
          // widget.group.lessons.add(selectedDate);
          setState(() {});
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Image.asset(AppImages.Logo, height: 40.h),
          backgroundColor: AdaptiveTheme.of(context).theme.backgroundColor,
          elevation: 0,
        ),
        backgroundColor: AdaptiveTheme.of(context).theme.backgroundColor,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.h),
            child: Column(
              children: [
                AddLessonButton(
                    group: group, isVisible: widget.inputData.isAddScore),
                SizedBox(height: 6.h),
                Divider(color: AdaptiveTheme.of(context).theme.focusColor),
                SizedBox(height: 12.h),
                Expanded(
                  child: ListView.builder(
                      itemCount: group.lessons.length,
                      itemBuilder: (context, index) =>
                          LessonItem(label: group.lessons[index])),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
