import 'package:ecommerce_app_login/configs/app_dimensions.dart';
import 'package:ecommerce_app_login/constants/resources.dart';
import 'package:ecommerce_app_login/utils/routes.dart';
import 'package:flutter/material.dart';

class LeadingWidget extends StatelessWidget {
  const LeadingWidget({super.key, this.color});

  final Color? color;

  @override
  Widget build(final BuildContext context) {
    if (Navigator.canPop(context)) {
      return GestureDetector(
        onTap: () => AppRoutes.pop(context),
        child: Icon(
          Icons.arrow_back,
          color: color ?? AppColors.darkSlateGray,
          size: AppDimensions.font(12),
        ),
      );
    } else {
      return const SizedBox();
    }
  }
}
