import '../../login_imports.dart';

class LoginPage extends StatelessWidget {
  static String route = '/login';

  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: context.height,
          child: const Stack(
            children: [
              TopLogoContainer(),
              LoginBody(),
            ],
          ),
        ),
      ),
    );
  }
}
