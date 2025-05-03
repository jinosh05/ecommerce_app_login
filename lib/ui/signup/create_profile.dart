import 'package:ecommerce_app_login/configs/app_dimensions.dart';
import 'package:ecommerce_app_login/configs/app_typography.dart';
import 'package:ecommerce_app_login/configs/space.dart';
import 'package:ecommerce_app_login/constants/resources.dart';
import 'package:ecommerce_app_login/widgets/app_column.dart';
import 'package:ecommerce_app_login/widgets/buttons/primary_button.dart';
import 'package:ecommerce_app_login/widgets/inputs/app_input_text.dart';
import 'package:flutter/material.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
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
              hint: S.dummyEmail,
              enabled: false,
              ctrl: emailController,
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
              onPressed: () {},
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
              onPressed: () {},
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
    );
  }
}
