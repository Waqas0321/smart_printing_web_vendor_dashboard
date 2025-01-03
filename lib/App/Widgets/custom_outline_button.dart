import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:smart_printing_web/App/Utils/Const/appColors.dart';
import 'package:smart_printing_web/App/Utils/Const/app_icons.dart';
import 'package:smart_printing_web/App/Utils/Const/app_sizes.dart';
import 'package:smart_printing_web/App/Widgets/custom_text_widget.dart';

class CustomOutlinedButton extends StatefulWidget {
  final VoidCallback onPressed;
  final bool isLarge;
  final bool isCircular;
  final Color iconColor;
  final bool hasJustIcon;
  final String icon;
  final bool haveHoverEffect;

  const CustomOutlinedButton({
    Key? key,
    required this.onPressed,
    required this.isLarge,
    this.isCircular = false,
    this.iconColor = AppColors.brown,
    this.hasJustIcon = false,
    this.icon = AppIcons.swapIcon,
    this.haveHoverEffect = false,
  }) : super(key: key);

  @override
  State<CustomOutlinedButton> createState() => _CustomOutlinedButtonState();
}

class _CustomOutlinedButtonState extends State<CustomOutlinedButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => widget.haveHoverEffect? _isHovered = true: _isHovered = false),
      onExit: (_) => setState(() => _isHovered = false),
      child: Container(
        decoration: BoxDecoration(
          color: _isHovered ? AppColors.lightPrimary : Colors.transparent,
          border: Border.all(color: widget.iconColor, width: 1.5),
          borderRadius: widget.isCircular ? null : BorderRadius.circular(8),
          shape: widget.isCircular ? BoxShape.circle : BoxShape.rectangle,
        ),
        child: InkWell(
          onTap: widget.onPressed,
          child: widget.hasJustIcon
              ? Padding(
                  padding: EdgeInsets.all(8),
                  child: SvgPicture.asset(
                    widget.icon,
                    color: widget.iconColor,
                    height: widget.isLarge ? 16 : 20,
                    width: widget.isLarge ? 16 : 20,
                  ),
                )
              : SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      SvgPicture.asset(
                      widget.icon,
                      color: widget.iconColor,
                      height: widget.isLarge ? 16 : 20,
                      width: widget.isLarge ? 16 : 20,
                    ),
                        widget.isLarge ? Gap(8) : SizedBox.shrink(),
                        widget.isLarge
                            ? CustomTextWidget(
                                textOverflow: TextOverflow.ellipsis,
                                text: 'Log Out',
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                textColor: AppColors.brown,
                              )
                            : SizedBox.shrink(),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
