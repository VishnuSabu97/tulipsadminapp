

//import 'package:tulips_admin/Ui/app_nav/app_navigation_screen.dart';



import 'package:stacked/stacked_annotations.dart';

//import 'package:tulips_admin/webservice/apiservice.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tulipsadminapp/Ui/Splash/splash_view.dart';

import '../Ui/add_service/add_service_screen.dart';
import '../Ui/add_service_one_s/add_service_one_screen.dart';
//import '../Ui/add_service_success/add_service_success_screen.dart';
import '../Ui/addcat/add_cat_screen.dart';
import '../Ui/home_screenn/home_screen.dart';
import '../Ui/onboard/onboard_screen.dart';
import '../Ui/sign_in/sign_in_screen.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: SplashView, initial: true),
    MaterialRoute(page: OnboardScreen),
//MaterialRoute(page: AppNavigationScreen),
MaterialRoute(page: SignInScreen),
MaterialRoute(page: HomeScreen),
//MaterialRoute(page: AddServiceSuccessScreen),
MaterialRoute(page: AddServiceScreen),
MaterialRoute(page: AddServiceOneScreen),
MaterialRoute(page: AddCatScreen)



  ],
  dependencies: [
    //LazySingleton(classType: ApiService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: BottomSheetService),


  ],
)
class AppSetup {}
