import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../utils/constants.dart';

class AppInputField extends StatelessWidget {
  final Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final String? hintText;
  final bool obscureText;
  final TextInputType keyboardType;
  final TextAlign textAlign;
  final int? maxLength;
  final TextEditingController? controller;
  final bool readOnly;
  final bool filled;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatters;
  final void Function()? onTap;
  final TextCapitalization textCapitalization;
  final String helperText;
  final bool hasHeight;
  final Color? customBorderColor;
  final Color? helperStyleColor;
  final void Function(PointerDownEvent)? onTapOutside;
  final TextInputAction textInputAction;
  final double? helperHeight;
  final String? counterText;
  final Color? counterTextColor;
  final int? maxLine;
  final void Function(String)? onFieldSubmitted;
  final bool autofocus;
  final Iterable<String>? autofillHints;
  final Color? textColor;

  const AppInputField({
    Key? key,
    this.onChanged,
    this.validator,
    this.hintText,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.textAlign = TextAlign.left,
    this.maxLength,
    this.controller,
    this.readOnly = false,
    this.filled = false,
    this.suffixIcon,
    this.prefixIcon,
    this.focusNode,
    this.inputFormatters,
    this.onTap,
    this.textCapitalization = TextCapitalization.none,
    this.helperText = ' ',
    this.hasHeight = true,
    this.customBorderColor,
    this.helperStyleColor,
    this.onTapOutside,
    this.textInputAction = TextInputAction.done,
    this.helperHeight,
    this.counterText = '',
    this.maxLine = 1,
    this.counterTextColor,
    this.onFieldSubmitted,
    this.autofocus = false,
    this.autofillHints,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: onTapOutside,
      onTap: onTap,
      obscureText: obscureText,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      textAlign: textAlign,
      maxLines: maxLine,
      style: kSemiBoldFontStyle.copyWith(
        fontSize: 14.0,
        color: textColor?? kNoteBlack,
      ),
      onChanged: onChanged,
      validator: validator,
      maxLength: maxLength,
      readOnly: readOnly,
      controller: controller,
      textCapitalization: textCapitalization,
      focusNode: focusNode,
      inputFormatters: inputFormatters,
      cursorColor: textColor?? kNoteBlack,
      onFieldSubmitted: onFieldSubmitted,
      autofocus: autofocus,
      autofillHints: autofillHints,
      decoration: InputDecoration(
        fillColor: kGrey100,
        filled: filled,
        hintText: hintText,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        counterText: counterText,
        helperText: helperText,
        isDense: true,
        hintStyle: kRegularFontStyle.copyWith(
          fontSize: 14.0,
          color: kGrey500,
        ),
        helperStyle: kRegularFontStyle.copyWith(
          fontSize: 14.0,
          color: helperStyleColor?? kNoteBlack,
          height: helperHeight,
        ),
        counterStyle: kSemiBoldFontStyle.copyWith(
          fontSize: 10,
          color: counterTextColor?? kNoteBlack,
        ),
        errorStyle: kRegularFontStyle.copyWith(
          fontSize: 12,
          color: kError400,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(color: kError400, width: 1.0),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: customBorderColor ?? kGrey300, width: 1.0),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: customBorderColor??  kGrey300, width: 1.0),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: customBorderColor?? kNoteBlack, width: 1.0),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
      ),
    );
  }
}
