import 'package:flutter/material.dart';
import 'package:tulipsadminapp/Ui/home_screenn/cat.dart';


import '../../../app/image_constant.dart';
import '../../../app/size_utils.dart';
import '../../../theme/custom_text_style.dart';
import '../../../widgets/custom_image_view.dart';

// ignore: must_be_immutable
class HomeItemWidget extends StatelessWidget {
 late Category category;
   HomeItemWidget({Key? key,required this.category})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
           backgroundImage: NetworkImage("${category.url}"),
          radius: 30.adaptSize,

        ),
        SizedBox(height: 3.v),
        Text(
          "${category.catname}",
          style: CustomTextStyles.bodySmallPrimary,
        ),
      ],
    );
  }
}
