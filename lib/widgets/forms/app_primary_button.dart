import 'package:blog/utils/constants.dart';
import 'package:flutter/material.dart';


class AppPrimaryButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final Color? color;
  final TextStyle? textStyle;
  final double minWidth;
  final double height;
  final bool scaledText;
  final Color? borderColor;
  final double? fontSize;
  final Color? textColor;
  final double? radius;

  const AppPrimaryButton({
    Key? key,
    required this.onPressed,
    this.text = '',
    this.color,
    this.textStyle,
    this.minWidth = 294.0,
    this.height = 56.0,
    this.scaledText = true,
    this.borderColor,
    this.fontSize,
    this.textColor,
    this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: MaterialButton(
          elevation: 0,
          highlightElevation: 0,
          color: color?? kNoteBlack,
          disabledColor: kGrey300,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius?? 12.0),
            side: BorderSide(color: onPressed != null ? (borderColor?? kNoteBlack) : Colors.transparent),
          ),
          onPressed: onPressed,
          minWidth: minWidth,
          height: height,
          child: scaledText ?
          Text(
            text,
            style: textStyle?? kSemiBoldFontStyle.copyWith(
              fontSize: fontSize?? 16,
              color: onPressed != null ? (textColor?? kPrimaryWhite) : kPrimaryWhite,
            ),
          )
              :
          RichText(
            text: TextSpan(
              text: text,
              style: textStyle?? kSemiBoldFontStyle.copyWith(
                fontSize: fontSize?? 16,
                color: onPressed != null ? (textColor?? kPrimaryWhite) : kPrimaryWhite,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
