import 'package:najottalim_teachersapp/ui/scores/presentation/widgets/student_ball_item.dart';

import '../../../../utils/tools/file_importer.dart';

class StudentScoreItem extends StatelessWidget {
  StudentModel student;
  String lesson;
  StudentScoreItem({required this.lesson, required this.student, super.key});

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    BallModel? findRequiredBall() {
      BallModel? studentsBall;
      for (BallModel ball in student.balls) {
        if (ball.date == lesson) {
          controller.text = ball.ball.toString();
          studentsBall = ball;
        }
      }
      return studentsBall;
    }

    updateBall(int ball) {
      for (int i = 0; i < student.balls.length; i++) {
        if (student.balls[i].date == lesson) {
          student.balls[i].ball = ball;
        }
      }

      for (BallModel ball in student.balls) {
        print("${lesson} ${ball.ball}");
      }
    }

    return BlocListener<ScoringBloc, ScoringState>(
      listener: (context, state) {
        if (state.status == ResponseStatus.inSuccess) {
          //  Navigator.pop(context);
        }
      },
      child: OnTap(
        onTap: () {
          showDialog(
              context: context,
              // barrierDismissible: false,
              builder: (context) => AlertDialog(
                    backgroundColor:
                        AdaptiveTheme.of(context).theme.backgroundColor,
                    title: Text("${student.name} ${student.surname}",
                        style: AppTextStyles.labelLarge(context)),
                    content: TextField(
                      style: AppTextStyles.labelLarge(context),
                      controller: controller,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color:
                                    AdaptiveTheme.of(context).theme.cardColor),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color:
                                    AdaptiveTheme.of(context).theme.cardColor),
                          ),
                          border: const OutlineInputBorder()),
                      keyboardType: TextInputType.number,
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            updateBall(int.parse(controller.text.trim()));
                            context.read<ScoringBloc>().add(
                                PostScoresToTheStudentsEvent(
                                    [student], lesson));
                          },
                          child: Text("save".tr))
                    ],
                  ));
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 12.h, vertical: 6.h),
          width: width(context),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                      backgroundColor:
                          AdaptiveTheme.of(context).theme.hintColor,
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
        ),
      ),
    );
  }
}
