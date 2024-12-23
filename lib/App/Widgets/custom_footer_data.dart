// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
// import 'package:google_fonts/google_fonts.dart';
// import '../Controllers/Vendor Dashboard/Settings/Processes/process_builder_controller.dart';
// import '../Utils/Const/appColors.dart';
// import '../Utils/Const/app_sizes.dart';
// import 'custom_text_widget.dart';
// import 'custom_textfield.dart';
// class CustomFooterData extends StatelessWidget {
//   const CustomFooterData({
//     super.key,
//     required this.processesBuilderController, required this.text,
//   });
//
//   final ProcessBuilderController processesBuilderController;
//   final String text;
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               CustomTextWidget(
//                 text: text,
//                 fontSize: 12,
//                 fontWeight:
//                 FontWeight
//                     .w400,
//                 textColor:
//                 AppColors
//                     .brown,
//               ),
//               Gap(12),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Container(
//                       padding: AppSizes()
//                           .getCustomPadding(),
//                       decoration: BoxDecoration(
//                           border: Border.all(
//                               color: AppColors
//                                   .lightPrimary,
//                               width: 1),
//                           borderRadius:
//                           BorderRadius
//                               .circular(
//                               8)),
//                       child: Column(
//                         children: [
//                           CustomTextWidget(
//                             text: '200-30DDGSM',
//                             fontSize: 12,
//                             fontWeight:
//                             FontWeight
//                                 .w400,
//                             textColor:
//                             AppColors
//                                 .brown,
//                           ),
//                           Gap(8), CustomTextWidget(
//                             text: '200-30DDGSM',
//                             fontSize: 12,
//                             fontWeight:
//                             FontWeight
//                                 .w400,
//                             textColor:
//                             AppColors
//                                 .brown,
//                           ),
//                           Gap(8), CustomTextWidget(
//                             text: '200-30DDGSM',
//                             fontSize: 12,
//                             fontWeight:
//                             FontWeight
//                                 .w400,
//                             textColor:
//                             AppColors
//                                 .brown,
//                           ),
//                           Gap(8), CustomTextWidget(
//                             text: '200-30DDGSM',
//                             fontSize: 12,
//                             fontWeight:
//                             FontWeight
//                                 .w400,
//                             textColor:
//                             AppColors
//                                 .brown,
//                           ),
//                         ],
//                       )),
//                 ],
//               ),
//               Gap(12),
//             ],
//           ),
//           Gap(12),
//           SingleChildScrollView(
//             scrollDirection:
//             Axis.horizontal,
//             child: Row(
//               mainAxisAlignment:MainAxisAlignment.start,
//               children: [
//                text=="Basic Level:"? CustomTextWidget(
//                   text:  'Direct Timer:',
//                   fontSize: 12,
//                   fontWeight:
//                   FontWeight
//                       .w400,
//                   textColor:
//                   AppColors
//                       .brown,
//                 ):CustomTextWidget(
//                  text:  'Percentile Timer:',
//                  fontSize: 12,
//                  fontWeight:
//                  FontWeight
//                      .w400,
//                  textColor:
//                  AppColors
//                      .brown,
//                ),
//
//                 Gap(12),
//                 text=="Basic Level:"? SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: Row(
//                     children: [
//                       SizedBox(
//                           width: 40,
//                           height: 35,
//                           child: CustomTextField(
//                               borderColor:
//                               AppColors
//                                   .lightPrimary,
//                               borderRadius:
//                               4,
//                               hintFontSize:
//                               12,
//                               contentSize:
//                               12,
//                               hintText:
//                               "05",
//                               controller:
//                               processesBuilderController
//                                   .lengthController)),
//                       Gap(2),
//                       CustomTextWidget(
//                         text: ":",
//                         fontSize: 12,
//                         fontWeight:
//                         FontWeight
//                             .w500,
//                         textColor:
//                         AppColors
//                             .brown,
//                       ),
//                       Gap(2),
//                       SizedBox(
//                           width: 40,
//                           height: 35,
//                           child: CustomTextField(
//                               borderColor:
//                               AppColors
//                                   .lightPrimary,
//                               borderRadius:
//                               4,
//                               hintFontSize:
//                               12,
//                               contentSize:
//                               12,
//                               hintText:
//                               "00",
//                               controller:
//                               processesBuilderController
//                                   .lengthController)),
//                       Gap(2),
//                       CustomTextWidget(
//                         text: ":",
//                         fontSize: 12,
//                         fontWeight:
//                         FontWeight
//                             .w500,
//                         textColor:
//                         AppColors
//                             .brown,
//                       ),
//                       Gap(2),
//                       SizedBox(
//                           width: 40,
//                           height: 35,
//                           child: CustomTextField(
//                               borderColor:
//                               AppColors
//                                   .lightPrimary,
//                               borderRadius:
//                               4,
//                               hintFontSize:
//                               12,
//                               contentSize:
//                               12,
//                               hintText:
//                               "56",
//                               controller:
//                               processesBuilderController
//                                   .lengthController)),
//                     ],
//                   ),
//                 ):SingleChildScrollView(
//                   scrollDirection:
//                   Axis.horizontal,
//                   child: Row(
//                     children: [
//                       Gap(2),
//                       SizedBox(
//                           width: 50,
//                           height: 35,
//                           child: CustomTextField(
//                               borderColor:
//                               AppColors
//                                   .lightPrimary,
//                               borderRadius: 4,
//                               hintFontSize:
//                               12,
//                               contentSize: 12,
//                               hintText: "05",
//                               controller:
//                               processesBuilderController
//                                   .lengthController)),
//                       Gap(8),
//                       CustomTextWidget(
//                         text: "%",
//                         textColor:
//                         AppColors.black,
//                         fontWeight:
//                         FontWeight.w600,
//                       ),
//                       Gap(8),
//                       SizedBox(
//                         height: 35,
//                         width: 100,
//                         child:
//                         DropdownButtonFormField<
//                             String>(
//                           value:
//                           processesBuilderController
//                               .selectedType1
//                               .value,
//                           items: [
//                             DropdownMenuItem(
//                                 value:
//                                 "Type 1",
//                                 child: CustomTextWidget(
//                                     text:
//                                     "Type 1 ")),
//                             DropdownMenuItem(
//                                 value:
//                                 "Type 2",
//                                 child: CustomTextWidget(
//                                     text:
//                                     "Type 2 ")),
//                             DropdownMenuItem(
//                                 value:
//                                 "Type 3",
//                                 child: CustomTextWidget(
//                                     text:
//                                     "Type 3 ")),
//                           ],
//                           onChanged: (value) {
//                             processesBuilderController
//                                 .selectedType1
//                                 .value = value!;
//                           },
//                           decoration:
//                           InputDecoration(
//                             hintText: "CM",
//                             hintStyle: GoogleFonts
//                                 .montserrat(
//                                 fontWeight:
//                                 FontWeight
//                                     .w500,
//                                 fontSize:
//                                 9),
//                             enabledBorder:
//                             OutlineInputBorder(
//                               gapPadding: 0,
//                               borderSide: BorderSide(
//                                   color: AppColors
//                                       .lightPrimary),
//                               borderRadius:
//                               BorderRadius
//                                   .circular(
//                                   4),
//                             ),
//                             focusedBorder:
//                             OutlineInputBorder(
//                               gapPadding: 0,
//                               borderSide: BorderSide(
//                                   color: AppColors
//                                       .lightPrimary),
//                               borderRadius:
//                               BorderRadius
//                                   .circular(
//                                   4),
//                             ),
//                             errorBorder:
//                             OutlineInputBorder(
//                               gapPadding: 0,
//                               borderSide: BorderSide(
//                                   color: AppColors
//                                       .lightPrimary),
//                               borderRadius:
//                               BorderRadius
//                                   .circular(
//                                   4),
//                             ),
//                             focusedErrorBorder:
//                             OutlineInputBorder(
//                               gapPadding: 0,
//                               borderSide: BorderSide(
//                                   color: AppColors
//                                       .lightPrimary),
//                               borderRadius:
//                               BorderRadius
//                                   .circular(
//                                   4),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }