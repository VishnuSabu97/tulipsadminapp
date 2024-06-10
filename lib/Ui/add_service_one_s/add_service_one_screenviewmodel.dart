import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tulipsadminapp/app/app.router.dart';
import 'package:tulipsadminapp/app/utils.dart';

class AddServiceOneScreenViewModel extends BaseViewModel{
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController priceController = TextEditingController();

  TextEditingController discountpercentctrlr = TextEditingController();
  TextEditingController dispricectrlr = TextEditingController();
  TextEditingController durationctrlr = TextEditingController();
  TextEditingController idealctrlr = TextEditingController();
  String url="",name="",discription="",category="";

  void update( String url,String name,String discription,String category){
    this.url=url;
    this.name=name;
    this.discription=discription;
   this.category=category;
   notifyListeners();

  }
  bool _isBusy=false;
  void toggleProgress() {
    _isBusy = !_isBusy;
    notifyListeners();
  }

  final DialogService _dialogService = DialogService();

  Future<void> showDialogue() async {
    setBusy(_isBusy); // Set the ViewModel as busy

    await _dialogService.showDialog(
      title: 'Uploading',
      description: 'please wait...',
    );

    setBusy(_isBusy); // Set the ViewModel as not busy
  }

  uploadFile() async {
    DatabaseReference dbRef = FirebaseDatabase.instance.ref().child('service');
    toggleProgress() ;
    print("toggle changed");

    print("dialogue ");
    try {
      print("try ::::::::");    print("url ::::::::${url}");

      if (url != null) {
        print("enteringtry ::::::::");
        Map<String, dynamic> service = {

          'name': name,
          'url': url,
          'price':priceController.text,
          'discription': discription,
          'category': category,
          'discountpersent': discountpercentctrlr.text,
          'idealfor': idealctrlr.text,
          'discountprice': dispricectrlr.text,
          'Duration': dispricectrlr.text,
        };
        print("try to push::::::::${service.toString()}");
        dbRef!.push().set(service).whenComplete(() {
          toggleProgress() ;
          navigationService.pushNamedAndRemoveUntil(Routes.homeScreen);
          //code to navigate to login page
          //  navigationService.pushNamedAndRemoveUntil(Routes.dashBoardView);
        });
      }
    } on Exception catch (e) {
      print(e.toString());
    }
  }
void navsuccess(){
    if(formKey.currentState!.validate()) {
      uploadFile();

    }
}
}