import 'dart:async';
import 'dart:ui';
import 'package:blog/utils/constants.dart';
import 'package:flutter/material.dart';
import '../widgets/common/app_lottie.dart';
import 'helper_util.dart';

enum DialogAction { yes, abort }

class AppDialogUtil {

  static Future<void> loadingDialog(BuildContext context) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        barrierColor: kPrimaryBlack80,
        builder: (BuildContext context) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
            child: WillPopScope(
              onWillPop: () async => false,
              child: const SimpleDialog(
                elevation: 0.0,
                contentPadding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                titlePadding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                backgroundColor: Colors.transparent,
                children: <Widget>[
                  Center(
                    child: AppLottie(
                      fileName: 'loader.json',
                      repeat: true,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
    );
  }

  static Future showScrollableBottomSheet( {
    required BuildContext context,
    bool? isDismissible,
    bool useSafeArea = true,
    required Widget Function(BuildContext) builder
  })
  {
    return showModalBottomSheet(
      context: context,
      elevation: 0,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      enableDrag: false,
      useSafeArea: HelperUtil.isIOS? false : useSafeArea,
      isDismissible: isDismissible?? true,
      barrierColor: kPrimaryBlack70,
      builder: builder,
    );
  }



}
