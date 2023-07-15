import 'package:najottalim_teachersapp/utils/tools/file_importer.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthorizationBloc(),
      child: BlocConsumer<AuthorizationBloc, AuthorizationState>(
        listener: (context, state) {
          if (state.status == ResponseStatus.inSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, RouteName.home, (route) => false);
          } else if (state.status == ResponseStatus.inFail) {
            AnimatedSnackBar(
                    duration: const Duration(seconds: 4),
                    snackBarStrategy: RemoveSnackBarStrategy(),
                    builder: (context) => AppErrorSnackBar(text: state.message))
                .show(context);
          }
        },
        builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: AdaptiveTheme.of(context).theme.backgroundColor,
            body: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Image.asset(AppImages.Logo,
                              width: width(context) * 0.4),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "log_in_to_your_account".tr,
                            style:
                                AppTextStyles.labelLarge(context, fontSize: 15),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Column(
                          children: <Widget>[
                            AuthTextField(
                                label: "email", hintText: "enter_your_email"),
                            AuthTextField(
                                label: "password",
                                hintText: "enter_your_password"),
                          ],
                        ),
                      ),
                      LoginButton()
                    ],
                  ))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
