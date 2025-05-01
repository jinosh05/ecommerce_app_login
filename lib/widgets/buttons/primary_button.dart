import 'package:ecommerce_app_login/configs/app_dimensions.dart';
import 'package:ecommerce_app_login/configs/app_typography.dart';
import 'package:ecommerce_app_login/configs/space.dart';
import 'package:ecommerce_app_login/constants/resources.dart';
import 'package:ecommerce_app_login/widgets/buttons/async_button.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    required this.onPressed,
    required this.text,
    super.key,
    this.textStyle,
    this.margin,
    this.padding,
    this.alignment,
    this.color,
    this.width,
    this.height,
    this.child,
    this.border,
  });
  const PrimaryButton.withChild({
    required this.onPressed,
    required this.child,
    this.text = '',
    super.key,
    this.margin,
    this.padding,
    this.alignment,
    this.color,
    this.width,
    this.height,
    this.textStyle,
    this.border,
  });
  final Function() onPressed;
  final String text;
  final Color? color;
  final BoxBorder? border;
  final TextStyle? textStyle;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final Alignment? alignment;
  final double? width;
  final Widget? child;
  final double? height;

  @override
  Widget build(final BuildContext context) => AsyncButton(
    onPressed: onPressed,
    child: Container(
      height: height,
      width: width,
      margin: margin,
      alignment: alignment,
      clipBehavior: Clip.antiAlias,

      decoration: BoxDecoration(
        borderRadius: AppDimensions.borRadius(4),
        border: border,
        color: color ?? AppColors.pastelGreen,
        boxShadow: [
          BoxShadow(
            color: color ?? const Color(0xFFA9FFD1), // #A9FFD1
            blurStyle: BlurStyle.inner,
            offset: const Offset(1, 1),
            blurRadius: 0.8,
          ),
          const BoxShadow(
            color: Color(0x40000000), // #00000040
            offset: Offset(-1, -1),
            blurRadius: 1.5,
            blurStyle: BlurStyle.inner,
          ),
        ],
      ),
      padding: padding ?? Space.all(2.5, 0.5),
      child:
          child ??
          Text(
            text,
            style: textStyle ?? AppText.b2!.w(6).cl(AppColors.grayishBlue),
          ),
    ),
  );
}
