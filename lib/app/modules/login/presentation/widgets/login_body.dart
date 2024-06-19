import 'package:flutter_bloc/flutter_bloc.dart';

import '../../login_imports.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({
    super.key,
  });

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  late LoginCubit loginCubit;
  @override
  void initState() {
    loginCubit = BlocProvider.of<LoginCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is SignInError) {
          customSnackBar(SnackBarType.error, AppStrings.somethingHappened,
                  AppStrings.tryAgainInFewMinutes)
              .show(context);
        } else if (state is SignInSucess) {
          customSnackBar(SnackBarType.success, AppStrings.welcome, '')
              .show(context);
        }
      },
      builder: (context, state) {
        return Positioned(
          top: 160,
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            padding: const EdgeInsets.only(top: 60),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              color: context.theme.colorScheme.primaryWhite,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  Text(
                    AppStrings.welcomeBack,
                    style: context.theme.textTheme.largeGreenTextStyle,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      AppStrings.logginToYourAccount,
                      style: context.theme.textTheme.mediumGreyTextStyle,
                    ),
                  ),
                  StandardTextField(
                    onChanged: (value) => loginCubit.fetch(),
                    padding: const EdgeInsets.only(bottom: 24, top: 40),
                    controller: loginCubit.emailEditController,
                    compoundableFormatter: EmailInputFormatter(),
                  ),
                  StandardTextField(
                    onChanged: (value) => loginCubit.fetch(),
                    padding: const EdgeInsets.only(bottom: 10),
                    controller: loginCubit.passwordEditController,
                    compoundableFormatter: PasswordInputFormatter(),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 40),
                    child: RememberMeForgotPasswordRow(),
                  ),
                  StandardButton(
                    loading: state is SignInLoading,
                    onPressed: () {
                      loginCubit.signIn();
                    },
                    enabled: loginCubit.getButtonStatus(),
                    text: AppStrings.submit,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
