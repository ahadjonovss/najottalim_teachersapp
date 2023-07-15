import 'package:najottalim_teachersapp/utils/tools/file_importer.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    FirebaseAuth auth = FirebaseAuth.instance;
    dynamic user = auth.currentUser;
    Future.delayed(const Duration(seconds: 3)).then((value) =>
        Navigator.pushNamedAndRemoveUntil(context,
            user == null ? RouteName.login : RouteName.home, (route) => false));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AdaptiveTheme.of(context).theme.backgroundColor,
      body: Container(
        padding: EdgeInsets.all(40.h),
        height: height(context),
        width: width(context),
        child: Center(
          child: Image.asset(
            AppImages.Logo,
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }
}
