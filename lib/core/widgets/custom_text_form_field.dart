import 'package:desktop_app/core/helper/spacing.dart';
import 'package:desktop_app/core/utils/app_colors.dart';
import 'package:desktop_app/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final EdgeInsetsGeometry? contentPadding;
  final Icon? icon;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final Color? backgroundColor;
  final TextEditingController? controller;
  final String? Function(String?) validator;
  final bool? isPhoneNumber;
  final Widget? prefixIcon;
  final int? maxLines;
  final Color? fillColor;
  final TextInputType? keyboardType;
  final Function(String)? onChang;
  final bool? isFilledColor;
  final Color? filledColor;
  final InputBorder? border;

  const CustomTextFormField({
    super.key,
    this.contentPadding,
    required this.icon,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    required this.hintText,
    this.isObscureText,
    this.suffixIcon,
    this.backgroundColor,
    this.controller,
    required this.validator,
    this.isPhoneNumber,
    this.prefixIcon,
    this.maxLines,
    this.fillColor,
    this.keyboardType,
    this.onChang,
    this.isFilledColor,
    this.filledColor,
    this.border,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isObscureText ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        children: [
          widget.icon!,
          horizontalSpace(20),
          Expanded(
            child: TextFormField(
              onChanged: (value) {
                widget.onChang?.call(value);
              },
              keyboardType: widget.keyboardType,
              controller: widget.controller,
              decoration: InputDecoration(
                border: UnderlineInputBorder(
                  borderSide: BorderSide(width: .3, color: AppColors.black),
                ),
                isDense: true,
                contentPadding:
                    widget.contentPadding ??
                    EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                hintStyle:
                    widget.hintStyle ??
                    AppTextStyle.fontWeightw500Size16Colorblack,
                hintText: widget.hintText,
                suffixIcon: widget.isObscureText == true
                    ? GestureDetector(
                        onTap: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        child: Icon(
                          _obscureText
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                        ),
                      )
                    : widget.suffixIcon,
                fillColor: widget.fillColor,
                filled: widget.isFilledColor,
                prefixIcon: widget.prefixIcon,
                errorStyle: const TextStyle(height: 0),
              ),
              obscureText: _obscureText,
              validator: (value) {
                final result = widget.validator(value);
                return result;
              },
              maxLines: widget.maxLines ?? 1,
            ),
          ),
        ],
      ),
    );
  }
}
