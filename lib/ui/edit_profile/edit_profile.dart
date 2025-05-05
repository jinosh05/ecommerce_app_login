import 'dart:async';
import 'dart:typed_data';

import 'package:ecommerce_app_login/configs/app_dimensions.dart';
import 'package:ecommerce_app_login/configs/app_typography.dart';
import 'package:ecommerce_app_login/configs/space.dart';
import 'package:ecommerce_app_login/constants/resources.dart';
import 'package:ecommerce_app_login/domain/bloc/profile/profile_bloc.dart';
import 'package:ecommerce_app_login/domain/cubit/db/database_helper.dart';
import 'package:ecommerce_app_login/services/auth_services.dart';
import 'package:ecommerce_app_login/ui/edit_profile/cubit/update_cubit.dart';
import 'package:ecommerce_app_login/utils/tools.dart';
import 'package:ecommerce_app_login/widgets/app_column.dart';
import 'package:ecommerce_app_login/widgets/appimage.dart';
import 'package:ecommerce_app_login/widgets/buttons/primary_button.dart';
import 'package:ecommerce_app_login/widgets/inputs/app_input_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfileUI extends StatefulWidget {
  const EditProfileUI({super.key});

  @override
  State<EditProfileUI> createState() => _EditProfileUIState();
}

class _EditProfileUIState extends State<EditProfileUI> {
  final formkey = GlobalKey<FormState>();
  Uint8List? image;
  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  bool isEditable = false;

  @override
  void initState() {
    super.initState();
    unawaited(setValues());
  }

  Future<void> setValues() async {
    var email = await AuthService().getEmail();
    var profile = await DBHelper.getProfile(email);

    if (profile != null) {
      firstNameController.text = profile.firstName;
      lastNameController.text = profile.lastName;
      phoneController.text = profile.phone;
      addressController.text = profile.address;
      image = profile.image;
      context.read<UpdateCubit>().setImage(image: profile.image);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateCubit, UpdateState>(
      bloc: context.read<UpdateCubit>(),
      listener: (context, state) {
        if (state is UpdateLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => const Center(child: CircularProgressIndicator()),
          );
        } else {
          Navigator.of(context, rootNavigator: true).pop(); // Remove dialog
        }

        if (state is UpdateSuccess) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Registration Successful')));
          context.read<ProfileBloc>().add(FetchProfile());
        } else if (state is UpdateFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.error)));
        }
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            isEditable ? S.editProfile : S.profile,
            style: AppText.b1!.inter().cl(AppColors.grey900).w(6),
          ),
        ),
        body: Form(
          key: formkey,
          child: AppColumn(
            children: [
              Center(
                child: GestureDetector(
                  onTap: () async {
                    if (isEditable) {
                      try {
                        image = await Tools().pickImage();

                        context.read<UpdateCubit>().setImage(image: image);
                        setState(() {});
                      } on Exception catch (e) {
                        debugPrint("Exceptio $e");
                      }
                    }
                  },
                  child: ClipOval(
                    clipBehavior: Clip.antiAlias,
                    child:
                        image == null
                            ? AppImage(
                              imageUrl: Assets.editAvatar,
                              size: AppDimensions.width(25),
                            )
                            : Image.memory(
                              image!,
                              width: AppDimensions.width(25),
                              height: AppDimensions.width(25),
                            ),
                  ),
                ),
              ),
              AppInputText(
                hint: S.firstName,
                enabled: isEditable,
                title: S.firstName,
                ctrl: firstNameController,
              ),
              AppInputText(
                enabled: isEditable,
                hint: S.lastName,
                title: S.lastName,
                ctrl: lastNameController,
              ),
              BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, state) {
                  if (state is ProfileLoaded) {
                    return AppInputText(
                      title: S.email,
                      hint: state.profile.email,
                      enabled: false,
                      ctrl: emailController..text = state.profile.email,
                      type: AppInputType.email,
                    );
                  }
                  return SizedBox();
                },
              ),

              AppInputText(
                hint: S.phoneNumber,
                title: S.phoneNumber,
                enabled: isEditable,
                ctrl: phoneController,
                type: AppInputType.integer,
              ),
              AppInputText(
                hint: S.mailingAddress,
                title: S.mailingAddress,
                enabled: isEditable,
                ctrl: addressController,
              ),
              Space.y2!,
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: AppDimensions.font(25),
          margin: Space.all(),
          child: PrimaryButton.withChild(
            onPressed: () async {
              if (isEditable) {
                if (formkey.currentState!.validate()) {
                  await context.read<UpdateCubit>().updateProfile(
                    firstName: firstNameController.text.trim(),
                    lastName: lastNameController.text.trim(),
                    phone: phoneController.text.trim(),
                    address: addressController.text.trim(),
                  );
                }
                isEditable = !isEditable;
              } else {
                isEditable = !isEditable;
              }
              setState(() {});
            },
            alignment: Alignment.center,
            child: Text(
              isEditable ? S.save : S.edit,
              style: AppText.b2!.cl(Colors.white).w(6).notoSans(),
            ),
          ),
        ),
      ),
    );
  }
}
