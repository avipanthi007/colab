import 'package:colab/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
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

  const CustomTextField({
    super.key,
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
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: widget.margin,
      width: widget.width,
      child: TextFormField(
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16),
        obscureText: _obscureText,
        initialValue: widget.initial,
        keyboardType: widget.keyboardType,
        onChanged: widget.onChanged,
        readOnly: widget.readOnly ?? false,
        controller: widget.controller,
        maxLength: widget.maxLength,
        validator: (val) {
          if (widget.shouldValidate != false &&
              (widget.controller?.text.isEmpty ?? true)) {
            return "Please Input A Valid ${widget.label}";
          }
          return null;
        },
        inputFormatters: widget.digitsOnly ?? false
            ? [FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*'))]
            : null,
        maxLines: widget.maxLines ?? 1,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.fieldColor,
          prefixIcon: widget.prefix,
          focusedBorder: OutlineInputBorder(
            borderRadius: widget.borderRadius!,
            borderSide:
                const BorderSide(color: AppColors.primaryYellow, width: 2),
          ),
          hintText: widget.hintText,
          counterText: "",
          suffixIcon: widget.obscureText == true
              ? IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                )
              : widget.suffix,
          labelText: widget.label,
          contentPadding: const EdgeInsets.all(12),
          isDense: true,
          errorMaxLines: 1,
          labelStyle: const TextStyle(color: Colors.grey, fontSize: 12),
          errorStyle: const TextStyle(color: Colors.red, height: 1),
          disabledBorder: OutlineInputBorder(
            borderRadius: widget.borderRadius!,
            borderSide:
                const BorderSide(color: AppColors.primaryBlue, width: 2),
          ),
          errorBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          border: OutlineInputBorder(
            borderRadius: widget.borderRadius!,
            borderSide:
                const BorderSide(color: AppColors.primaryBlue, width: 2),
          ),
        ),
      ),
    );
  }
}
