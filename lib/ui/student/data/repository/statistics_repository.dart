import 'package:najottalim_teachersapp/utils/constants/app_lotties.dart';

import '../../../../utils/tools/file_importer.dart';

class StatisticsRepository {
  double getAverageRating(List balls) {
    double scores = 0;
    int count = 0;
    for (BallModel i in balls) {
      scores += i.ball!;
      count++;
    }
    print((scores / count) * 0.01);
    return scores / count;
  }

  String getLottie(List balls) {
    double averageScore = getAverageRating(balls);
    String lottie;
    if (averageScore <= 30) {
      lottie = AppLotties.less30;
    } else if (averageScore > 30 && averageScore <= 50) {
      lottie = AppLotties.less50;
    } else if (averageScore > 50 && averageScore <= 70) {
      lottie = AppLotties.less70;
    } else if (averageScore > 70 && averageScore <= 90) {
      lottie = AppLotties.less90;
    } else {
      lottie = AppLotties.more90;
    }
    return lottie;
  }
}
