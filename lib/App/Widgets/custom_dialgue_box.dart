import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../Services/image_picker_services.dart';
import '../Utils/Const/appColors.dart';
import '../Utils/Const/app_icons.dart';
import '../Utils/Const/app_sizes.dart';
import 'custom_circular_container.dart';
import 'custom_elevatedButton.dart';
import 'custom_text_button.dart';
import 'custom_text_widget.dart';
import 'custom_textfield.dart';

class CustomDialgueBox extends StatelessWidget {
  const CustomDialgueBox({
    super.key,
    required this.isLarge,
    required this.onPress,
    this.heading = "Password Updated",
    this.iconPath = AppIcons.tickSquare,
    this.content = "Congrats! Your password has\nbeen updated successfully.",
    this.isSecond = false,
    this.isThird = false,
    this.isFirst = false,
    this.firstController,
    this.secondsController,
  });

  final bool isLarge;
  final VoidCallback onPress;
  final String heading;
  final String iconPath;
  final String content;
  final bool isSecond;
  final bool isThird;
  final bool isFirst;
  final TextEditingController? firstController;
  final TextEditingController? secondsController;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.all(20),
      backgroundColor: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            width: isLarge
                ? AppSizes().getWidthPercentage(26)
                : AppSizes().getWidthPercentage(65),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: SvgPicture.asset(
                          AppIcons.closeSquare,
                          height: 20,
                          width: 20,
                        )),
                  ),
                  Gap(6),
                  CustomCircularContainer(
                    icon: iconPath,
                    bgColor: AppColors.primary.withOpacity(0.3),
                  ),
                  Gap(12),
                  CustomTextWidget(
                    text: heading,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    textColor: AppColors.black,
                  ),
                  Gap(12),
                  !isFirst
                      ? SizedBox.shrink()
                      : CustomTextWidget(
                    text: content,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    textColor: AppColors.tertiary,
                  ),
                  Gap(18),
                  isSecond
                      ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextWidget(
                        text: "Name *",
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        textColor: AppColors.brown,
                      ),
                      Gap(3),
                      CustomTextField(
                        hintFontSize: 12,
                        controller: firstController!,
                        borderRadius: 5,
                        hintText: "Name",
                      ),
                      Gap(12),
                      CustomTextWidget(
                        text: "Details *",
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        textColor: AppColors.brown,
                      ),
                      Gap(3),
                      CustomTextField(
                        hintFontSize: 12,
                        controller: secondsController!,
                        borderRadius: 5,
                        hintText: "Type here...",
                        maxLines: 3,
                      ),
                      Gap(12),
                      Obx(
                            () {
                          final imageService =
                          Get.put(ImagePickerService());
                          return GestureDetector(
                            onTap: () => imageService
                                .pickImageFromGallery(context),
                            child: Container(
                              clipBehavior: Clip.antiAlias,
                              height: 100,
                              width: AppSizes().getWidthPercentage(100),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(
                                  width: 0.5,
                                  color: AppColors.black,
                                ),
                              ),
                              child:
                              imageService.selectedImage.value == null
                                  ? const Center(
                                child: Icon(
                                  Icons.file_upload_outlined,
                                  color: AppColors.brown,
                                ),
                              )
                                  : Image.network(
                                imageService
                                    .selectedImage.value!.path,
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  )
                      : SizedBox.shrink(),
                  isThird
                      ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextWidget(
                        text: "Product Details*",
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        textColor: AppColors.brown,
                      ),
                      Gap(3),
                      CustomTextField(
                        hintFontSize: 12,
                        controller: firstController!,
                        borderRadius: 5,
                        maxLines: 3,
                        hintText: "Dummy details goes here...",
                      ),
                      Gap(12),
                      CustomTextWidget(
                        text: "Final Agreed Price*",
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        textColor: AppColors.brown,
                      ),
                      Gap(3),
                      CustomTextField(
                        hintFontSize: 12,
                        controller: secondsController!,
                        borderRadius: 5,
                        hintText: "Dummy price goes here",
                        maxLines: 3,
                      ),
                    ],
                  )
                      : SizedBox.shrink(),
                  Gap(18),
                  !isFirst
                      ? SizedBox.shrink()
                      : CustomElevatedButton(
                    textSize: 18,
                    height: 36,
                    text: "Proceed",
                    onPress: onPress,
                  ),
                  !isThird
                      ? SizedBox.shrink()
                      : CustomTextButton(
                    color: AppColors.lightPrimary,
                    textColor: AppColors.brown,
                    hasBorder: false,
                    text: "  Post Order  ",
                    onPress: onPress,
                  ),
                  isSecond
                      ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: CustomElevatedButton(
                          textSize: 16,
                          text: "Post Enquiry",
                          onPress: onPress,
                        ),
                      ),
                      Gap(2),
                      Expanded(
                        child: CustomElevatedButton(
                          textSize: 16,
                          textColor: AppColors.white,
                          bgColor: AppColors.red,
                          text: "Cancel",
                          onPress: () {
                            Get.back();
                          },
                        ),
                      ),
                    ],
                  )
                      : SizedBox.shrink(),
                  Gap(12),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
