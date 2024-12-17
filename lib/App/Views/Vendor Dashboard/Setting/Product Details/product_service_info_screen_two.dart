import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:smart_printing_web/App/Controllers/Vendor%20Dashboard/Settings/Product_Details/product_service_info_controller.dart';
import 'package:smart_printing_web/App/Widgets/custom_text_button.dart';
import '../../../../Services/image_picker_services.dart';
import '../../../../Utils/Const/appColors.dart';
import '../../../../Utils/Const/app_icons.dart';
import '../../../../Utils/Const/app_sizes.dart';
import '../../../../Widgets/custom_divider.dart';
import '../../../../Widgets/custom_text_widget.dart';
import '../../../../Widgets/custom_textfield.dart';

class ProductServiceInfoScreenTwo extends StatelessWidget {
  const ProductServiceInfoScreenTwo({
    super.key, required this.overlayEntry,
  });
  final OverlayEntry overlayEntry;

  @override
  Widget build(BuildContext context) {
    ProductServiceInfoController productServiceInfoController =
        Get.put(ProductServiceInfoController());
    return LayoutBuilder(
      builder: (context, constraints) {
        final isLarge = AppSizes().isDesktop();
        return Material(
          color: Colors.white,
          elevation: 8,
          child: Padding(
            padding: AppSizes().getCustomPadding(),
            child: ScrollConfiguration(
              behavior: ScrollBehavior()
                  .copyWith(overscroll: false, scrollbars: false),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomTextWidget(
                      text: "Product Services Information",
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                    Gap(8),
                    CustomDivider(),
                    Gap(8),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: AppSizes().getCustomPadding(),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.lightPrimary,
                          ),
                          child: Center(
                            child:  SvgPicture.asset(
                              AppIcons.inventoryIcon,
                              color: AppColors.brown,
                            ),
                          ),
                        ),
                        CustomTextWidget(
                          textAlign: TextAlign.start,
                          text: "Non-Inventory",
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                          textColor: AppColors.black,
                        ),
                        Spacer(),
                        CustomTextWidget(
                          textAlign: TextAlign.start,
                          text: "Change Type",
                          fontWeight: FontWeight.w500,
                          fontSize: 11,
                          textColor: AppColors.blue,
                        ),
                      ],
                    ),
                    Gap(16),
                    Obx(
                      () {
                        final imageService = Get.put(ImagePickerService());
                        return GestureDetector(
                          onTap: () =>
                              imageService.pickImageFromGallery(context),
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
                            child: imageService.selectedImage.value == null
                                ? const Center(
                                    child: Icon(
                                      Icons.file_upload_outlined,
                                      color: AppColors.brown,
                                    ),
                                  )
                                : Image.network(
                                    imageService.selectedImage.value!.path,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        );
                      },
                    ),
                    Gap(16),
                    SizedBox(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextWidget(
                            text: "Name*",
                            fontSize: 12,
                            textColor: AppColors.brown,
                            fontWeight: FontWeight.w600,
                          ),
                          Gap(6),
                          CustomTextField(
                              hintText: "Name",
                              hintFontSize: 12,
                              borderRadius: 6,
                              borderColor: AppColors.brown,
                              controller:
                                  productServiceInfoController.nameController)
                        ],
                      ),
                    ),
                    Gap(16),
                    SizedBox(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextWidget(
                            text: "SKU",
                            fontSize: 12,
                            textColor: AppColors.brown,
                            fontWeight: FontWeight.w600,
                          ),
                          Gap(6),
                          CustomTextField(
                              hintText: "Text goes here",
                              hintFontSize: 12,
                              borderRadius: 6,
                              controller:
                                  productServiceInfoController.nameController)
                        ],
                      ),
                    ),
                    Gap(16),
                    SizedBox(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextWidget(
                            text: "Catagory",
                            fontSize: 12,
                            textColor: AppColors.brown,
                            fontWeight: FontWeight.w600,
                          ),
                          Gap(6),
                          CustomTextField(
                              hintText: "Text goes here",
                              hintFontSize: 12,
                              borderRadius: 6,
                              controller:
                                  productServiceInfoController.nameController)
                        ],
                      ),
                    ),
                    Gap(16),
                    SizedBox(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextWidget(
                            text: "Description",
                            fontSize: 12,
                            textColor: AppColors.brown,
                            fontWeight: FontWeight.w600,
                          ),
                          Gap(6),
                          CustomTextField(
                              maxLines: 3,
                              hintText: "Text goes here",
                              hintFontSize: 12,
                              borderRadius: 6,
                              controller:
                                  productServiceInfoController.nameController)
                        ],
                      ),
                    ),
                    Gap(16),
                    SizedBox(
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomTextWidget(
                                  text: "Sales price/rate",
                                  fontSize: 12,
                                  textColor: AppColors.brown,
                                  fontWeight: FontWeight.w600,
                                ),
                                Gap(6),
                                CustomTextField(
                                    hintText: "Text goes here",
                                    hintFontSize: 12,
                                    borderRadius: 6,
                                    controller: productServiceInfoController
                                        .nameController)
                              ],
                            ),
                          ),
                          Gap(6),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomTextWidget(
                                  text: "Income Account",
                                  fontSize: 12,
                                  textColor: AppColors.brown,
                                  fontWeight: FontWeight.w600,
                                ),
                                Gap(6),
                                CustomTextField(
                                    hintText: "Text goes here",
                                    hintFontSize: 12,
                                    borderRadius: 6,
                                    controller: productServiceInfoController
                                        .nameController)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Gap(16),
                    Row(
                      children: [
                        Obx(
                          () => Checkbox(
                            value: productServiceInfoController.boolValue.value,
                            onChanged: (value) {
                              productServiceInfoController
                                  .toggleCheckbox(value);
                            },
                            activeColor: AppColors.lightPrimary,
                            checkColor: AppColors.tertiary,
                          ),
                        ),
                        Gap(4),
                        CustomTextWidget(
                          text:
                              "I purchase this product/service from this supplier",
                          fontSize: 10,
                          textColor: AppColors.brown,
                          fontWeight: FontWeight.w500,
                        )
                      ],
                    ),
                    Gap(16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomTextButton(
                          color: AppColors.lightPrimary,
                          text: "Save & Proceed",
                          hasBorder: false,
                          textColor: AppColors.brown,
                          onPress: () {
                            overlayEntry.remove();
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
