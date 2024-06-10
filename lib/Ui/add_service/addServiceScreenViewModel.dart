import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stacked/stacked.dart';

import '../../app/app.router.dart';
import '../../app/utils.dart';
import '../home_screenn/cat.dart';

class AddServiceScreenViewModel extends BaseViewModel{

  var url;
  bool touched=false;
  void tochedddd(){
    touched=true;notifyListeners();
  }
  String? defaultcat;
  void updatecat(String cat){
    defaultcat=cat;
    notifyListeners();
  }
  List<Category> catogorylist = [];
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
      if(catogorylist.isNotEmpty){
        defaultcat=catogorylist[0].catname;
        notifyListeners();
      }
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

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController titlecontroller = TextEditingController();

  TextEditingController discriptionctrler = TextEditingController();
  void addService(){
    if(formKey.currentState!.validate()) {
      if (url != null && defaultcat!.length > 0) {
        navigationService.navigateTo(Routes.addServiceOneScreen,
            arguments: AddServiceOneScreenArguments(url: url,
                name: titlecontroller.text,
                discription: discriptionctrler.text,
                category: defaultcat!));
      }
    }
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


  UpdateFile(var u)
  {
    print("updating file");
    _file=u;
    notifyListeners();
  }
  UpdateFie(var u)
  {print("updating url");

  url=u;
  notifyListeners();
  }
}