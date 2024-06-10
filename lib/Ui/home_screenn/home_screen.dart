

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tulipsadminapp/Ui/home_screenn/cat.dart';
import 'package:tulipsadminapp/Ui/home_screenn/home_view_model.dart';
import 'package:tulipsadminapp/app/image_constant.dart';
import 'package:tulipsadminapp/app/utils.dart';
import 'package:tulipsadminapp/theme/app_decoration.dart';
import 'package:tulipsadminapp/theme/custom_button_style.dart';
import 'package:tulipsadminapp/theme/theme_helper.dart';
import 'package:tulipsadminapp/widgets/custom_elevated_button.dart';
import 'package:tulipsadminapp/widgets/custom_image_view.dart';
import 'package:tulipsadminapp/widgets/custom_search_view.dart';

import '../../theme/custom_text_style.dart';
import 'widgets/home_item_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key})
      : super(
    key: key,
  );

  //Country selectedCountry = CountryPickerUtils.getCountryByPhoneCode('91');



  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeScreenViewModel>.reactive(

        viewModelBuilder: () => HomeScreenViewModel(),
        onViewModelReady: (model) {
          model.fetchDataFromFirebase();
          model.fetchDataFromFirebase2();
        },
        builder: (context, model, child) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: appTheme.gray100,
              resizeToAvoidBottomInset: false,
              body: SizedBox(
                width: double.maxFinite,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 130.v,
                        width: double.maxFinite,
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                height: 106.v,
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                  color: theme.colorScheme.primary,
                                ),
                              ),
                            ),
                            CustomImageView(
                              imagePath: ImageConstant.imgRectangle2,
                              height: 106.v,
                              width: 358.h,
                              alignment: Alignment.topCenter,
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: CustomSearchView(
                                width: 328.h,
                                controller: model.searchController,
                                hintText: "Search beauty services",
                                alignment: Alignment.bottomCenter,
                              ),
                            ),
                            Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                width: double.maxFinite,
                                margin: EdgeInsets.only(bottom: 98.v),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 17.h,
                                  vertical: 6.v,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CustomImageView(
                                      imagePath: ImageConstant.imgSettings,
                                      height: 8.v,
                                      width: 30.h,
                                      margin: EdgeInsets.symmetric(vertical: 4.v),
                                    ),
                                    Spacer(),
                                    CustomImageView(
                                      imagePath: ImageConstant.imgWifi,
                                      height: 18.adaptSize,
                                      width: 18.adaptSize,
                                    ),
                                    CustomImageView(
                                      imagePath: ImageConstant.imgFrame2109,
                                      height: 18.adaptSize,
                                      width: 18.adaptSize,
                                      margin: EdgeInsets.only(left: 3.h),
                                    ),
                                    CustomImageView(
                                      imagePath: ImageConstant.imgBattery,
                                      height: 18.adaptSize,
                                      width: 18.adaptSize,
                                      margin: EdgeInsets.only(left: 3.h),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30.v),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                top: 9.v,
                                bottom: 4.v,
                              ),
                              child: Text(
                                "Categories",
                                style: CustomTextStyles.titleMediumErrorContainer,
                              ),
                            ),
                            CustomElevatedButton(
                              height: 38.v,
                              width: 100.h,
                              text: "Add New",
                              onPressed: () {
                                model.addcat();
                              },
                              buttonStyle: CustomButtonStyles.fillOnPrimary,
                              buttonTextStyle: CustomTextStyles.labelLargeInterPrimary,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 48.v),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 27.h,
                          right: 36.h,
                        ),
                        child: model.catogorylist.length>0?GridView.builder(
                          shrinkWrap: true,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisExtent: 82.v,
                            crossAxisCount: 4,
                            mainAxisSpacing: 19.h,
                            crossAxisSpacing: 19.h,
                          ),
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: model.catogorylist.length,
                          itemBuilder: (context, index) {
                            return HomeItemWidget(category: model.catogorylist[index],);
                          },
                        ):Container(height: 100,
                          child: Center(child: Text("No Categories yet...."),),),
                      ),
                      SizedBox(height: 31.v),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                top: 7.v,
                                bottom: 6.v,
                              ),
                              child: Text(
                                "Services",
                                style: CustomTextStyles.titleMediumErrorContainer,
                              ),
                            ),
                            CustomElevatedButton(
                              height: 38.v,
                              width: 100.h,
                              text: "Add New",
                              onPressed: () {
                                model.addService();
                              },
                              buttonStyle: CustomButtonStyles.fillOnPrimary,
                              buttonTextStyle: CustomTextStyles.labelLargeInterPrimary,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 26.v),
                      model.servicelist.length>0?ListView.separated(itemCount: model.servicelist.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          ServiceModel s=model.servicelist[index];
                          return   Container(
                            margin: EdgeInsets.symmetric(horizontal: 16.h),
                            padding: EdgeInsets.all(3.h),
                            decoration: AppDecoration.outlineBlack9002.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder5,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                CustomImageView(
                                  imagePath: s.url,
                                  height: 69.v,
                                  width: 66.h,
                                  radius: BorderRadius.circular(
                                    2.h,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 7.h,
                                    top: 13.v,
                                    bottom: 13.v,
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${s.name}",
                                        style: theme.textTheme.titleMedium,
                                      ),
                                      _buildSixty(
                                          context,
                                          price: "₹${s.price}",
                                          price1: "₹${s.discountprice}"
                                      ),
                                    ],
                                  ),
                                ),
                                Spacer(),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: 23.v,
                                    right: 16.h,
                                    bottom: 21.v,
                                  ),
                                  child: Text(
                                    ">",
                                    style: theme.textTheme.titleMedium,
                                  ),
                                ),
                              ],
                            ),
                          );

                        }, separatorBuilder: (BuildContext context, int index) {
                          return Divider(height: 8.v,);
                        },):Container(height: 100,
                        child: Center(child: Text("No Items yet...."),),
                      ),

                    ],
                  ),
                ),
              ),
            ),
          );
        });}

}








/// Common widget
Widget _buildSixty(
    BuildContext context, {
      required String price,
      required String price1,
    }) {
  return Row(
    children: [
      Container(
        height: 20.v,
        margin: EdgeInsets.only(bottom: 2.v),
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "${price}",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.lineThrough,
                    color: Colors.black
                ),
              ),
              TextSpan(
                text: "  ${price1}",
                style: CustomTextStyles.titleMediumff444444,
              ),
            ],
          ),
          textAlign: TextAlign.left,
        ),
      ),

    ],
  );
}