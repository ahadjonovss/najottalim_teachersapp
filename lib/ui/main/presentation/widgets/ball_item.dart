import 'package:najottalim_teachersapp/utils/tools/file_importer.dart';

class BallItem extends StatelessWidget {
  BallModel? ball;
  BallItem({required this.ball, super.key});

  @override
  Widget build(BuildContext context) {
    return ball.isNull
        ? Text("not_scored".tr,
            style: AppTextStyles.labelLarge(context,
                color: AdaptiveTheme.of(context).theme.cardColor))
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 12.h),
                height: height(context) * 0.08,
                width: height(context) * 0.12,
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
                              fontSize: 32.h,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.only(left: 12.w, top: 4.h),
                  width: height(context) * 0.12,
                  alignment: Alignment.center,
                  child: Text(ball!.date,
                      style: AppTextStyles.labelLarge(context)))
            ],
          );
  }
}
