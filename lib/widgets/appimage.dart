import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app_login/constants/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

class AppImage extends StatelessWidget {
  const AppImage({
    required this.imageUrl,
    super.key,
    this.width,
    this.size,
    this.height,
    this.fit,
    this.color,
    this.package,
  });
  final String imageUrl;
  final double? width;
  final double? size;
  final double? height;
  final BoxFit? fit;
  final Color? color;
  final String? package;

  @override
  Widget build(final BuildContext context) {
    final isSvgImage = imageUrl.split('.').last == 'svg';
    final isLottieImage = imageUrl.split('.').last == 'json';

    if (imageUrl.isEmpty) {
      return const SizedBox();
    }

    if (!imageUrl.contains('http')) {
      if (isSvgImage) {
        return SvgPicture.asset(
          imageUrl,
          width: size ?? width,
          height: size ?? height,
          fit: fit ?? BoxFit.contain,
          package: package,
          colorFilter:
              color == null ? null : ColorFilter.mode(color!, BlendMode.srcIn),
        );
      }

      if (isLottieImage) {
        return Lottie.asset(
          imageUrl,
          width: size ?? width,
          height: size ?? height,
          fit: fit ?? BoxFit.contain,
          package: package,
        );
      }

      return Image.asset(
        imageUrl,
        width: size ?? width,
        height: size ?? height,
        fit: fit ?? BoxFit.contain,
        color: color,
        package: package,
      );
    }

    if (isSvgImage) {
      return SvgPicture.network(
        imageUrl,
        width: size ?? width,
        height: size ?? height,
        fit: fit ?? BoxFit.contain,
        colorFilter:
            color == null ? null : ColorFilter.mode(color!, BlendMode.color),
      );
    }

    if (isLottieImage) {
      return Lottie.network(
        imageUrl,
        width: size ?? width,
        height: size ?? height,
        fit: fit ?? BoxFit.contain,
      );
    }

    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: size ?? width,
      height: size ?? height,
      fit: fit ?? BoxFit.contain,
      color: color,

      errorWidget:
          (final context, final url, final error) =>
              const AppImage(imageUrl: Assets.placeholder),
    );
  }
}
