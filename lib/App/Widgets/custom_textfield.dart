import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Utils/Const/appColors.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.hintText = 'Enter your text',
    required this.controller,
    this.isObsecure = true,
    this.isValidateFun = false,
    this.errorText = "Please fill this field",
    this.isSuffixIcon = false,
    this.icon,
    this.obsecrureFun = false,
    this.borderRadius = 40,
    this.hasPrefixIcon = false,
    this.maxLines = 1,
    this.hintFontSize = 18,
    this.borderColor =AppColors.tertiary,
    this.contentSize = 18,
  });

  final String hintText;
  final TextEditingController controller;
  final bool isObsecure;
  final bool isValidateFun;
  final String errorText;
  final bool isSuffixIcon;
  final IconData? icon;
  final bool obsecrureFun;
  final double borderRadius;
  final bool hasPrefixIcon;
  final int maxLines;
  final double hintFontSize;
  final double contentSize;
  final Color borderColor;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _isObsecure;

  @override
  void initState() {
    super.initState();
    _isObsecure = widget.isObsecure;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      minLines: null,
      maxLines: widget.maxLines,
      controller: widget.controller,
      cursorColor: AppColors.lightPrimary,
      obscureText: widget.obsecrureFun ? _isObsecure : !_isObsecure,
      style: GoogleFonts.montserrat(
        fontWeight: FontWeight.w500,
        fontSize: widget.contentSize,
        color: AppColors.black,
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: BorderSide(
            color: widget.borderColor,
            width: 0.7,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: BorderSide(
            color: widget.borderColor,
            width: 0.7,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: BorderSide(
            color: widget.borderColor,
            width: 0.7,
          ),
        ),
        hintText: widget.hintText,
        hintStyle: GoogleFonts.montserrat(
          fontWeight: FontWeight.w400,
          fontSize: widget.hintFontSize,
          color: AppColors.tertiary,
        ),
        prefixIcon: widget.hasPrefixIcon
            ? Icon(
                Icons.search_sharp,
                color: AppColors.brown.withOpacity(0.6),
                size: 25,
              )
            : null,
        suffixIcon: widget.obsecrureFun
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    _isObsecure = !_isObsecure;
                  });
                },
                child: Icon(
                  _isObsecure ? CupertinoIcons.eye_slash : CupertinoIcons.eye,
                  color: AppColors.tertiary.withOpacity(0.6),
                ),
              ):
            widget.isSuffixIcon? Icon(
                widget.icon,
                color: AppColors.tertiary.withOpacity(0.6),
              ):null,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return widget.errorText;
        } else {
          return null;
        }
      },
    );
  }
}
