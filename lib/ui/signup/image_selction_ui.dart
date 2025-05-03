import 'package:ecommerce_app_login/configs/app_dimensions.dart';
import 'package:ecommerce_app_login/configs/app_typography.dart';
import 'package:ecommerce_app_login/configs/space.dart';
import 'package:ecommerce_app_login/configs/space_ext.dart';
import 'package:ecommerce_app_login/constants/resources.dart';
import 'package:ecommerce_app_login/ui/signup/create_profile.dart';
import 'package:ecommerce_app_login/ui/signup/cubit/register_cubit.dart'
    show RegisterCubit;
import 'package:ecommerce_app_login/utils/routes.dart';
import 'package:ecommerce_app_login/utils/tools.dart';
import 'package:ecommerce_app_login/widgets/appimage.dart';
import 'package:ecommerce_app_login/widgets/buttons/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImageSelctionUI extends StatefulWidget {
  const ImageSelctionUI({super.key});

  @override
  State<ImageSelctionUI> createState() => _ImageSelctionUIState();
}

class _ImageSelctionUIState extends State<ImageSelctionUI> {
  Uint8List? image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Spacer(),
          Text(S.welcome, style: AppText.h2!.cl(AppColors.grey900).w(6)),
          Padding(
            padding: Space.all(2, 1).b(2),
            child: Text(
              S.uploadImgMsg,
              textAlign: TextAlign.center,
              style: AppText.b2!.cl(AppColors.grey500).notoSans().w(4),
            ),
          ),
          GestureDetector(
            onTap: () async {
              try {
                image = await Tools().pickImage();
                setState(() {});
              } on Exception catch (e) {
                debugPrint("Exceptio $e");
              }
            },
            child:
                image == null
                    ? AppImage(
                      imageUrl: Assets.editAvatar,
                      size: AppDimensions.width(35),
                    )
                    : Image.memory(
                      image!,
                      width: AppDimensions.width(50),
                      height: AppDimensions.width(50),
                    ),
          ),
          Spacer(),
          PrimaryButton.withChild(
            onPressed: () async {
              context.read<RegisterCubit>().setImage(image: image);
              await AppRoutes.push(context, CreateProfileUI());
            },
            margin: Space.all(),
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
    );
  }
}
