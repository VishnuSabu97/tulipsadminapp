

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
//t 'package:tulipsadmin/ui/onboard/onboard_screenviewmodel.dart';


import '../../app/image_constant.dart';
import '../../app/size_utils.dart';
import '../../theme/app_decoration.dart';
import '../../theme/custom_text_style.dart';
import '../../theme/theme_helper.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_image_view.dart';
import 'onboard_screenviewmodel.dart';

class OnboardScreen extends StatelessWidget {
  OnboardScreen({Key? key})
      : super(
          key: key,
        );

  //Country selectedCountry = CountryPickerUtils.getCountryByPhoneCode('91');



  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OnboardScreenViewModel>.reactive(

        viewModelBuilder: () => OnboardScreenViewModel(),
    onViewModelReady: (model) {

    },
    builder: (context, model, child) {
      return SafeArea(
        child: Scaffold(
          backgroundColor: appTheme.gray100,
          resizeToAvoidBottomInset: false,
          body: Form(
            key: model.formKey,
            child: SizedBox(
              width: double.maxFinite,
              child: Column(
                children: [
                  SizedBox(
                    height: 510.v,
                    width: double.maxFinite,
                    child: Stack(
                      alignment: Alignment.bottomLeft,
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
                                    height: 472.v,
                                    width: 360.h,
                                    alignment: Alignment.center,
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
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            width: 284.h,
                            margin: EdgeInsets.only(left: 16.h),
                            child: Text(
                              "Where Beauty Meets Convenience – Your Next Appointment Awaits",
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.titleLarge,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 9.v),
                  Container(
                    width: 321.h,
                    margin: EdgeInsets.only(
                      left: 16.h,
                      right: 23.h,
                    ),
                    child: Text(
                      "Step into a world of seamless elegance and effortless scheduling as you embark on a journey to pamper yourself with our beautician booking application.",
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.bodySmallErrorContainer,
                    ),
                  ),
                  SizedBox(height: 52.v),
                  CustomElevatedButton(
                    onPressed: (){model.nav();},
                    text: "Next",
                    margin: EdgeInsets.symmetric(horizontal: 16.h),
                    buttonTextStyle:
                    CustomTextStyles.labelLargeInterOnErrorContainer,
                  ),
                  Expanded(child: SizedBox(height: 10,)),

                ],
              ),
            ),
          ),
        ),
      );
    });}

  }

