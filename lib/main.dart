import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stefanini_flutter_test/routes.dart';
import 'package:stefanini_flutter_test/app/modules/core/extensions/app_theme.dart';
import 'package:stefanini_flutter_test/app/modules/core/provider/injection_container.main.dart';
import 'package:stefanini_flutter_test/app/modules/login/presentation/cubit/login_cubit.dart';
import 'package:stefanini_flutter_test/app/modules/login/presentation/views/splash_page.dart';
import 'package:get_it/get_it.dart';

void main() {
  init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    GetIt getIt = GetIt.instance;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt.get<LoginCubit>(),
        ),
      ],
      child: MaterialApp(
        routes: routes,
        initialRoute: SplashPage.route,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.themeData,
      ),
    );
  }
}
