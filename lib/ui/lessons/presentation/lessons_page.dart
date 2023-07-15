import 'package:flutter/cupertino.dart';
import 'package:najottalim_teachersapp/ui/lessons/bloc/lessons_bloc/lessons_bloc.dart';
import 'package:najottalim_teachersapp/utils/tools/file_importer.dart';

class LessonsPage extends StatefulWidget {
  GroupModel group;
  LessonsPage({required this.group, super.key});

  @override
  State<LessonsPage> createState() => _LessonsPageState();
}

class _LessonsPageState extends State<LessonsPage> {
  String selectedDate =
      "${DateTime.now().day > 9 ? "${DateTime.now().day}" : "0${DateTime.now().day}"}.${DateTime.now().month > 9 ? "${DateTime.now().month}" : "0${DateTime.now().month}"}.${DateTime.now().year}";

  @override
  Widget build(BuildContext context) {
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
                OnTap(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) => CupertinoActionSheet(
                              title: SizedBox(
                                height: height(context) * 0.4,
                                width: width(context),
                                child: CupertinoDatePicker(
                                  mode: CupertinoDatePickerMode.date,
                                  maximumYear: DateTime.now().year,
                                  minimumYear: DateTime.now().year,
                                  initialDateTime: DateTime.now(),
                                  onDateTimeChanged: (value) {
                                    selectedDate =
                                        "${value.day > 9 ? "${value.day}" : "0${value.day}"}.${value.month > 9 ? "${value.month}" : "0${value.month}"}.${value.year}";
                                  },
                                ),
                              ),
                              actions: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    CupertinoActionSheetAction(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("cancel".tr)),
                                    CupertinoActionSheetAction(
                                        onPressed: () {
                                          List lessons = widget.group.lessons;
                                          lessons.add(selectedDate);
                                          context.read<LessonsBloc>().add(
                                              AddLessonToTheGroupEvent(
                                                  widget.group.groupId,
                                                  lessons));
                                        },
                                        child: Text("save".tr))
                                  ],
                                )
                              ],
                            ),
                        backgroundColor:
                            AdaptiveTheme.of(context).theme.backgroundColor);
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.play_lesson,
                        size: 32.h,
                        color: AppColors.c006ED1,
                      ),
                      SizedBox(width: 12.h),
                      Text("add_lesson".tr,
                          style: AppTextStyles.labelLarge(context,
                              fontSize: 16.h, fontWeight: FontWeight.w300)),
                    ],
                  ),
                ),
                SizedBox(height: 6.h),
                Divider(color: AdaptiveTheme.of(context).theme.focusColor),
                SizedBox(height: 12.h),
                Expanded(
                  child: ListView.builder(
                      itemCount: widget.group.lessons.length,
                      itemBuilder: (context, index) =>
                          LessonItem(label: widget.group.lessons[index])),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
