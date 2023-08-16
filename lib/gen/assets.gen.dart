/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/checkup-list.svg
  SvgGenImage get checkupList =>
      const SvgGenImage('assets/icons/checkup-list.svg');

  /// File path: assets/icons/chevron-left.svg
  SvgGenImage get chevronLeft =>
      const SvgGenImage('assets/icons/chevron-left.svg');

  /// File path: assets/icons/chevron-right.svg
  SvgGenImage get chevronRight =>
      const SvgGenImage('assets/icons/chevron-right.svg');

  /// File path: assets/icons/failed.svg
  SvgGenImage get failed => const SvgGenImage('assets/icons/failed.svg');

  /// File path: assets/icons/file-diff.svg
  SvgGenImage get fileDiff => const SvgGenImage('assets/icons/file-diff.svg');

  /// File path: assets/icons/location-crosshairs-svgrepo-com.svg
  SvgGenImage get locationCrosshairsSvgrepoCom =>
      const SvgGenImage('assets/icons/location-crosshairs-svgrepo-com.svg');

  /// File path: assets/icons/location-pin-alt-1-svgrepo-com.svg
  SvgGenImage get locationPinAlt1SvgrepoCom =>
      const SvgGenImage('assets/icons/location-pin-alt-1-svgrepo-com.svg');

  /// File path: assets/icons/location.svg
  SvgGenImage get location => const SvgGenImage('assets/icons/location.svg');

  /// File path: assets/icons/search.svg
  SvgGenImage get search => const SvgGenImage('assets/icons/search.svg');

  /// File path: assets/icons/traffic-cone-off.svg
  SvgGenImage get trafficConeOff =>
      const SvgGenImage('assets/icons/traffic-cone-off.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        checkupList,
        chevronLeft,
        chevronRight,
        failed,
        fileDiff,
        locationCrosshairsSvgrepoCom,
        locationPinAlt1SvgrepoCom,
        location,
        search,
        trafficConeOff
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/banner.png
  AssetGenImage get banner => const AssetGenImage('assets/images/banner.png');

  /// File path: assets/images/img.png
  AssetGenImage get img => const AssetGenImage('assets/images/img.png');

  /// List of all assets
  List<AssetGenImage> get values => [banner, img];
}

class $AssetsL10nGen {
  const $AssetsL10nGen();

  /// File path: assets/l10n/en.json
  String get en => 'assets/l10n/en.json';

  /// File path: assets/l10n/id.json
  String get id => 'assets/l10n/id.json';

  /// List of all assets
  List<String> get values => [en, id];
}

class $AssetsLottieGen {
  const $AssetsLottieGen();

  /// File path: assets/lottie/liquid-loading.json
  LottieGenImage get liquidLoading =>
      const LottieGenImage('assets/lottie/liquid-loading.json');

  /// File path: assets/lottie/notFound.json
  LottieGenImage get notFound =>
      const LottieGenImage('assets/lottie/notFound.json');

  /// File path: assets/lottie/onboard1.json
  LottieGenImage get onboard1 =>
      const LottieGenImage('assets/lottie/onboard1.json');

  /// File path: assets/lottie/onboard2.json
  LottieGenImage get onboard2 =>
      const LottieGenImage('assets/lottie/onboard2.json');

  /// File path: assets/lottie/onboard3.json
  LottieGenImage get onboard3 =>
      const LottieGenImage('assets/lottie/onboard3.json');

  /// File path: assets/lottie/under-contruction.json
  LottieGenImage get underContruction =>
      const LottieGenImage('assets/lottie/under-contruction.json');

  /// List of all assets
  List<LottieGenImage> get values =>
      [liquidLoading, notFound, onboard1, onboard2, onboard3, underContruction];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsL10nGen l10n = $AssetsL10nGen();
  static const $AssetsLottieGen lottie = $AssetsLottieGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter,
      color: color,
      colorBlendMode: colorBlendMode,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class LottieGenImage {
  const LottieGenImage(this._assetName);

  final String _assetName;

  LottieBuilder lottie({
    Animation<double>? controller,
    bool? animate,
    FrameRate? frameRate,
    bool? repeat,
    bool? reverse,
    LottieDelegates? delegates,
    LottieOptions? options,
    void Function(LottieComposition)? onLoaded,
    LottieImageProviderFactory? imageProviderFactory,
    Key? key,
    AssetBundle? bundle,
    Widget Function(BuildContext, Widget, LottieComposition?)? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    double? width,
    double? height,
    BoxFit? fit,
    AlignmentGeometry? alignment,
    String? package,
    bool? addRepaintBoundary,
    FilterQuality? filterQuality,
    void Function(String)? onWarning,
  }) {
    return Lottie.asset(
      _assetName,
      controller: controller,
      animate: animate,
      frameRate: frameRate,
      repeat: repeat,
      reverse: reverse,
      delegates: delegates,
      options: options,
      onLoaded: onLoaded,
      imageProviderFactory: imageProviderFactory,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      package: package,
      addRepaintBoundary: addRepaintBoundary,
      filterQuality: filterQuality,
      onWarning: onWarning,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
