import 'package:cached_network_image/cached_network_image.dart';
import 'package:report_incident/src/config/constant.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../config/theme/colors.dart';

class UICacheNetworkImage extends StatelessWidget {
  const UICacheNetworkImage({
    Key? key,
    required this.imageUrl,
    this.size,
    this.fit,
    this.shimmerRadius,
    this.shimmerBaseColor,
    this.shimmerShape,
  }) : super(key: key);

  final String imageUrl;
  final Size? size;
  final BoxFit? fit;
  final double? shimmerRadius;
  final Color? shimmerBaseColor;
  final BoxShape? shimmerShape;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      errorWidget: (BuildContext context, String url, dynamic error) =>
          _whenErrorLoadImage(),
      placeholder: (context, url) => Shimmer.fromColors(
        baseColor: shimmerBaseColor ?? UIColors.shimmerBaseColor,
        highlightColor: UIColors.shimmerHighlightColor,
        child: Container(
          height: size?.height,
          width: size?.width,
          decoration: BoxDecoration(
            shape: shimmerShape ?? BoxShape.rectangle,
            color: UIColors.grey_20,
            borderRadius: shimmerShape == null
                ? BorderRadius.only(
                    topLeft: Radius.circular(
                        shimmerRadius ?? AppConstants.kFontSizeM),
                    topRight: Radius.circular(
                        shimmerRadius ?? AppConstants.kFontSizeM))
                : null,
          ),
        ),
      ),
      width: size?.width,
      height: size?.height,
      fit: fit ?? BoxFit.cover,
    );
  }

  Container _whenErrorLoadImage() {
    return Container(
      height: size?.height,
      width: size?.width,
      decoration: BoxDecoration(
        color: UIColors.grey_20,
        borderRadius: BorderRadius.circular(
          shimmerRadius ?? AppConstants.kFontSizeM,
        ),
      ),
      child: errorIcon(size),
    );
  }

  static Widget errorIcon(Size? size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.image_rounded,
          color: UIColors.grey_40,
        ),
        // if size > 700
        if (size != null && size.width > 50)
          const SizedBox(height: AppConstants.kPaddingXS),
        if (size != null && size.width > 50)
          const Text(
            "Not Found",
            style: TextStyle(
              color: UIColors.grey_40,
              fontSize: AppConstants.kFontSizeS,
            ),
          ),
      ],
    );
  }
}
