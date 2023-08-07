import '../../../../utils/tools/file_importer.dart';

class ScorableStudentItem extends StatelessWidget {
  StudentModel student;
  String label;
  ScorableStudentItem({required this.label, required this.student, super.key});

  BallModel ball = BallModel(date: '');

  @override
  Widget build(BuildContext context) {
    List balls = student.balls.map((e) => e.date).toList();

    return balls.contains(label)
        ? const SizedBox()
        : BlocListener<ScoringBloc, ScoringState>(
            listener: (context, state) {
              if (state is AddScoreToStudentsState) {
                if (!ball.ball.isNull) {
                  student.balls.add(ball);
                }
              }
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
                      SizedBox(
                          height: 40.h,
                          width: 60,
                          child: TextField(
                            onChanged: (value) {
                              ball.ball = int.parse(value ?? '');
                              ball.date = label;
                            },
                            keyboardType: TextInputType.number,
                            style: AppTextStyles.labelLarge(context),
                            decoration: InputDecoration(
                              labelStyle: AppTextStyles.labelLarge(context,
                                  color: AdaptiveTheme.of(context)
                                      .theme
                                      .cardColor),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AdaptiveTheme.of(context)
                                        .theme
                                        .cardColor),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AdaptiveTheme.of(context)
                                        .theme
                                        .cardColor),
                              ),
                            ),
                          ))
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
