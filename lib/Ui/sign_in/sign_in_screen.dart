


import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tulipsadminapp/Ui/sign_in/sign_in_view_model.dart';
import 'package:tulipsadminapp/app/image_constant.dart';
import 'package:tulipsadminapp/theme/app_decoration.dart';
import 'package:tulipsadminapp/theme/custom_text_style.dart';
import 'package:tulipsadminapp/theme/theme_helper.dart';
import 'package:tulipsadminapp/widgets/custom_elevated_button.dart';
import 'package:tulipsadminapp/widgets/custom_image_view.dart';
import 'package:tulipsadminapp/widgets/custom_text_form_field.dart';

import '../../app/utils.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key})
      : super(
          key: key,
        );

  //Country selectedCountry = CountryPickerUtils.getCountryByPhoneCode('91');



  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignInScreenViewModel>.reactive(

        viewModelBuilder: () => SignInScreenViewModel(),
    onViewModelReady: (model) {

    },
    builder: (context, model, child) {
      return   SafeArea(
        child: Scaffold(
          backgroundColor: appTheme.gray100,
          resizeToAvoidBottomInset: false,
          body: Form(
            key: model.formKey,
            child: SingleChildScrollView(
              child: SizedBox(
                height: SizeUtils.height,
                width: double.maxFinite,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: SizedBox(
                        height: 472.v,
                        width: double.maxFinite,
                        child: Stack(
                          alignment: Alignment.topLeft,
                          children: [
                            Opacity(
                              opacity: 0.43,
                              child: CustomImageView(
                                imagePath: ImageConstant.imgGetpaidstock1,
                                height: 555.v,
                                width: 360.h,
                                alignment: Alignment.bottomCenter,
                              ),
                            ),
                            Opacity(
                              opacity: 0.3,
                              child: CustomImageView(
                                imagePath: ImageConstant.imgLogo,
                                height: 40.v,
                                width: 47.h,
                                alignment: Alignment.topLeft,
                                margin: EdgeInsets.only(
                                  left: 16.h,
                                  top: 24.v,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 16.h,
                          right: 16.h,
                          bottom: 132.v,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [

                            SizedBox(height: 52.v),
                            // CustomElevatedButton(
                            //   text: "Next",
                            //   buttonTextStyle: CustomTextStyles.labelLargeInterOnErrorContainer,
                            // ),
                          ],
                        ),
                      ),
                    ),
                    // Align(
                    //   alignment: Alignment.bottomLeft,
                    //   child: Container(
                    //     width: 284.h,
                    //     margin: EdgeInsets.only(
                    //       left: 16.h,
                    //       bottom: 289.v,
                    //     ),
                    //     child: Text(
                    //       "Where Beauty Meets Convenience – Your Next Appointment Awaits",
                    //       maxLines: 3,
                    //       overflow: TextOverflow.ellipsis,
                    //       style: theme.textTheme.titleLarge,
                    //     ),
                    //   ),
                    // ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        margin: EdgeInsets.only(right: 3.h),
                        padding: EdgeInsets.symmetric(
                          horizontal: 13.h,
                          vertical: 53.v,
                        ),
                        decoration: AppDecoration.outlineBlack9001.copyWith(
                          borderRadius: BorderRadiusStyle.customBorderTL50,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 3.h),
                              child: Text(
                                "Effortless Glam Starts Here",
                                style: theme.textTheme.titleLarge,
                              ),
                            ),
                            SizedBox(height: 9.v),
                            Padding(
                              padding: EdgeInsets.only(left: 3.h),
                              child: Text(
                                "Log in with your email, authenticate your adminship",
                                style: CustomTextStyles.bodySmallErrorContainer,
                              ),
                            ),
                            SizedBox(height: 47.v),
                            Padding(
                              padding: EdgeInsets.only(left: 3.h),
                              child: CustomTextFormField(
                                controller: model.userNameController,
                                hintText: "Username",
                                validator: (value) {
                                  // Validation function for the name field
                                  if (value!.isEmpty) {
                                    return 'Please enter Username'; // Return an error message if the name is empty
                                  }
                                  return null; // Return null if the name is valid
                                },
                              ),
                            ),
                            SizedBox(height: 16.v),
                            Padding(
                              padding: EdgeInsets.only(left: 3.h),
                              child: CustomTextFormField(
                                controller: model.passwordController,
                                hintText: "Password",
                                textInputAction: TextInputAction.done,
                                textInputType: TextInputType.visiblePassword,
                                obscureText: true,
                                validator: (value) {
                                  // Validation function for the name field
                                  if (value!.isEmpty) {
                                    return 'Please enter Password'; // Return an error message if the name is empty
                                  }
                                  return null; // Return null if the name is valid
                                },
                              ),
                            ),
                            SizedBox(height: 73.v),
                            CustomElevatedButton(
                              onPressed: (){
                                model.navv();
                              },
                              text: "Login",
                              margin: EdgeInsets.only(left: 3.h),
                              buttonTextStyle: CustomTextStyles.labelLargeInterOnErrorContainer,
                            ),
                            SizedBox(height: 85.v),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });}

  }

