// ignore_for_file: must_be_immutable
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../app/image_constant.dart';
import '../../app/size_utils.dart';
import '../../theme/app_decoration.dart';
import '../../theme/custom_button_style.dart';
import '../../theme/custom_text_style.dart';
import '../../theme/theme_helper.dart';
import '../../widgets/app_bar/appbar_leading_iconbutton.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_icon_button.dart';
import '../../widgets/custom_image_view.dart';
import '../../widgets/custom_text_form_field.dart';
import 'add_service_one_screenviewmodel.dart';

class AddServiceOneScreen extends StatelessWidget {
  String url, name, discription, category;

  AddServiceOneScreen(
      {Key? key,
      required this.url,
      required this.name,
      required this.discription,
      required this.category});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddServiceOneScreenViewModel>.reactive(
        viewModelBuilder: () => AddServiceOneScreenViewModel(),
        onViewModelReady: (model) {
          model.update(url, name, discription, category);
        },
        builder: (context, model, child) {
          return SafeArea(
              child: Scaffold(
                appBar: AppBar(leading: IconButton(onPressed: () {  }, icon: Icon(Icons.arrow_back_outlined),),),
                  resizeToAvoidBottomInset: false,
                  body: SingleChildScrollView(
                    child: Form(
                      key: model.formKey,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(

                            children: [
                          Column(children: [
                         
                            TextFormField(
                              validator: (value) {
                                // Validation function for the name field
                                if (value!.isEmpty) {
                                  return 'Please enter Price.'; // Return an error message if the name is empty
                                }
                                return null; // Return null if the name is valid
                              },
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: "Price",
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 15.h, vertical: 17.v)),
                              controller: model.priceController,
                            ),
                            SizedBox(height: 15.v),
                                        TextFormField(
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              hintText: "Discount Percentage",
                                              contentPadding:
                                              EdgeInsets.symmetric(
                                                  horizontal: 15.h,
                                                  vertical: 17.v)),
                                          keyboardType: TextInputType.number,
                                          validator: (value) {
                                            // Validation function for the name field
                                            if (value!.isEmpty) {
                                              return 'Please enter Discount %.'; // Return an error message if the name is empty
                                            }
                                            return null; // Return null if the name is valid
                                          },
                                          controller:
                                          model.discountpercentctrlr,
                                        ),
                            SizedBox(height: 15.v),
                                      TextFormField(
                                        validator: (value) {
                                          // Validation function for the name field
                                          if (value!.isEmpty) {
                                            return 'Please enter Discount Price.'; // Return an error message if the name is empty
                                          }
                                          return null; // Return null if the name is valid
                                        },
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText: "Discount Price",
                                            contentPadding:
                                            EdgeInsets.symmetric(
                                                horizontal: 15.h,
                                                vertical: 17.v)),
                                        controller: model.dispricectrlr,
                                      ),

                            SizedBox(height: 15.v),
                            TextFormField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: "Duration",
                                    contentPadding:
                                    EdgeInsets.symmetric(
                                        horizontal: 15.h,
                                        vertical: 17.v)),
                                validator: (value) {
                                  // Validation function for the name field
                                  if (value!.isEmpty) {
                                    return 'Please enter Duration.'; // Return an error message if the name is empty
                                  }
                                  return null; // Return null if the name is valid
                                },
                                controller: model.durationctrlr,
                                textInputAction:
                                TextInputAction.done),
                            SizedBox(height: 15.v),
                            TextFormField(
                                validator: (value) {
                                  // Validation function for the name field
                                  if (value!.isEmpty) {
                                    return 'Please enter Ideal for .'; // Return an error message if the name is empty
                                  }
                                  return null; // Return null if the name is valid
                                },
                                maxLines: 4,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: "Ideal for >>",

                                    contentPadding:
                                    EdgeInsets.symmetric(
                                        horizontal: 15.h,
                                        vertical: 17.v)),
                                controller: model.idealctrlr,
                                textInputAction:
                                TextInputAction.done),
                            SizedBox(height: 38.v),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Image Review",
                                      style: CustomTextStyles
                                          .titleMediumErrorContainer)),
                            ),
                            SizedBox(height: 8.v),
                            SizedBox(
                                height: 78.v,
                                width: 328.h,
                                child: Stack(
                                    alignment: Alignment.topCenter,
                                    children: [
                                      Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Container(
                                              margin:
                                              EdgeInsets.only(top: 11.v),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 5.h,
                                                  vertical: 7.v),
                                              decoration: AppDecoration
                                                  .outlineGray
                                                  .copyWith(
                                                  borderRadius:
                                                  BorderRadiusStyle
                                                      .roundedBorder5),
                                              child: Row(children: [
                                                CustomImageView(
                                                    imagePath: url,
                                                    height: 50.v,
                                                    width: 47.h,
                                                    radius:
                                                    BorderRadius.circular(
                                                        2.h)),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 8.h,
                                                        top: 4.v,
                                                        bottom: 5.v),
                                                    child: Column(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                        children: [
                                                          Text(
                                                              "${category}.jpg",
                                                              style: CustomTextStyles
                                                                  .bodySmallInterBlack900),
                                                          SizedBox(
                                                              height: 5.v),
                                                          Text("1.3 MB",
                                                              style: CustomTextStyles
                                                                  .bodySmallInterBluegray400)
                                                        ])),
                                                Spacer(),
                                                CustomImageView(
                                                    imagePath: ImageConstant
                                                        .imgGroup3,
                                                    height: 11.adaptSize,
                                                    width: 11.adaptSize,
                                                    margin: EdgeInsets.only(
                                                        top: 20.v,
                                                        right: 8.h,
                                                        bottom: 18.v))
                                              ]))),
                                      CustomIconButton(
                                          height: 24.adaptSize,
                                          width: 24.adaptSize,
                                          padding: EdgeInsets.all(6.h),
                                          alignment: Alignment.topCenter,
                                          child: CustomImageView(
                                              imagePath:
                                              ImageConstant.imgThumbsUp))
                                    ])),
                            SizedBox(height: 38.v),
                            CustomElevatedButton(
                                buttonStyle: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.purpleAccent),
                                width: 136.h,
                                onPressed: () {
                                  model.navsuccess();
                                },
                                text: "Add Service",
                                margin: EdgeInsets.only(right: 1.h),
                                alignment: Alignment.centerRight),
                            SizedBox(height: 5.v)
                          ]),

                        ]),
                      ),
                    ),
                  )));
        });
  }

  /// Section Widget

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}
