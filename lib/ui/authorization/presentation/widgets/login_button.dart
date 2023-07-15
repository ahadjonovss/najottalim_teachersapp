import 'package:najottalim_teachersapp/utils/tools/file_importer.dart';

class LoginButton extends StatelessWidget {
  LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ValidatorBloc, ValidatorState>(
      builder: (context, state) {
        bool isValid = state.emailValidationStatus == ValidationStatus.valid &&
            state.passwordValidationStatus == ValidationStatus.valid;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Container(
            padding:
                const EdgeInsets.only(top: 3, left: 3, right: 3, bottom: 3),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border(
                  bottom: BorderSide(
                      color: AdaptiveTheme.of(context).theme.hintColor),
                  top: BorderSide(
                      color: AdaptiveTheme.of(context).theme.hintColor),
                  left: BorderSide(
                      color: AdaptiveTheme.of(context).theme.hintColor),
                  right: BorderSide(
                      color: AdaptiveTheme.of(context).theme.hintColor),
                )),
            child: MaterialButton(
              minWidth: double.infinity,
              color: isValid
                  ? AdaptiveTheme.of(context).theme.cardColor
                  : AdaptiveTheme.of(context).theme.focusColor,
              height: 60,
              onPressed: () {
                if (isValid) {
                  context.read<AuthorizationBloc>().add(SignInEvent(
                      UserModel(email: state.email, password: state.password)));
                }
              },
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              child: BlocBuilder<AuthorizationBloc, AuthorizationState>(
                builder: (context, authState) {
                  return authState.status != ResponseStatus.inProgress
                      ? Text(
                          "login".tr,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        )
                      : const CircularProgressIndicator(
                          color: Colors.white,
                        );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
