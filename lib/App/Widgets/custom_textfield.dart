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
  });

  final String hintText;
  final TextEditingController controller;
  final bool isObsecure;
  final bool isValidateFun;
  final String errorText;
  final bool isSuffixIcon;
  final IconData? icon;
  final bool obsecrureFun;

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
      controller: widget.controller,
      cursorColor: AppColors.lightPrimary,
      obscureText: widget.obsecrureFun?_isObsecure: !_isObsecure,
      style: GoogleFonts.montserrat(
        fontWeight: FontWeight.w500,
        fontSize: 18,
        color: AppColors.black,
      ),
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: AppColors.tertiary,
            width: 0.7,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide(
            color: AppColors.tertiary,
            width: 0.7,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide(
            color: AppColors.tertiary,
            width: 0.7,
          ),
        ),
        hintText: widget.hintText,
        hintStyle: GoogleFonts.montserrat(
          fontWeight: FontWeight.w400,
          fontSize: 18,
          color: AppColors.tertiary,
        ),
        suffixIcon: widget.obsecrureFun? GestureDetector(
          onTap: () {
            setState(() {
              _isObsecure = !_isObsecure;
            });
          },
          child: Icon(
            _isObsecure ? CupertinoIcons.eye_slash : CupertinoIcons.eye,
            color: AppColors.tertiary.withOpacity(0.6),
          ),
        ): Icon(
          widget.icon,
          color: AppColors.tertiary.withOpacity(0.6),
        ),
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
