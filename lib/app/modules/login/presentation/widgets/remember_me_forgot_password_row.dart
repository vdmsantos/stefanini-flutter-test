import 'package:flutter_bloc/flutter_bloc.dart';

import '../../login_imports.dart';

class RememberMeForgotPasswordRow extends StatefulWidget {
  const RememberMeForgotPasswordRow({
    super.key,
  });

  @override
  State<RememberMeForgotPasswordRow> createState() =>
      _RememberMeForgotPasswordRowState();
}

class _RememberMeForgotPasswordRowState
    extends State<RememberMeForgotPasswordRow> {
  late LoginCubit loginCubit;

  @override
  void initState() {
    loginCubit = BlocProvider.of<LoginCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CheckboxLabel(
              padding: const EdgeInsets.only(right: 12),
              value: loginCubit.remember,
              label: AppStrings.rememberMe,
              onChanged: (value) => loginCubit.setRemember(value),
            ),
            GestureDetector(
              child: Text(
                AppStrings.forgotPassword,
                style: context.theme.textTheme.smallGreenTextStyle.copyWith(
                    fontSize: 15,
                    decoration: TextDecoration.underline,
                    decorationColor: context.theme.colorScheme.greenFF018E01),
              ),
            )
          ],
        );
      },
    );
  }
}
