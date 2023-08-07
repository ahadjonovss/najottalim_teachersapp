import 'package:carousel_slider/carousel_slider.dart';

import '../../../../utils/tools/file_importer.dart';

class HomeCarousel extends StatefulWidget {
  @override
  _HomeCarouselState createState() => _HomeCarouselState();
}

class _HomeCarouselState extends State<HomeCarousel> {
  List<String> imageUrls = [
    AppImages.najottalim1,
    AppImages.najottalim2,
    AppImages.najottalim3,
    // Add more image URLs here
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: imageUrls.length,
      options: CarouselOptions(
        aspectRatio: 16 / 9,
        height: height(context) * 0.28,
        scrollPhysics: const NeverScrollableScrollPhysics(),
        viewportFraction: 1,
        enlargeCenterPage: true,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 5),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
      ),
      itemBuilder: (context, index, realIndex) {
        return SizedBox(
          height: height(context) * 0.28,
          width: width(context),
          child: Image.asset(
            imageUrls[index],
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }
}
