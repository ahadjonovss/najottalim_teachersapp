import '../../../../utils/tools/file_importer.dart';

class LessonItem extends StatelessWidget {
  String label;
  bool isAddScore;
  LessonItem({required this.isAddScore, required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return OnTap(
      onTap: () {
        if (isAddScore) {
          Navigator.pushNamed(context, RouteName.scoring, arguments: label);
        } else {
          Navigator.pushNamed(context, RouteName.scores, arguments: label);
        }
      },
      child: SizedBox(
        width: width(context),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                    backgroundColor: AdaptiveTheme.of(context).theme.hintColor,
                    radius: 22,
                    backgroundImage: const AssetImage(AppIcons.topic)),
                SizedBox(
                  width: width(context) * 0.78,
                  child: Text(
                    label,
                    style: AppTextStyles.labelLarge(context,
                        fontSize: 16.h, fontWeight: FontWeight.w400),
                  ),
                )
              ],
            ),
            SizedBox(height: 6.h),
            Divider(color: AdaptiveTheme.of(context).theme.focusColor),
          ],
        ),
      ),
    );
  }
}
