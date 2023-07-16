import 'package:najottalim_teachersapp/ui/scores/presentation/widgets/student_ball_item.dart';

import '../../../../utils/tools/file_importer.dart';

class StudentScoreItem extends StatelessWidget {
  StudentModel student;
  String lesson;
  StudentScoreItem({required this.lesson, required this.student, super.key});

  @override
  Widget build(BuildContext context) {
    BallModel? findRequiredBall() {
      BallModel? studentsBall;
      for (BallModel ball in student.balls) {
        if (ball.date == lesson) {
          studentsBall = ball;
        }
      }
      return studentsBall;
    }

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12.h, vertical: 6.h),
      width: width(context),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                  backgroundColor: AdaptiveTheme.of(context).theme.hintColor,
                  radius: 22,
                  backgroundImage: const AssetImage(AppImages.Logo)),
              SizedBox(
                width: width(context) * 0.6,
                child: Text(
                  "${student.surname} ${student.name}",
                  style: AppTextStyles.labelLarge(context,
                      fontSize: 16.h, fontWeight: FontWeight.w400),
                ),
              ),
              StudentBallItem(ball: findRequiredBall())
            ],
          ),
          SizedBox(height: 6.h),
          Divider(color: AdaptiveTheme.of(context).theme.focusColor),
        ],
      ),
    );
  }
}
