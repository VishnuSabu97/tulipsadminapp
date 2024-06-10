import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:tulipsadminapp/app/app.router.dart';

import '../../app/utils.dart';


class OnboardScreenViewModel extends BaseViewModel {

  TextEditingController phoneNumberController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  void nav(){
    navigationService.navigateTo(Routes.signInScreen);
  }
  }
