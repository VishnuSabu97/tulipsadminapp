import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import 'package:tulipsadminapp/Ui/Splash/splash_viewmodel.dart';
import 'package:tulipsadminapp/app/image_constant.dart';
import 'package:tulipsadminapp/theme/theme_helper.dart';
import 'package:tulipsadminapp/widgets/custom_image_view.dart';


import '../../core/app_export.dart';



class SplashView extends StatelessWidget {
  const SplashView({Key? key})
      : super(
    key: key,
  );

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewModel>.reactive(

        viewModelBuilder: () => SplashViewModel(),
        onViewModelReady: (model) {
          model.startTimer();
        },
        builder: (context, model, child) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: appTheme.gray100,
              body: SizedBox(
                width: double.maxFinite,
                child: Column(
                  children: [
                    Spacer(),
                    SvgPicture.asset(
                      ImageConstant.imgLogoPrimary,
                      height: 97.v,
                      width: 116.h,
                    ),
                    SizedBox(height: 63.v),
                    Opacity(
                      opacity: 0.4,
                      child: CustomImageView(
                        imagePath: ImageConstant.imgImage1,
                        height: 288.v,
                        width: 360.h,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
