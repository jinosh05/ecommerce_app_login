import 'package:ecommerce_app_login/configs/app.dart';
import 'package:ecommerce_app_login/configs/apptheme.dart';
import 'package:ecommerce_app_login/domain/cubit/theme/theme_cubit.dart';
import 'package:ecommerce_app_login/ui/login/login_screen.dart';
import 'package:ecommerce_app_login/ui/signup/image_selction_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider<ThemeCubit>(create: (context) => ThemeCubit())],
      child: const MainApp(),
    );
  }
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    ThemeCubit themeCubit = BlocProvider.of<ThemeCubit>(context, listen: true);
    return MaterialApp(
      navigatorKey: navigatorKey,
      themeMode: themeCubit.themeMode,
      theme: AppTheme.theme,
      darkTheme: AppTheme.theme,
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        ///
        /// Initial Properties of app are initiated
        ///
        App.init(context);
        return child!;
      },
      home: Builder(
        builder: (context) {
          return ImageSelctionUI();

          // ignore: dead_code
          return const LoginScreen();
        },
      ),
    );
  }
}
