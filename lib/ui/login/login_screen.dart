import 'package:ecommerce_app_login/configs/app_dimensions.dart';
import 'package:ecommerce_app_login/configs/app_typography.dart';
import 'package:ecommerce_app_login/configs/space.dart';
import 'package:ecommerce_app_login/configs/space_ext.dart';
import 'package:ecommerce_app_login/constants/resources.dart';
import 'package:ecommerce_app_login/db/database_helper.dart';
import 'package:ecommerce_app_login/utils/tools.dart';
import 'package:ecommerce_app_login/widgets/app_column.dart';
import 'package:ecommerce_app_login/widgets/appimage.dart';
import 'package:ecommerce_app_login/widgets/buttons/primary_button.dart';
import 'package:ecommerce_app_login/widgets/inputs/app_input_text.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ValueNotifier<bool> isPassVisible = ValueNotifier(false);
  ValueNotifier<bool> isConfPassVisible = ValueNotifier(false);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final formkey = GlobalKey<FormState>();

  bool isRegistered = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: formkey,
        child: AppColumn(
          cstart: false,
          children: [
            Space.yf(4),

            Text(S.welcome, style: AppText.h2!.cl(AppColors.grey900).w(6)),
            Padding(
              padding: Space.v1!,
              child: Text(
                S.welcomeMsg,
                style: AppText.b2!.cl(AppColors.grey500).notoSans().w(4),
              ),
            ),
            _LoginTitles(title: S.email),
            AppInputText(
              hint: S.dummyEmail,
              ctrl: emailController,
              type: AppInputType.email,
              prefixIcon: Padding(
                padding: Space.all(0.6),
                child: AppImage(imageUrl: Assets.mail),
              ),
            ),

            _LoginTitles(title: S.password),
            ValueListenableBuilder(
              valueListenable: isPassVisible,
              builder: (BuildContext context, dynamic value, Widget? child) {
                return AppInputText(
                  hint: '•••••••••',
                  visible: value,
                  type: AppInputType.password,
                  ctrl: passwordController,
                  prefixIcon: Padding(
                    padding: Space.all(0.6),
                    child: AppImage(imageUrl: Assets.passwordLock),
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () => isPassVisible.value = !isPassVisible.value,
                    child: Padding(
                      padding: Space.all(0.6),
                      child: AppImage(
                        imageUrl: value ? Assets.eyeOpen : Assets.eyeClosed,
                        color: AppColors.grayishBlue,
                        size: AppDimensions.font(6),
                      ),
                    ),
                  ),
                );
              },
            ),

            if (!isRegistered) _LoginTitles(title: S.confirmPassword),
            if (!isRegistered)
              ValueListenableBuilder(
                valueListenable: isConfPassVisible,
                builder: (BuildContext context, dynamic value, Widget? child) {
                  return AppInputText(
                    hint: '•••••••••',
                    visible: value,
                    type: AppInputType.password,
                    ctrl: confirmPasswordController,
                    prefixIcon: Padding(
                      padding: Space.all(0.6),
                      child: AppImage(imageUrl: Assets.passwordLock),
                    ),
                    suffixIcon: GestureDetector(
                      onTap:
                          () =>
                              isConfPassVisible.value =
                                  !isConfPassVisible.value,
                      child: Padding(
                        padding: Space.all(0.6),
                        child: AppImage(
                          imageUrl: value ? Assets.eyeOpen : Assets.eyeClosed,
                          color: AppColors.grayishBlue,
                          size: AppDimensions.font(6),
                        ),
                      ),
                    ),
                  );
                },
              ),

            Padding(
              padding: Space.z!.t(0.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    S.restorePassword,
                    style: AppText.b2!.cl(AppColors.primary).notoSans().w(6),
                  ),
                  Padding(
                    padding: Space.all(),
                    child: AppImage(
                      imageUrl: Assets.arrowRight,
                      size: AppDimensions.font(6),
                    ),
                  ),
                ],
              ),
            ),
            Space.yf(5),

            PrimaryButton.withChild(
              onPressed: () async {
                if (isRegistered) {
                  await onLogin();
                } else {
                  Tools.showSnack('Email not found, please register');
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    S.login,
                    style: AppText.b2!.cl(Colors.white).w(6).notoSans(),
                  ),
                  Space.x!,
                  Icon(
                    Icons.arrow_forward,
                    size: AppDimensions.font(10),
                    color: Colors.white,
                  ),
                ],
              ),
            ),

            PrimaryButton.withChild(
              onPressed: () async {
                if (!formkey.currentState!.validate()) return;

                final email = emailController.text.trim();
                final password = passwordController.text.trim();
                final confirmPassword = confirmPasswordController.text.trim();

                if (password != confirmPassword) {
                  Tools.showSnack('Passwords do not match');
                  return;
                }

                final existingUser = await DBHelper.getUserByEmail(email);
                if (existingUser != null) {
                  Tools.showSnack('User already exists. Please log in.');
                  return;
                }

                await DBHelper.registerUser(email, password);
                Tools.showSnack('Registered Successfully. You can now log in.');
                setState(() => isRegistered = true);
              },
              margin: Space.v1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    S.signUp,
                    style: AppText.b2!.cl(Colors.white).w(6).notoSans(),
                  ),
                  Space.x!,
                  Icon(
                    Icons.arrow_forward,
                    size: AppDimensions.font(10),
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> onLogin() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final confirmPassword = confirmPasswordController.text.trim();
    if (formkey.currentState!.validate()) {
      // Check if email exists
      final existingUser = await DBHelper.getUserByEmail(email);
      if (existingUser == null) {
        Tools.showSnack('Email not found, please register');
        setState(() {
          isRegistered = false;
        });
        return;
      }

      if (password != confirmPassword) {
        Tools.showSnack('Passwords do not match');

        return;
      }

      final user = await DBHelper.login(email, password);

      if (user != null) {
        final profile = await DBHelper.getProfile(email);

        if (profile != null) {
          Tools.showSnack('Succes to Home');
        } else {
          Tools.showSnack('Succes to Create Profile');
        }
      } else {
        Tools.showSnack('Invalid credentials');
      }
    }
  }
}

class _LoginTitles extends StatelessWidget {
  const _LoginTitles({required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: Space.all().t(0.75),
      child: Text(
        title,
        style: AppText.b3!.cl(AppColors.grey700).notoSans().w(5),
      ),
    );
  }
}
