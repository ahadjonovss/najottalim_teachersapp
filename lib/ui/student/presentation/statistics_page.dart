import '../../../utils/tools/file_importer.dart';

class StatisticsPage extends StatelessWidget {
  StudentModel user;
  StatisticsPage({required this.user, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AdaptiveTheme.of(context).theme.backgroundColor,
      body: SizedBox(
        height: height(context),
        width: width(context),
        child: Stack(
          children: [
            Positioned(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    HomeCarousel(),
                    Positioned(
                        right: 10,
                        left: 10,
                        child: Padding(
                          padding: EdgeInsets.all(60.h),
                          child: Lottie.asset(
                              getIt<StatisticsRepository>()
                                  .getLottie(user.balls),
                              fit: BoxFit.fitHeight,
                              height: height(context) * 0.2,
                              width: width(context) * 0.2),
                        ))
                  ],
                ),
                SizedBox(height: 20.h),
                SizedBox(height: height(context) * 0.2),
                Container(
                  margin: EdgeInsets.only(left: 20.h),
                  height: 170,
                  width: 170,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(12.h),
                  ),
                  child: SquarePercentIndicator(
                    width: 140,
                    height: 140,
                    startAngle: StartAngle.topLeft,
                    reverse: true,
                    borderRadius: 12.h,
                    shadowWidth: 1.5,
                    progressWidth: 5,
                    shadowColor: Colors.grey,
                    progressColor: AppColors.cGold,
                    progress: getIt<StatisticsRepository>()
                            .getAverageRating(user.balls) *
                        0.01,
                    child: Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${(getIt<StatisticsRepository>().getAverageRating(user.balls)).round()}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 28.h),
                        ),
                        Text("average_score".tr,
                            style: AppTextStyles.labelLarge(context,
                                color: AppColors.cGold)),
                      ],
                    )),
                  ),
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                //   children: [
                //     Container(
                //       height: 170,
                //       width: 170,
                //       decoration: BoxDecoration(
                //         color: Colors.yellow,
                //         borderRadius: BorderRadius.circular(12.h),
                //       ),
                //       child: Column(
                //         children: [
                //           CircularPercentIndicator(
                //             radius: 60.0,
                //             lineWidth: 5.0,
                //             percent: 0.56,
                //             circularStrokeCap: CircularStrokeCap.round,
                //             center: new Text("100%"),
                //             progressColor: Colors.green,
                //           )
                //         ],
                //       ),
                //     ),
                //     Container(
                //       height: 170,
                //       width: 170,
                //       decoration: BoxDecoration(
                //           color: Colors.yellow,
                //           borderRadius: BorderRadius.circular(12)),
                //     ),
                //   ],
                // ),
                // SizedBox(height: 20.h),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                //   children: [
                //     Container(
                //       height: 170,
                //       width: 170,
                //       decoration: BoxDecoration(
                //           color: Colors.yellow,
                //           borderRadius: BorderRadius.circular(12)),
                //     ),
                //     Container(
                //       height: 170,
                //       width: 170,
                //       decoration: BoxDecoration(
                //           color: Colors.yellow,
                //           borderRadius: BorderRadius.circular(12)),
                //     ),
                //   ],
                // ),
              ],
            )),
            Positioned(
                top: height(context) * 0.23,
                child: Container(
                  width: width(context) * 0.9,
                  margin: EdgeInsets.symmetric(horizontal: 22.h),
                  decoration: BoxDecoration(
                      color: AdaptiveTheme.of(context).theme.focusColor,
                      borderRadius: BorderRadius.circular(10.h)),
                  child: LineChartSample2(
                      isFromHomePage: false,
                      balls: user.balls.cast(),
                      context: context),
                ))
          ],
        ),
      ),
    );
  }
}
