import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';
import 'package:stacked/stacked.dart';

import '../../app/image_constant.dart';
import '../../app/size_utils.dart';
import '../../theme/app_decoration.dart';
import '../../theme/custom_text_style.dart';
import '../../theme/theme_helper.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_icon_button.dart';
import '../../widgets/custom_image_view.dart';
import '../../widgets/custom_outlined_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'add_cat_screen_viewModel.dart';

class AddCatScreen extends StatelessWidget {
  AddCatScreen({Key? key})
      : super(
    key: key,
  );

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddCatScreenViewModel>.reactive(
        viewModelBuilder: () => AddCatScreenViewModel(),
        onViewModelReady: (model) {},
        builder: (context, model, child) {
          return SafeArea(
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    TakePic(),


                    SizedBox(height: 9.v),
                    SizedBox(
                      height: 76.v,
                      width: 328.h,
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              margin: EdgeInsets.only(top: 11.v),
                              padding: EdgeInsets.symmetric(
                                horizontal: 14.h,
                                vertical: 23.v,
                              ),
                              decoration: AppDecoration.outlineGray.copyWith(
                                borderRadius: BorderRadiusStyle.roundedBorder5,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 1.v),
                                    child: Text(
                                      "image.jpg",
                                      style: CustomTextStyles
                                          .bodySmallInterBlack900,
                                    ),
                                  ),
                                  CustomImageView(
                                    imagePath: ImageConstant.imgGroup3,
                                    height: 11.adaptSize,
                                    width: 11.adaptSize,
                                    margin: EdgeInsets.only(
                                      top: 1.v,
                                      bottom: 4.v,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          CustomIconButton(
                            height: 24.adaptSize,
                            width: 24.adaptSize,
                            padding: EdgeInsets.all(6.h),
                            alignment: Alignment.topCenter,
                            child: CustomImageView(
                              imagePath: ImageConstant.imgThumbsUp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15.v),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 15.h,
                        right: 16.h,
                      ),
                      child: TextFormField(
                        controller: model.inputDefaultController,

                        decoration: InputDecoration(border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 15.h,
                              vertical: 17.v,
                            ),
                            hintText: "Add Title"),
                        textInputAction: TextInputAction.done,

                      ),
                    ),
                    SizedBox(height: 46.v),
                    CustomElevatedButton(
                      onPressed: (){
                        if(model.inputDefaultController.text==null||model.url==null){
                          print("object");
                        }else{
                          model.uploadFile(model.inputDefaultController.text, model.url);
                        }
                      },
                      width: 247.h,
                      text: "Save Categories",

                    ),
                    SizedBox(height: 5.v),
                  ],
                ),
              ),
            ),
          );
        });
  }

/// Section Widget
// Widget _buildFortyThree(BuildContext context) {
//   return ;
// }

// /// Section Widget
// Widget _buildFortyFour(BuildContext context) {
//   return ;
// }
}
class TakePic extends ViewModelWidget<AddCatScreenViewModel> {
  TakePic({super.key});

  @override
  Widget build(BuildContext context, AddCatScreenViewModel viewModel) {
    var url;

    File? _image;

    // This is the image picker
    final _picker = ImagePicker();

    getImage() async {
      final XFile? pickedImage =
      await _picker.pickImage(source: ImageSource.gallery);
      print(pickedImage!.path.toString());
      _image = File(pickedImage!.path);
      viewModel.UpdateFile(_image);

      var imagefile = FirebaseStorage.instance
          .ref()
          .child("category_thumbnail")
          .child("/catimage${_image}.jpg");
      UploadTask task = imagefile.putFile(_image!);

      TaskSnapshot snapshot = await task;

      url = await snapshot.ref.getDownloadURL();

      print("url::::${url.toString()}");
      viewModel.Updateurl(url);

      // print(file);
    }

    return viewModel.file == null
        ? InkWell(
      onTap: (){
        getImage();
      },
      child: SizedBox(
        height: 338.v,
        width: 359.h,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgRectangle18794,
              height: 241.v,
              width: 359.h,
              alignment: Alignment.topCenter,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.h),
                child: DottedBorder(
                  color: appTheme.black900,
                  padding: EdgeInsets.only(
                    left: 1.h,
                    top: 1.v,
                    right: 1.h,
                    bottom: 1.v,
                  ),
                  strokeWidth: 1.h,
                  radius: Radius.circular(11),
                  borderType: BorderType.RRect,
                  dashPattern: [
                    2.7608697414398193,
                    2.7608697414398193,
                  ],
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 112.h,
                      vertical: 38.v,
                    ),
                    decoration:
                    AppDecoration.outlineBlack.copyWith(
                      borderRadius:
                      BorderRadiusStyle.roundedBorder11,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: 23.v),
                        CustomImageView(
                          imagePath: ImageConstant.imgTwitter,
                          height: 46.v,
                          width: 66.h,
                        ),
                        SizedBox(height: 12.v),
                        Container(
                          width: 89.h,
                          margin: EdgeInsets.only(
                            left: 6.h,
                            right: 4.h,
                          ),
                          child: Text(
                            "Drag and drop files to upload",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: CustomTextStyles
                                .bodyMediumInterBlack900,
                          ),
                        ),
                        SizedBox(height: 23.v),
                        Text(
                          "OR",
                          style: CustomTextStyles
                              .bodyMediumInterBlack900,
                        ),
                        SizedBox(height: 25.v),
                        OutlineGradientButton(
                          padding: EdgeInsets.only(
                            left: 1.h,
                            top: 1.v,
                            right: 1.h,
                            bottom: 1.v,
                          ),
                          strokeWidth: 1.h,
                          gradient: LinearGradient(
                            begin: Alignment(0.12, 0),
                            end: Alignment(0.93, 1.1),
                            colors: [
                              theme.colorScheme.onErrorContainer
                                  .withOpacity(0.8),
                              theme.colorScheme.onErrorContainer
                                  .withOpacity(1),
                            ],
                          ),
                          corners: Corners(
                            topLeft: Radius.circular(5),
                            topRight: Radius.circular(5),
                            bottomLeft: Radius.circular(5),
                            bottomRight: Radius.circular(5),
                          ),
                          child: CustomOutlinedButton(
                            text: "Browse",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ):Container(child:Image.file(
      viewModel.file!,
      fit: BoxFit.cover,
    ),
        height: 338.v,
        width: 359.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            10.h,
          ),
        ));




  }
}