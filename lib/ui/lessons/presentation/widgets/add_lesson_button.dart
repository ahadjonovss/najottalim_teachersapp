import 'package:flutter/cupertino.dart';

import '../../../../utils/tools/file_importer.dart';

class AddLessonButton extends StatelessWidget {
  GroupModel group;
  bool isVisible;
  AddLessonButton({required this.isVisible, required this.group, super.key});

  @override
  Widget build(BuildContext context) {
    String selectedDate =
        "${DateTime.now().day > 9 ? "${DateTime.now().day}" : "0${DateTime.now().day}"}.${DateTime.now().month > 9 ? "${DateTime.now().month}" : "0${DateTime.now().month}"}.${DateTime.now().year}";

    return Visibility(
      visible: isVisible,
      child: OnTap(
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
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CupertinoActionSheetAction(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("cancel".tr)),
                          CupertinoActionSheetAction(
                              onPressed: () {
                                List lessons = group.lessons;
                                lessons.add(selectedDate);
                                context.read<LessonsBloc>().add(
                                    AddLessonToTheGroupEvent(
                                        group.groupId, lessons));
                              },
                              child: Text("save".tr))
                        ],
                      )
                    ],
                  ),
              backgroundColor: AdaptiveTheme.of(context).theme.backgroundColor);
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
    );
  }
}
