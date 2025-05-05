import 'dart:async';

import 'package:ecommerce_app_login/configs/app_dimensions.dart';
import 'package:ecommerce_app_login/configs/app_typography.dart';
import 'package:ecommerce_app_login/configs/space.dart';
import 'package:ecommerce_app_login/constants/resources.dart';
import 'package:ecommerce_app_login/domain/bloc/profile/profile_bloc.dart'
    show FetchProfile, ProfileBloc;
import 'package:ecommerce_app_login/services/auth_services.dart';
import 'package:ecommerce_app_login/ui/home_screen/home_screen.dart';
import 'package:ecommerce_app_login/ui/signup/cubit/register_cubit.dart';
import 'package:ecommerce_app_login/utils/routes.dart';
import 'package:ecommerce_app_login/widgets/app_column.dart';
import 'package:ecommerce_app_login/widgets/buttons/primary_button.dart';
import 'package:ecommerce_app_login/widgets/inputs/app_input_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateProfileUI extends StatefulWidget {
  const CreateProfileUI({super.key});

  @override
  State<CreateProfileUI> createState() => _CreateProfileUIState();
}

class _CreateProfileUIState extends State<CreateProfileUI> {
  final formkey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  Widget build(final BuildContext context) =>
      BlocListener<RegisterCubit, RegisterState>(
        bloc: context.read<RegisterCubit>(),
        listener: (final context, final state) {
          if (state is RegisterLoading) {
            unawaited(
              showDialog(
                context: context,
                barrierDismissible: false,
                builder:
                    (_) => const Center(child: CircularProgressIndicator()),
              ),
            );
          } else {
            Navigator.of(context, rootNavigator: true).pop(); // Remove dialog
          }

          if (state is RegisterSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Registration Successful')),
            );
            unawaited(AuthService().setLoggedIn());
            context.read<ProfileBloc>().add(FetchProfile());

            unawaited(AppRoutes.makeFirst(context, const HomeScreen()));
          } else if (state is RegisterFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        child: Scaffold(
          appBar: AppBar(
            centerTitle: false,
            title: Text(
              S.personalInfo,
              style: AppText.b1!.inter().cl(AppColors.grey900).w(6),
            ),
          ),
          body: Form(
            key: formkey,
            child: AppColumn(
              children: [
                Text(
                  S.personalInfoMsg,
                  style: AppText.b2!.cl(AppColors.grey500).notoSans(),
                ),
                AppInputText(
                  hint: S.firstName,
                  title: S.firstName,
                  ctrl: firstNameController,
                ),
                AppInputText(
                  hint: S.lastName,
                  title: S.lastName,
                  ctrl: lastNameController,
                ),
                AppInputText(
                  title: S.email,
                  hint: context.read<RegisterCubit>().email ?? '',
                  enabled: false,
                  ctrl:
                      emailController
                        ..text = context.read<RegisterCubit>().email ?? '',
                  type: AppInputType.email,
                ),
                AppInputText(
                  hint: S.phoneNumber,
                  title: S.phoneNumber,
                  ctrl: phoneController,
                  type: AppInputType.integer,
                ),
                AppInputText(
                  hint: S.mailingAddress,
                  title: S.mailingAddress,
                  ctrl: addressController,
                ),
                Space.y2!,
              ],
            ),
          ),
          bottomNavigationBar: Padding(
            padding: Space.all(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PrimaryButton.withChild(
                  onPressed: () => Navigator.pop(context),
                  width: AppDimensions.width(47),
                  color: AppColors.primary.adjustOpacity(0.08),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.arrow_back,
                        size: AppDimensions.font(10),
                        color: Colors.black,
                      ),
                      Space.x!,
                      Text(
                        S.back,
                        style: AppText.b2!.cl(Colors.black).w(6).notoSans(),
                      ),
                    ],
                  ),
                ),
                PrimaryButton.withChild(
                  width: AppDimensions.width(47),
                  onPressed: () async {
                    if (formkey.currentState!.validate()) {
                      await context.read<RegisterCubit>().registerProfile(
                        firstName: firstNameController.text.trim(),
                        lastName: lastNameController.text.trim(),
                        phone: phoneController.text.trim(),
                        address: addressController.text.trim(),
                      );
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        S.next,
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
        ),
      );
}
