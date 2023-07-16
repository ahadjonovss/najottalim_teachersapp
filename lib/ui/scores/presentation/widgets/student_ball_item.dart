import '../../../../utils/tools/file_importer.dart';

class StudentBallItem extends StatelessWidget {
  BallModel? ball;
  StudentBallItem({required this.ball, super.key});

  @override
  Widget build(BuildContext context) {
    return ball.isNull
        ? Text("not_scored".tr,
            style: AppTextStyles.labelLarge(context,
                color: AdaptiveTheme.of(context).theme.cardColor))
        : Container(
            margin: EdgeInsets.only(left: 12.h),
            height: height(context) * 0.04,
            width: height(context) * 0.06,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    end: Alignment.topLeft,
                    begin: Alignment.bottomRight,
                    colors: ball!.specifics!.gradient),
                borderRadius: BorderRadius.circular(6.h)),
            alignment: Alignment.center,
            child: Stack(
              children: [
                Image.asset(
                  ball!.specifics!.backgroundImage,
                  color: Colors.white.withOpacity(0.1),
                  alignment: ball!.specifics!.backgroundAllignment,
                ),
                Positioned(
                  child: Container(
                    height: height(context) * 0.08,
                    width: height(context) * 0.12,
                    alignment: Alignment.center,
                    child: Text(
                      ball!.ball.toString(),
                      style: AppTextStyles.labelLarge(context,
                          fontSize: 22.h,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
