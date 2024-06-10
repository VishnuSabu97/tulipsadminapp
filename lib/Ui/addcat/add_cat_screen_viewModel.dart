import 'dart:core';
import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/app.router.dart';
import '../../app/utils.dart';

class AddCatScreenViewModel extends BaseViewModel{
  TextEditingController inputDefaultController = TextEditingController();
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


  File? _file;
  File? get file => _file;

  Future<File> getImageFileFromAsset(String assetPath) async {
    // Get the temporary directory path
    final directory = await getTemporaryDirectory();
    // Create a new file in the temporary directory
    final file = File('${directory.path}/${assetPath.split('/').last}');

    // Check if the file already exists, if not, copy the asset image to the file
    if (!file.existsSync()) {
      final data = await rootBundle.load(assetPath);
      final bytes = data.buffer.asUint8List();
      await file.writeAsBytes(bytes, flush: true);
    }

    return file;
  }


  var url;
  UpdateFile(var u)
  {
    print("updating file");
    _file=u;
    notifyListeners();
  }


  Updateurl(var u)
  {print("updating url");

  url=u;
  notifyListeners();
  }


  uploadFile(String catname,var url) async {
    DatabaseReference dbRef = FirebaseDatabase.instance.ref().child('category');
    toggleProgress() ;
    print("toggle changed");

    print("dialogue ");
    try {
      print("try ::::::::");    print("url ::::::::${url}");

      if (url != null) {
        print("enteringtry ::::::::");
        Map<String, dynamic> category = {
          'catname': catname,
          'url': url,
        };
        print("try to push::::::::${category.toString()}");
        dbRef!.push().set(category).whenComplete(() {
          toggleProgress() ;
          //code to navigate to login page
          navigationService.pushNamedAndRemoveUntil(Routes.homeScreen);
        });
      }
    } on Exception catch (e) {
      print(e.toString());
    }
  }

}