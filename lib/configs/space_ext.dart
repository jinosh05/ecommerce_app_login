import 'package:ecommerce_app_login/configs/app_dimensions.dart';
import 'package:ecommerce_app_login/configs/ui.dart';
import 'package:flutter/material.dart';

extension SuperEdgeInsets on EdgeInsets {
  EdgeInsets sv() =>
      copyWith(top: top + UI.padding!.top, bottom: bottom + UI.padding!.bottom);

  EdgeInsets st() => copyWith(top: top + UI.padding!.top);

  EdgeInsets sb() => copyWith(bottom: bottom + UI.padding!.bottom);

  EdgeInsets b(final double no) => copyWith(bottom: AppDimensions.space(no));

  EdgeInsets t(final double no) => copyWith(top: AppDimensions.space(no));

  EdgeInsets l(final double no) => copyWith(left: AppDimensions.space(no));

  EdgeInsets r(final double no) => copyWith(right: AppDimensions.space(no));
}
