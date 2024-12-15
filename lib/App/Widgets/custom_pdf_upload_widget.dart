import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'dart:html' as html;
import '../Utils/Const/appColors.dart';
import '../Utils/Const/app_icons.dart';
import '../Utils/Const/app_images.dart';
import '../Utils/Const/app_sizes.dart';
import 'custom_text_widget.dart';

class CustomPDFUploadWidget extends StatelessWidget {
  const CustomPDFUploadWidget({
    super.key, required this.onPress, required this.onPressRemove, required this.selectedFiles,
  });
  final VoidCallback onPress;
  final Function(int) onPressRemove;
  final List selectedFiles;



  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppSizes().getCustomPadding(),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
                color: AppColors.brown.withOpacity(0.06),
                blurRadius: 5,
                spreadRadius: 3)
          ]),
      child: Column(
        children: [
          DottedBorder(
            color: AppColors.brown,
            strokeWidth: 1,
            dashPattern: [10, 4],
            borderType: BorderType.RRect,
            radius: const Radius.circular(8),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  AppImages.uploadPlaceholder,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: AppSizes().getCustomPadding(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                          onTap: onPress,
                          child:
                          SvgPicture.asset(AppIcons.upload)),
                      Gap(12),
                      Obx(() {
                        return SizedBox(
                          height: 50,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: selectedFiles.length,
                            itemBuilder: (context, index) {
                              final file = selectedFiles[index];
                              String fileName;
                              if (html.window.navigator.userAgent
                                  .contains('WebKit')) {
                                fileName = file.name;
                              } else {
                                fileName =
                                    file.path?.split('/').last ??
                                        'Unknown file';
                              }

                              return Stack(
                                children: [
                                  Container(
                                    margin: const EdgeInsets
                                        .symmetric(
                                        horizontal: 8.0),
                                    padding:
                                    const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        color: AppColors.white,
                                        borderRadius:
                                        BorderRadius.circular(
                                            8),
                                        boxShadow: [
                                          BoxShadow(
                                              color: AppColors
                                                  .brown
                                                  .withOpacity(
                                                  0.1),
                                              blurRadius: 5,
                                              spreadRadius: 3)
                                        ]),
                                    child: Row(
                                      mainAxisSize:
                                      MainAxisSize.min,
                                      children: [
                                        Container(
                                            padding:
                                            EdgeInsets.all(8),
                                            decoration:
                                            BoxDecoration(
                                              shape:
                                              BoxShape.circle,
                                              color: AppColors
                                                  .lightPrimary,
                                            ),
                                            child: Icon(
                                                Icons
                                                    .picture_as_pdf,
                                                color: AppColors
                                                    .white)),
                                        Gap(8),
                                        CustomTextWidget(
                                          text: fileName,
                                          fontWeight:
                                          FontWeight.w500,
                                          fontSize: 12,
                                          textColor:
                                          AppColors.black,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                      top: 0,
                                      right: 0,
                                      child: GestureDetector(
                                        onTap: (){
                                          onPressRemove(index);
                                        },
                                        child: Container(
                                          padding:
                                          EdgeInsets.all(3),
                                          decoration: BoxDecoration(
                                              color: AppColors
                                                  .lightPrimary,
                                              shape: BoxShape
                                                  .circle),
                                          child: Icon(
                                              CupertinoIcons
                                                  .multiply,
                                              size: 12,
                                              color: AppColors
                                                  .white),
                                        ),
                                      ))
                                ],
                              );
                            },
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}