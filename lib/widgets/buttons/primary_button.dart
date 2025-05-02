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
        border: border,
        color: color ?? AppColors.primary,
      ),
      padding: padding ?? Space.vf(0.75),
      child:
          child ??
          Text(
            text,
            style: textStyle ?? AppText.b2!.cl(Colors.white).w(6).notoSans(),
          ),
    ),
  );
}
