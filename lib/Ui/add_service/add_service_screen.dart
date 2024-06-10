

import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
import '../home_screenn/cat.dart';
import 'addServiceScreenViewModel.dart';

class AddServiceScreen extends StatelessWidget {
  AddServiceScreen({Key? key})
      : super(
          key: key,
        );



  @override
  Widget build(BuildContext context) {
   return ViewModelBuilder<AddServiceScreenViewModel>.reactive(

        viewModelBuilder: () => AddServiceScreenViewModel(),
        onViewModelReady: (model) {
          model.fetchDataFromFirebase();

        },
        builder: (context, model, child) {
    return SafeArea(
    child: Scaffold(
    resizeToAvoidBottomInset: false,
    body: SingleChildScrollView(
      child: Form(
        key: model.formKey,
        child: Column(
        children: [
          TakePic(),
        SizedBox(height: 9.v),
          Container(
            height: 56.v,
            width: 328.h,
           decoration: BoxDecoration(
             border: Border.all(width: 1,color: Colors.black38),
             borderRadius: BorderRadius.circular(10.0)
           ),
           child:  Row(
             children: [
               Expanded(
                 child: DropdownButton(
                   isExpanded: true,
        padding: EdgeInsets.only(left: 16,right: 16),
                   // Initial Value
                   value: model.defaultcat,
        
                   // Down Arrow Icon
                   icon: const Icon(Icons.keyboard_arrow_down),
        
                   // Array list of items
                   items: model.catogorylist.map((Category items) {
                     return DropdownMenuItem(
                       value: items.catname,
                       child: Text('${items.catname}'),
                     );
                   }).toList(),
                   // After selecting the desired option,it will
                   // change button value to selected value
                   onChanged: (String? newValue) {
        
                     model.updatecat(newValue!);
        
                   },
                 ),
               ),
             ],
           ),
          ),
        SizedBox(height: 9.v),
        
          Padding(
            padding: EdgeInsets.only(
              left: 15.h,
              right: 16.h,
            ),
            child: TextFormField(
              validator: (value) {
                // Validation function for the name field
                if (value!.isEmpty) {
                  return 'Please enter title.'; // Return an error message if the name is empty
                }
                return null; // Return null if the name is valid
              },
              onTap: (){
                model.tochedddd();
              },
              decoration: InputDecoration(border: OutlineInputBorder(),
                hintText: "Add Title",
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 15.h,
                  vertical: 17.v,
                ),
              ),
              controller: model.titlecontroller,
        
            ),
          ),
        SizedBox(height: 11.v),
          Padding(
            padding: EdgeInsets.only(
              left: 15.h,
              right: 16.h,
            ),
            child: TextFormField(
              validator: (value) {
                // Validation function for the name field
                if (value!.isEmpty) {
                  return 'Please enter Description.'; // Return an error message if the name is empty
                }
                return null; // Return null if the name is valid
              },
              onTap: (){
                model.tochedddd();
              },
              decoration: InputDecoration(border: OutlineInputBorder(),
                hintText: "Description",
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 15.h,
                  vertical: 19.v,
                ),
              ),
              controller: model.discriptionctrler,
        
              textInputAction: TextInputAction.done,
              maxLines: 6,
        
            ),
          ),
        SizedBox(height:30.v),
          CustomElevatedButton(
            onPressed: (){
              model.addService();
            },
            width: 136.h,
            text: "Next",
            margin: EdgeInsets.only(right: 16.h),
            alignment: Alignment.centerRight,
          ),
        SizedBox(height: model.touched?250.v: 5.v),
        ],
        ),
      ),
    ),
    ),
    );
    });
  }







  /// Section Widget

}
class TakePic extends ViewModelWidget<AddServiceScreenViewModel> {
  TakePic({super.key});

  @override
  Widget build(BuildContext context, AddServiceScreenViewModel viewModel) {
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
          .child("service_thumbnail")
          .child("/serviceimg${_image}.jpg");
      UploadTask task = imagefile.putFile(_image!);
      TaskSnapshot snapshot = await task;
      url = await snapshot.ref.getDownloadURL();
      print("url::::${url.toString()}");
      viewModel.UpdateFie(url);

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