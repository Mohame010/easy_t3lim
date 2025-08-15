import 'package:desktop_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.hintText,
    this.suffixIcon,
    this.kebordType,
    this.controller,
    this.validator,
    this.textCapitalization,
    this.obscureText = false,
    this.textAlig = TextAlign.left,
    this.title,
    this.onChanged,
    this.autovalidateMode,
    this.color,
    this.inputFormatters,
    this.prefixIcon,
    this.readOnly,  this.errorText,
  });
  final String? hintText;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? kebordType;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final TextCapitalization? textCapitalization;
  final bool obscureText;
  final TextAlign textAlig;
  final Widget? title;
  final void Function(String)? onChanged;
  final AutovalidateMode? autovalidateMode;
  final List<TextInputFormatter>? inputFormatters;
  final Color? color;
  final bool? readOnly;
  final String? errorText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: TextFormField(
        autovalidateMode: autovalidateMode,
        onChanged: onChanged,
        textCapitalization: textCapitalization ?? TextCapitalization.none,
        validator:
            validator ??
            (value) {
              if (value!.isEmpty) {
                return 'This field is required';
              }
              return null;
            },

        readOnly: readOnly ?? false,
        inputFormatters: inputFormatters,
        textAlign: textAlig,
        keyboardType: kebordType,
        textInputAction: TextInputAction.next,
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          fillColor: AppColors.grey,
          filled: true,
          errorText: errorText,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(12),
          ),
          enabled: true,
          label: title,
          hintText: hintText,

          prefixIcon: Icon(prefixIcon),
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(borderRadius: BorderRadius.zero),
        ),
      ),
    );
  }
}
