import 'package:najottalim_teachersapp/utils/tools/file_importer.dart';

class AuthTextField extends StatelessWidget {
  String label;
  String hintText;
  AuthTextField({required this.hintText, required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label.tr,
          style: AppTextStyles.labelLarge(context,
              fontSize: 15, fontWeight: FontWeight.w400),
        ),
        const SizedBox(
          height: 5,
        ),
        TextField(
          style: AppTextStyles.labelLarge(context),
          obscureText: false,
          onChanged: (value) {
            if (label == "email") {
              context.read<ValidatorBloc>().add(ValidateEvent(email: value));
            } else {
              context.read<ValidatorBloc>().add(ValidateEvent(password: value));
            }
          },
          decoration: InputDecoration(
              hintText: hintText.tr,
              hintStyle: AppTextStyles.labelLarge(context,
                  color: AdaptiveTheme.of(context).theme.focusColor),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400),
              ),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade400))),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
