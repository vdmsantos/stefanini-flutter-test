import 'package:another_flushbar/flushbar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stefanini_flutter_test/app/modules/login/login_imports.dart';

enum SnackBarType { info, error, success, alert }

Flushbar customSnackBar(SnackBarType snackType, String text, String description,
    {String? infoIconPath, Widget? textDescription, Duration? duration}) {
  TextStyle getSnackTitleTextTheme() {
    switch (snackType) {
      case SnackBarType.error:
        return const TextTheme().smallRedRegularTextStyle;
      case SnackBarType.success:
        return const TextTheme().smallGreen461651301RegularTextStyle;
      case SnackBarType.info:
        return const TextTheme().smallBlackRegularTextStyle;
      case SnackBarType.alert:
        return const TextTheme().smallBlackRegularTextStyle;
    }
  }

  getSnackBackgroundColor() {
    switch (snackType) {
      case SnackBarType.error:
        return AppColors.redFFFBECEB;
      case SnackBarType.success:
        return AppColors.greenFFA9E9D3;
      case SnackBarType.info:
        return AppColors.blueFFF5FBFF;
      case SnackBarType.alert:
        return AppColors.yellowFFFEF0D9;
    }
  }

  String getSnackIconPath() {
    switch (snackType) {
      case SnackBarType.error:
        return AppImageAssets.snackBarErrorIcon;
      case SnackBarType.success:
        return AppImageAssets.snackBarSuccessIcon;
      case SnackBarType.info:
        return infoIconPath ?? '';
      case SnackBarType.alert:
        return AppImageAssets.snackBarAlertIcon;
    }
  }

  getSnackBorderColor() {
    switch (snackType) {
      case SnackBarType.error:
        return AppColors.redFFEDA09C.withAlpha(50);
      case SnackBarType.success:
        return AppColors.greenFF20B858.withAlpha(50);
      case SnackBarType.info:
        return AppColors.blueFFB4E5FD.withAlpha(50);
      case SnackBarType.alert:
        return AppColors.yellowFFFAA61A.withAlpha(50);
    }
  }

  return Flushbar(
    flushbarPosition: FlushbarPosition.TOP,
    dismissDirection: FlushbarDismissDirection.HORIZONTAL,
    boxShadows: [
      BoxShadow(
        blurRadius: 11,
        color: Colors.black.withAlpha(4),
        offset: const Offset(0, 4),
      ),
    ],
    shouldIconPulse: true,
    backgroundColor: getSnackBackgroundColor(),
    duration: duration ?? const Duration(seconds: 3),
    padding: const EdgeInsets.only(left: 20, top: 15, bottom: 15, right: 20),
    icon: SvgPicture.asset(getSnackIconPath()),
    messageColor: getSnackBackgroundColor(),
    messageText: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: getSnackTitleTextTheme(),
        ),
        const SizedBox(
          height: 4,
        ),
        textDescription ??
            Text(
              description,
              style: const TextTheme().small14BlackTextStyle,
            )
      ],
    ),
    margin: const EdgeInsets.only(top: 12, bottom: 10, left: 20, right: 20),
    borderRadius: BorderRadius.circular(12),
    borderColor: getSnackBorderColor(),
  );
}
