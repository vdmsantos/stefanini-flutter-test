import '../../login_imports.dart';

class TopLogoContainer extends StatelessWidget {
  const TopLogoContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      child: Container(
        height: context.width * 0.5,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              context.theme.colorScheme.greenFF37C66D,
              context.theme.colorScheme.green461651301,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(60),
          width: context.width,
          child: Image.asset(AppImageAssets.logo),
        ),
      ),
    );
  }
}
