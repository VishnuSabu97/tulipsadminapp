

// ignore: must_be_immutable
import 'package:flutter/cupertino.dart';
import 'package:tulipsadminapp/app/image_constant.dart';
import 'package:tulipsadminapp/app/size_utils.dart';
import 'package:tulipsadminapp/widgets/custom_icon_button.dart';
import 'package:tulipsadminapp/widgets/custom_image_view.dart';

class AppbarLeadingIconbutton extends StatelessWidget {
  AppbarLeadingIconbutton({
    Key? key,
    this.imagePath,
    this.margin,
    this.onTap,
  }) : super(
          key: key,
        );

  String? imagePath;

  EdgeInsetsGeometry? margin;

  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap!.call();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: CustomIconButton(
          height: 40.adaptSize,
          width: 40.adaptSize,
          decoration: IconButtonStyleHelper.fillOnErrorContainer,
          child: CustomImageView(
            imagePath: ImageConstant.imgArrowLeft,
          ),
        ),
      ),
    );
  }
}
