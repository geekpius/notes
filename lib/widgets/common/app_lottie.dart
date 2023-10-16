import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../utils/constants.dart';

class AppLottie extends StatelessWidget {
  const AppLottie({
    Key? key,
    required this.fileName,
    this.assetFile = true,
    this.repeat,
    this.height,
    this.width,
    this.fit,
  }) : super(key: key);

  final String fileName;
  final bool assetFile;
  final bool? repeat;
  final double? width;
  final double? height;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    if(assetFile) {
      return Lottie.asset(
        '$kAnimationPath/$fileName',
        fit: fit?? BoxFit.cover,
        repeat: repeat,
        width: width,
        height: height,
      );
    }

    return Lottie.network(
      fileName,
      fit: fit?? BoxFit.cover,
      repeat: repeat,
      width: width,
      height: height,
    );
  }
}
