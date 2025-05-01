import 'package:ecommerce_app_login/configs/space.dart';
import 'package:flutter/material.dart';

/// A custom column widget that supports scroll, padding, alignment,
/// and gradient background options.
class AppColumn extends StatelessWidget {
  const AppColumn({
    required this.children,
    super.key,
    this.padding,
    this.spacing = 0,
    this.cstart = true,
    this.noScroll = false,
    this.controller,
  });

  final double spacing;

  /// List of widgets to display in the column.
  final List<Widget> children;

  /// Custom padding for the column.
  final EdgeInsets? padding;

  /// Whether the children are aligned to the start of the column.
  final bool cstart;

  /// Whether the column should not be scrollable.
  final bool noScroll;

  /// Scroll controller for the column.
  final ScrollController? controller;

  @override
  Widget build(final BuildContext context) {
    // Define the scroll physics based on the noScroll flag.
    final scrollPhysics =
        (noScroll
            ? const NeverScrollableScrollPhysics()
            : const BouncingScrollPhysics());

    // Define the padding based on the padding property.
    final columnPadding = padding ?? Space.hf(0.65);

    // Create the SingleChildScrollView widget.
    final singleChildScrollView = SingleChildScrollView(
      physics: scrollPhysics,
      controller: controller ?? ScrollController(),
      padding: columnPadding,
      child: Column(
        spacing: spacing,

        crossAxisAlignment:
            cstart ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: children,
      ),
    );

    // If noScroll is true, return a padded Column instead.
    if (noScroll) {
      return Padding(
        padding: columnPadding,
        child: Column(
          spacing: spacing,
          crossAxisAlignment:
              cstart ? CrossAxisAlignment.start : CrossAxisAlignment.center,
          children: children,
        ),
      );
    }

    // Default case: return the SingleChildScrollView.
    return singleChildScrollView;
  }
}
