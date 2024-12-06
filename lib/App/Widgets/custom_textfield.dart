import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Utils/Const/appColors.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.hintText = 'Enter your text',
    required this.controller,
    this.isObsecure = false,
    this.isValidateFun = false,
    this.errorText = "Please fill this field",
    this.isSuffixIcon = false,
    this.sendIcon = true,
  });

  final String hintText;
  final TextEditingController controller;
  final bool isObsecure;
  final bool isValidateFun;
  final String errorText;
  final bool isSuffixIcon;
  final bool sendIcon;

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
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: TextFormField(
        controller: widget.controller,
        cursorColor: AppColors.lightPrimary,
        obscureText: _isObsecure,
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
              borderSide: BorderSide.none,
            ),
            hintText: widget.hintText,
            hintStyle: GoogleFonts.montserrat(
              fontWeight: FontWeight.w500,
              fontSize: 18,
              color: AppColors.black.withOpacity(0.5),
            ),
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  _isObsecure = !_isObsecure;
                });
              },
              child: Icon(
                _isObsecure ? CupertinoIcons.eye_slash : CupertinoIcons.eye,
                color: AppColors.black.withOpacity(0.5),
              ),
            )),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return widget.errorText;
          } else {
            return null;
          }
        },
      ),
    );
  }
}
