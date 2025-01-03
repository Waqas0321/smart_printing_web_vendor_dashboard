import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smart_printing_web/App/Controllers/Vendor%20Dashboard/Settings/Product_Details/product_details_controller.dart';
import 'package:smart_printing_web/App/Controllers/Vendor%20Dashboard/Settings/Product_Details/add_product_controller.dart';
import 'package:smart_printing_web/App/Models/get_catagory_model.dart';
import 'package:smart_printing_web/App/Widgets/custom_text_button.dart';
import '../../../../Services/image_picker_services.dart';
import '../../../../Utils/Const/appColors.dart';
import '../../../../Utils/Const/app_icons.dart';
import '../../../../Utils/Const/app_sizes.dart';
import '../../../../Widgets/custom_divider.dart';
import '../../../../Widgets/custom_text_widget.dart';
import '../../../../Widgets/custom_textfield.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AddProductController addProductController = Get.put(AddProductController());
    ProductDetailsController productDetailsController =
        Get.put(ProductDetailsController());
    final imageService = Get.put(ImagePickerService());
    addProductController.fetchCategories();

    return LayoutBuilder(
      builder: (context, constraints) {
        final isLarge = AppSizes().isDesktop();
        return Padding(
          padding: AppSizes().getCustomPadding(),
          child: ScrollConfiguration(
            behavior:
                ScrollBehavior().copyWith(overscroll: false, scrollbars: false),
            child: SingleChildScrollView(
              child: Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextWidget(
                          text: "Add Product",
                          fontSize: 22,
                          textColor: AppColors.black,
                          fontWeight: FontWeight.w600,
                        ),
                        CustomTextButton(
                          color: AppColors.halfWhite2,
                          text: "Back",
                          hasBorder: false,
                          textColor: AppColors.brown,
                          onPress: () {
                            productDetailsController
                                .selectedIndexProducts.value = 0;
                          },
                        )
                      ],
                    ),
                    Gap(12),
                    isLarge
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Obx(
                                () => GestureDetector(
                                  onTap: () {
                                    addProductController.selectedOption.value =
                                        "Non-Inventory";
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: addProductController
                                                    .selectedOption.value ==
                                                "Non-Inventory"
                                            ? AppColors.lightPrimary
                                            : AppColors.brown.withOpacity(0.3),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding:
                                              AppSizes().getCustomPadding(),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: addProductController
                                                        .selectedOption.value ==
                                                    "Non-Inventory"
                                                ? AppColors.lightPrimary
                                                : AppColors.brown
                                                    .withOpacity(0.3),
                                          ),
                                          child: Center(
                                            child: SvgPicture.asset(
                                              AppIcons.inventoryIcon,
                                              color: addProductController
                                                          .selectedOption
                                                          .value ==
                                                      "Non-Inventory"
                                                  ? AppColors.brown
                                                  : AppColors.brown
                                                      .withOpacity(0.6),
                                            ),
                                          ),
                                        ),
                                        Gap(18),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CustomTextWidget(
                                              textAlign: TextAlign.start,
                                              text: "Non-Inventory",
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16,
                                              textColor: addProductController
                                                          .selectedOption
                                                          .value ==
                                                      "Non-Inventory"
                                                  ? AppColors.black
                                                  : AppColors.brown
                                                      .withOpacity(0.6),
                                            ),
                                            SizedBox(
                                              width: 200,
                                              child: CustomTextWidget(
                                                textAlign: TextAlign.start,
                                                textOverflow:
                                                    TextOverflow.visible,
                                                text:
                                                    "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout",
                                                fontWeight: FontWeight.w400,
                                                fontSize: 13,
                                                textColor: addProductController
                                                            .selectedOption
                                                            .value ==
                                                        "Non-Inventory"
                                                    ? AppColors.brown
                                                    : AppColors.brown
                                                        .withOpacity(0.3),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Gap(18),
                              Obx(
                                () => GestureDetector(
                                  onTap: () {
                                    addProductController.selectedOption.value =
                                        "Service";
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: addProductController
                                                    .selectedOption.value ==
                                                "Service"
                                            ? AppColors.lightPrimary
                                            : AppColors.brown.withOpacity(0.3),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding:
                                              AppSizes().getCustomPadding(),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: addProductController
                                                        .selectedOption.value ==
                                                    "Service"
                                                ? AppColors.lightPrimary
                                                : AppColors.brown
                                                    .withOpacity(0.3),
                                          ),
                                          child: Center(
                                            child: SvgPicture.asset(
                                              AppIcons.servicesIcon,
                                              color: addProductController
                                                          .selectedOption
                                                          .value ==
                                                      "Service"
                                                  ? AppColors.brown
                                                  : AppColors.brown
                                                      .withOpacity(0.6),
                                            ),
                                          ),
                                        ),
                                        Gap(18),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CustomTextWidget(
                                              textAlign: TextAlign.start,
                                              text: "Service",
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16,
                                              textColor: addProductController
                                                          .selectedOption
                                                          .value ==
                                                      "Service"
                                                  ? AppColors.black
                                                  : AppColors.brown
                                                      .withOpacity(0.6),
                                            ),
                                            SizedBox(
                                              width: 200,
                                              child: CustomTextWidget(
                                                textAlign: TextAlign.start,
                                                textOverflow:
                                                    TextOverflow.visible,
                                                text:
                                                    "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout",
                                                fontWeight: FontWeight.w400,
                                                fontSize: 13,
                                                textColor: addProductController
                                                            .selectedOption
                                                            .value ==
                                                        "Service"
                                                    ? AppColors.brown
                                                    : AppColors.brown
                                                        .withOpacity(0.3),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Obx(
                                () => GestureDetector(
                                  onTap: () {
                                    addProductController.selectedOption.value =
                                        "Non-Inventory";
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: addProductController
                                                    .selectedOption.value ==
                                                "Non-Inventory"
                                            ? AppColors.lightPrimary
                                            : AppColors.brown.withOpacity(0.3),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding:
                                              AppSizes().getCustomPadding(),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: addProductController
                                                        .selectedOption.value ==
                                                    "Non-Inventory"
                                                ? AppColors.lightPrimary
                                                : AppColors.brown
                                                    .withOpacity(0.3),
                                          ),
                                          child: Center(
                                            child: SvgPicture.asset(
                                              AppIcons.inventoryIcon,
                                              color: addProductController
                                                          .selectedOption
                                                          .value ==
                                                      "Non-Inventory"
                                                  ? AppColors.brown
                                                  : AppColors.brown
                                                      .withOpacity(0.6),
                                            ),
                                          ),
                                        ),
                                        Gap(18),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CustomTextWidget(
                                              textAlign: TextAlign.start,
                                              text: "Non-Inventory",
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16,
                                              textColor: addProductController
                                                          .selectedOption
                                                          .value ==
                                                      "Non-Inventory"
                                                  ? AppColors.black
                                                  : AppColors.brown
                                                      .withOpacity(0.6),
                                            ),
                                            SizedBox(
                                              width: 200,
                                              child: CustomTextWidget(
                                                textAlign: TextAlign.start,
                                                textOverflow:
                                                    TextOverflow.visible,
                                                text:
                                                    "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout",
                                                fontWeight: FontWeight.w400,
                                                fontSize: 13,
                                                textColor: addProductController
                                                            .selectedOption
                                                            .value ==
                                                        "Non-Inventory"
                                                    ? AppColors.brown
                                                    : AppColors.brown
                                                        .withOpacity(0.3),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Gap(18),
                              Obx(
                                () => GestureDetector(
                                  onTap: () {
                                    addProductController.selectedOption.value =
                                        "Service";
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: addProductController
                                                    .selectedOption.value ==
                                                "Service"
                                            ? AppColors.lightPrimary
                                            : AppColors.brown.withOpacity(0.3),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding:
                                              AppSizes().getCustomPadding(),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: addProductController
                                                        .selectedOption.value ==
                                                    "Service"
                                                ? AppColors.lightPrimary
                                                : AppColors.brown
                                                    .withOpacity(0.3),
                                          ),
                                          child: Center(
                                            child: SvgPicture.asset(
                                              AppIcons.servicesIcon,
                                              color: addProductController
                                                          .selectedOption
                                                          .value ==
                                                      "Service"
                                                  ? AppColors.brown
                                                  : AppColors.brown
                                                      .withOpacity(0.6),
                                            ),
                                          ),
                                        ),
                                        Gap(18),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CustomTextWidget(
                                              textAlign: TextAlign.start,
                                              text: "Service",
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16,
                                              textColor: addProductController
                                                          .selectedOption
                                                          .value ==
                                                      "Service"
                                                  ? AppColors.black
                                                  : AppColors.brown
                                                      .withOpacity(0.6),
                                            ),
                                            SizedBox(
                                              width: 200,
                                              child: CustomTextWidget(
                                                textAlign: TextAlign.start,
                                                textOverflow:
                                                    TextOverflow.visible,
                                                text:
                                                    "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout",
                                                fontWeight: FontWeight.w400,
                                                fontSize: 13,
                                                textColor: addProductController
                                                            .selectedOption
                                                            .value ==
                                                        "Service"
                                                    ? AppColors.brown
                                                    : AppColors.brown
                                                        .withOpacity(0.3),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                    addProductController.selectedOption.value == "Non-Inventory"
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Gap(28),
                              CustomDivider(),
                              Gap(12),
                              CustomTextWidget(
                                text: "Product Services Information",
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
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
                                      child: SvgPicture.asset(
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
                                  return GestureDetector(
                                    onTap: () {
                                      imageService
                                          .pickImageFromGallery(context);
                                      addProductController.selectedImage = imageService.selectedImage;
                                    },
                                    child: Container(
                                      clipBehavior: Clip.antiAlias,
                                      height: 150,
                                      width: AppSizes().getWidthPercentage(100),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        border: Border.all(
                                          width: 0.5,
                                          color: AppColors.black,
                                        ),
                                      ),
                                      child: imageService.selectedImage.value ==
                                              null
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
                              Gap(16),
                              Row(
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                              controller: addProductController
                                                  .nameController)
                                        ],
                                      ),
                                    ),
                                  ),
                                  Gap(16),
                                  Expanded(
                                    child: SizedBox(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                              controller: addProductController
                                                  .skuController)
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Gap(16),
                              SizedBox(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomTextWidget(
                                      text: "Category",
                                      fontSize: 12,
                                      textColor: AppColors.brown,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    Gap(6),
                                    Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 12),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        border: Border.all(
                                            color: AppColors.brown.withOpacity(
                                                0.5)), // Border color
                                      ),
                                      child: Obx(() {
                                        if (addProductController
                                            .isLoading.value) {
                                          return ListView.builder(
                                            shrinkWrap: true,
                                            itemCount: 1,
                                            itemBuilder: (context, index) {
                                              return Shimmer.fromColors(
                                                baseColor: Colors.grey[300]!,
                                                highlightColor:
                                                    Colors.grey[100]!,
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 8.0),
                                                  child: Container(
                                                    height: 20,
                                                    margin: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 16),
                                                    color: Colors.grey[300],
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        }
                                        if (addProductController
                                            .categories.isEmpty) {
                                          return CustomTextWidget(
                                            text: 'No categories available',
                                            textColor: AppColors.red,
                                          );
                                        }
                                        return DropdownButton<GetCategoryModel>(
                                          isExpanded: true,
                                          focusColor: Colors.transparent,
                                          icon: Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            color: AppColors.black,
                                          ),
                                          underline: SizedBox(),
                                          hint: CustomTextWidget(
                                            text: "Choose Catagory",
                                            fontSize: 12,
                                            textColor: AppColors.brown,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          value: addProductController
                                              .selectedCategory.value,
                                          items: addProductController.categories
                                              .map(
                                                (cat) => DropdownMenuItem<
                                                        GetCategoryModel>(
                                                    value: cat,
                                                    child: CustomTextWidget(
                                                        text: cat.name)),
                                              )
                                              .toList(),
                                          onChanged: (GetCategoryModel? newValue) {
                                            addProductController
                                                .selectCategory(newValue);
                                          },
                                        );
                                      }),
                                    ),
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
                                        controller: addProductController
                                            .descriptionController)
                                  ],
                                ),
                              ),
                              Gap(16),
                              SizedBox(
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                              controller: addProductController
                                                  .rateController)
                                        ],
                                      ),
                                    ),
                                    Gap(16),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomTextWidget(
                                            text: "Income Account",
                                            fontSize: 12,
                                            textColor: AppColors.brown,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          Gap(6),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 12),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                              border: Border.all(
                                                  color: AppColors.brown
                                                      .withOpacity(
                                                          0.5)), // Border color
                                            ),
                                            child: DropdownButton<String>(
                                              focusColor: Colors.transparent,
                                              icon: Icon(
                                                Icons
                                                    .keyboard_arrow_down_rounded,
                                                color: AppColors.black,
                                              ),
                                              isExpanded: true,
                                              underline: SizedBox(),
                                              // Remove the default underline
                                              hint: CustomTextWidget(
                                                text: "Select Account",
                                                fontSize: 12,
                                                textColor: AppColors.brown,
                                                fontWeight: FontWeight.w400,
                                              ),
                                              value: addProductController
                                                  .selectedIncomeAccount.value,
                                              items: [
                                                DropdownMenuItem(
                                                  value: "403 Services",
                                                  child: CustomTextWidget(
                                                    text: "403 Services",
                                                    fontSize: 12,
                                                    textColor: AppColors.brown,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                DropdownMenuItem(
                                                  value: "404 Services",
                                                  child: CustomTextWidget(
                                                    text: "404 Services",
                                                    fontSize: 12,
                                                    textColor: AppColors.brown,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                DropdownMenuItem(
                                                  value: "405 Services",
                                                  child: CustomTextWidget(
                                                    text: "405 Services",
                                                    fontSize: 12,
                                                    textColor: AppColors.brown,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ],
                                              onChanged: (value) {
                                                addProductController
                                                    .selectedIncomeAccount
                                                    .value = value!;
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Gap(11),
                              Row(
                                children: [
                                  Obx(
                                    () => Checkbox(
                                      value: addProductController
                                          .includeTax.value,
                                      onChanged: (value) {
                                        addProductController
                                            .toggleCheckbox(value);
                                      },
                                      activeColor: AppColors.lightPrimary,
                                      checkColor: AppColors.tertiary,
                                    ),
                                  ),
                                  Gap(4),
                                  CustomTextWidget(
                                    text: "Inclusive of tax",
                                    fontSize: 10,
                                    textColor: AppColors.brown,
                                    fontWeight: FontWeight.w500,
                                  )
                                ],
                              ),
                              Gap(16),
                              SizedBox(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomTextWidget(
                                      text: "Tax",
                                      fontSize: 12,
                                      textColor: AppColors.brown,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    Gap(6),
                                    Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 12),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        border: Border.all(
                                            color: AppColors.brown.withOpacity(
                                                0.5)), // Border color
                                      ),
                                      child: DropdownButton<String>(
                                        isExpanded: true,
                                        focusColor: Colors.transparent,
                                        icon: Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: AppColors.black,
                                        ),
                                        underline: SizedBox(),
                                        hint: CustomTextWidget(
                                          text: "Select Tax",
                                          fontSize: 12,
                                          textColor: AppColors.brown,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        value: addProductController
                                            .selectedTax.value,
                                        items: [
                                          DropdownMenuItem(
                                            value: "1000",
                                            child: CustomTextWidget(
                                              text: "1000",
                                              fontSize: 12,
                                              textColor: AppColors.brown,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          DropdownMenuItem(
                                            value: "2000",
                                            child: CustomTextWidget(
                                              text: "2000",
                                              fontSize: 12,
                                              textColor: AppColors.brown,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          DropdownMenuItem(
                                            value: "3000",
                                            child: CustomTextWidget(
                                              text: "3000",
                                              fontSize: 12,
                                              textColor: AppColors.brown,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                        onChanged: (value) {
                                          addProductController
                                              .selectedTax.value = value!;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Gap(16),
                              CustomTextWidget(
                                text: "Purchase Information",
                                fontSize: 12,
                                textColor: AppColors.brown,
                                fontWeight: FontWeight.w600,
                              ),
                              Gap(9),
                              Row(
                                children: [
                                  Obx(
                                    () => Checkbox(
                                      value: addProductController
                                          .frmSup.value,
                                      onChanged: (value) {
                                        addProductController
                                            .toggleCheckboxPurchase(value);
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
                                  Obx(
                                  () => CustomTextButton(
                                      color: AppColors.lightPrimary,
                                      text: addProductController.isPosting.value?"Loading...": "Save & Proceed",
                                      hasBorder: false,
                                      textColor: AppColors.brown,
                                      onPress: () async{
                                       await addProductController.addProduct();
                                      },
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Gap(28),
                              CustomDivider(),
                              Gap(12),
                              CustomTextWidget(
                                text: "Product Services Information",
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
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
                                      child: SvgPicture.asset(
                                        AppIcons.servicesIcon,
                                        color: AppColors.brown,
                                      ),
                                    ),
                                  ),
                                  CustomTextWidget(
                                    textAlign: TextAlign.start,
                                    text: "Services",
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
