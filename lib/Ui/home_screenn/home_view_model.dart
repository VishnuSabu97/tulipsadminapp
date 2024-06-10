import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

import '../../app/app.router.dart';
import '../../app/utils.dart';
import 'cat.dart';


class HomeScreenViewModel extends BaseViewModel {
  List<Category> catogorylist = [];
  List<ServiceModel> servicelist = [];


  void fetchDataFromFirebase2() {
    DatabaseReference db_Ref = FirebaseDatabase.instance.ref().child('service');
    db_Ref.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot;
      Map P = data.value as Map<dynamic, dynamic>;
      print(P.toString());servicelist.clear;
      notifyListeners();
      servicelist.clear();
      servicelist = convertFirebaseResponseToServiceList(P);
      notifyListeners();
      print('service::::${servicelist.toString()}');
    });
  }
  List<ServiceModel> convertFirebaseResponseToServiceList(Map<dynamic, dynamic> firebaseResponse) {


    firebaseResponse.forEach((key, value) {
      String id = key.toString();
      print("key:$key");
      String name = value['name'];
      String url = value['url'];
      String price = value['price'];
      String discription = value['discription'];
      String category = value['category'];
      String discountpersent = value['discountpersent'];
      String idealfor = value['idealfor'];
      String discountprice = value['discountprice'];
      String Duration = value['Duration'];



      ServiceModel p = ServiceModel(id:id,url: url, name: name, discription: discription, category: category, price: price, discountpersent: discountpersent, discountprice: discountprice, idealfor: idealfor, Duration: Duration);
      servicelist.add(p);
      notifyListeners();

    });

    return servicelist;
  }

  TextEditingController searchController = TextEditingController();
  void addcat(){
    navigationService.navigateTo(Routes.addCatScreen);
  }
  void addService(){
    navigationService.navigateTo(Routes.addServiceScreen);
  }


  void fetchDataFromFirebase() {
    DatabaseReference db_Ref = FirebaseDatabase.instance.ref().child('category');
    db_Ref.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot;
      Map P = data.value as Map<dynamic, dynamic>;
      print(P.toString());catogorylist.clear;
      notifyListeners();
      catogorylist.clear();
      catogorylist = convertFirebaseResponseToPostList(P);
      notifyListeners();
      print('Categories::::${catogorylist.toString()}');
    });
  }
  List<Category> convertFirebaseResponseToPostList(Map<dynamic, dynamic> firebaseResponse) {


    firebaseResponse.forEach((key, value) {
      String id1 = key.toString();
      print("key:$key");
      String catname1 = value['catname'];
      String url1 = value['url'];




      Category p = Category(id:id1,catname:catname1,url:url1);
      catogorylist.add(p);
      notifyListeners();

    });

    return catogorylist;
  }
}