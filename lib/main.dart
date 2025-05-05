import 'package:ecommerce_app_login/configs/app.dart';
import 'package:ecommerce_app_login/configs/apptheme.dart';
import 'package:ecommerce_app_login/domain/bloc/profile/profile_bloc.dart';
import 'package:ecommerce_app_login/domain/cubit/theme/theme_cubit.dart';
import 'package:ecommerce_app_login/services/auth_services.dart';
import 'package:ecommerce_app_login/ui/edit_profile/cubit/update_cubit.dart';
import 'package:ecommerce_app_login/ui/home_screen/home_screen.dart';
import 'package:ecommerce_app_login/ui/login/login_screen.dart';
import 'package:ecommerce_app_login/ui/signup/cubit/register_cubit.dart';
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
  Widget build(final BuildContext context) => MultiBlocProvider(
    providers: [
      BlocProvider<ThemeCubit>(create: (final context) => ThemeCubit()),
      BlocProvider<RegisterCubit>(create: (final context) => RegisterCubit()),
      BlocProvider<UpdateCubit>(create: (final context) => UpdateCubit()),
      BlocProvider<ProfileBloc>(create: (final context) => ProfileBloc()),
    ],
    child: const MainApp(),
  );
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(final BuildContext context) {
    final themeCubit = BlocProvider.of<ThemeCubit>(context, listen: true);
    return MaterialApp(
      navigatorKey: navigatorKey,
      themeMode: themeCubit.themeMode,
      theme: AppTheme.theme,
      darkTheme: AppTheme.theme,
      debugShowCheckedModeBanner: false,
      builder: (final context, final child) {
        ///
        /// Initial Properties of app are initiated
        ///
        App.init(context);
        return child!;
      },
      home: FutureBuilder(
        future: Future(() async => AuthService().isLoggedIn()),

        builder: (final context, final snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              if (snapshot.data != null) {
                if (snapshot.data!) {
                  context.read<ProfileBloc>().add(FetchProfile());

                  return const HomeScreen();
                } else {
                  return const LoginScreen();
                }
              }
            }
          }
          return const Scaffold(body: Center(child: FlutterLogo()));
        },
      ),
    );
  }
}
