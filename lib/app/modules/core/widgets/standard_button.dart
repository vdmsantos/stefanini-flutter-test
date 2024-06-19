import 'package:stefanini_flutter_test/app/modules/login/login_imports.dart';

class StandardButton extends StatelessWidget {
  const StandardButton({
    super.key,
    required this.text,
    this.onPressed,
    this.loading = false,
    this.enabled = true,
  });
  final bool loading;
  final String text;
  final bool enabled;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 15),
          backgroundColor:
              enabled ? Colors.black : const Color.fromARGB(255, 192, 192, 192),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        onPressed: enabled
            ? () {
                if (onPressed != null) {
                  onPressed!();
                }
              }
            : null,
        child: !loading
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    text,
                    style: context.theme.textTheme.mediumWhiteTextStyle,
                  ),
                ],
              )
            : Center(
                child: SizedBox(
                  child: CircularProgressIndicator.adaptive(
                    backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                    valueColor: AlwaysStoppedAnimation(
                      context.theme.colorScheme.primaryWhite,
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
