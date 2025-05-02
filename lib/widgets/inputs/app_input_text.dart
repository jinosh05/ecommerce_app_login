import 'package:ecommerce_app_login/configs/app_typography.dart';
import 'package:ecommerce_app_login/configs/space.dart';
import 'package:ecommerce_app_login/constants/resources.dart';
import 'package:ecommerce_app_login/utils/regex_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppInputText extends StatelessWidget with AppInputMixin {
  const AppInputText({
    required this.hint,
    super.key,
    this.suffixIcon,
    this.ctrl,
    this.label,
    this.type = AppInputType.alphanumeric,
    this.visible = true,
    this.enabled = true,
    this.isOptional = false,
    this.helper,
    this.validator,

    this.style,
    this.color,
    this.prefixIcon,
    this.contentPadding,
    this.maxLength,
    this.capitaliseText = false,
    this.onChanged,
  });
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextEditingController? ctrl;
  final String hint;
  final String? label;
  final String? helper;
  final AppInputType type;
  final bool enabled;
  final bool visible;
  final String? Function(String? text)? validator;

  final Color? color;
  final TextStyle? style;
  final EdgeInsets? contentPadding;
  final int? maxLength;
  final bool isOptional;
  final ValueChanged<String>? onChanged;

  /// [capitaliseText] allows us to convert all the texts into UpperCase
  final bool capitaliseText;

  @override
  Widget build(final BuildContext context) {
    return TextFormField(
      controller: ctrl,
      keyboardType: getKeyboard(type),
      inputFormatters:
          type != AppInputType.integer
              ? null
              : [
                // for version 2 and greater youcan also use this
                FilteringTextInputFormatter.digitsOnly,
              ],
      validator: (final value) {
        if (validator != null) {
          return validator!(value);
        }
        return validateMethod(value, type, isOptional: isOptional);
      },
      onChanged: (final value) {
        if (capitaliseText && ctrl != null) {
          turnUpperCase(ctrl!);
        }
        onChanged?.call(value);
      },
      readOnly: !enabled,
      textCapitalization:
          capitaliseText
              ? TextCapitalization.characters
              : TextCapitalization.none,
      obscureText: !visible,
      style: style ?? AppText.b2!.notoSans().cl(AppColors.grey900),
      maxLength: maxLength,
      decoration: InputDecoration(
        fillColor: color ?? AppColors.primary.adjustOpacity(0.08),
        filled: true,
        counterStyle: AppText.l1!.w(5),
        isDense: true,
        alignLabelWithHint: true,
        hintText: hint,
        hintStyle: style ?? AppText.b2!.notoSans().cl(AppColors.grey900),
        contentPadding: contentPadding ?? Space.all(1, 0.75),
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        suffixIcon: suffixIcon,
        helperText: helper,
        prefixIcon: prefixIcon,
        helperStyle: style ?? AppText.b2!.notoSans().cl(AppColors.grey900),
        errorStyle: AppText.l1!.pop().w(7),
      ),
    );
  }
}

enum AppInputType {
  username,
  email,
  password,
  integer,
  alphanumeric,
  website,
  upi,
}

mixin AppInputMixin {
  String? validateMethod(
    final String? value,
    final AppInputType type, {
    final bool? isOptional,
  }) {
    if (value != null) {
      if (value.length > 240) {
        return S.lengthyTextError;
      }
    }

    if (isOptional == null || !isOptional) {
      if (value == null) {
        return S.cantEmpty;
      } else if (value.isEmpty) {
        return S.cantEmpty;
      }
      if (value.trim().isEmpty) {
        return S.cantEmpty;
      }
    }
    if (value != null && value.isNotEmpty) {
      if (type == AppInputType.email &&
          !RegVal.hasMatch(value, RegexPattern.email)) {
        return S.invalidEMail;
      } else if (type == AppInputType.password &&
          !RegVal.hasMatch(value, RegexPattern.passwordEasy)) {
        return S.invalidPassword;
      } else if (type == AppInputType.integer &&
          !RegVal.hasMatch(value, RegexPattern.numericOnly)) {
        return S.invalidNumber;
      } else if (type == AppInputType.website &&
          !RegVal.hasMatch(value, RegexPattern.url)) {
        if (!RegVal.hasMatch('https://$value', RegexPattern.url)) {
          return S.invalidURL;
        }
      } else if (type == AppInputType.upi &&
          !RegVal.hasMatch(value, RegexPattern.upiId)) {
        return S.invalidUPI;
      }
    }

    return null;
  }

  TextInputType getKeyboard(final AppInputType type) {
    if (type == AppInputType.email) {
      return TextInputType.emailAddress;
    }
    if (type == AppInputType.password) {
      return TextInputType.visiblePassword;
    }
    if (type == AppInputType.integer) {
      return TextInputType.number;
    }
    if (type == AppInputType.website) {
      return TextInputType.url;
    }
    if (type == AppInputType.upi) {
      return TextInputType.emailAddress;
    }

    return TextInputType.text;
  }

  void turnUpperCase(final TextEditingController ctrl) {
    final text = ctrl.text.toUpperCase();
    if (text != ctrl.text) {
      ctrl.value = TextEditingValue(
        text: text,
        selection: TextSelection.collapsed(offset: text.length),
      );
    }
  }
}
