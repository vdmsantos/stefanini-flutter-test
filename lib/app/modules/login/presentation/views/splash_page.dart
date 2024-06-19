import '../../login_imports.dart';
import 'login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});
  static String route = '/';

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _loadNextScreen(context);
  }

  void _loadNextScreen(BuildContext context) async {
    Future.delayed(
      const Duration(milliseconds: 2500),
      () {
        if (mounted) {
          Navigator.of(context).pushReplacementNamed(
            LoginPage.route,
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
      height: context.height,
      width: context.width,
      child: Center(
        child: Image.asset(
          AppImageAssets.logo,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
