import 'package:colab/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final double? width;
  final bool? readOnly;
  final Widget? suffix;
  final Widget? prefix;
  final bool? digitsOnly;
  final bool? shouldValidate;
  final int? maxLines;
  final int? maxLength;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final String? initial;
  final String? hintText;
  final bool? obscureText;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? margin;

  final _isObscured = RxBool(true);

  CustomTextField({
    Key? key,
    required this.label,
    this.width,
    this.controller,
    this.readOnly,
    this.suffix,
    this.prefix,
    this.onChanged,
    this.digitsOnly,
    this.keyboardType,
    this.maxLines,
    this.shouldValidate,
    this.maxLength,
    this.initial,
    this.obscureText,
    this.margin = const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
    this.borderRadius = const BorderRadius.all(Radius.circular(12)),
    this.hintText,
  }) : super(key: key) {
    _isObscured.value = obscureText ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: margin,
      width: width,
      child: Obx(() => TextFormField(
            style:
                Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16),
            obscureText: _isObscured.value,
            initialValue: initial,
            keyboardType: keyboardType,
            onChanged: onChanged,
            readOnly: readOnly ?? false,
            controller: controller,
            maxLength: maxLength,
            validator: (val) {
              if (shouldValidate != false &&
                  (controller?.text.isEmpty ?? true)) {
                return "Please Input A Valid $label";
              }
              return null;
            },
            inputFormatters: digitsOnly ?? false
                ? [FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*'))]
                : null,
            maxLines: maxLines ?? 1,
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.fieldColor,
              prefixIcon: prefix,
              focusedBorder: OutlineInputBorder(
                borderRadius: borderRadius!,
                borderSide:
                    const BorderSide(color: AppColors.primaryYellow, width: 2),
              ),
              hintText: hintText,
              counterText: "",
              suffixIcon: obscureText == true
                  ? IconButton(
                      icon: Icon(
                        _isObscured.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        _isObscured.value = !_isObscured.value;
                      },
                    )
                  : suffix,
              labelText: label,
              contentPadding: const EdgeInsets.all(12),
              isDense: true,
              errorMaxLines: 1,
              labelStyle: const TextStyle(color: Colors.grey, fontSize: 12),
              errorStyle: const TextStyle(color: Colors.red, height: 1),
              disabledBorder: OutlineInputBorder(
                borderRadius: borderRadius!,
                borderSide:
                    const BorderSide(color: AppColors.primaryBlue, width: 2),
              ),
              errorBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              border: OutlineInputBorder(
                borderRadius: borderRadius!,
                borderSide:
                    const BorderSide(color: AppColors.primaryBlue, width: 2),
              ),
            ),
          )),
    );
  }
}
