// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i9;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i10;
import 'package:tulipsadminapp/Ui/add_service/add_service_screen.dart' as _i6;
import 'package:tulipsadminapp/Ui/add_service_one_s/add_service_one_screen.dart'
    as _i7;
import 'package:tulipsadminapp/Ui/addcat/add_cat_screen.dart' as _i8;
import 'package:tulipsadminapp/Ui/home_screenn/home_screen.dart' as _i5;
import 'package:tulipsadminapp/Ui/onboard/onboard_screen.dart' as _i3;
import 'package:tulipsadminapp/Ui/sign_in/sign_in_screen.dart' as _i4;
import 'package:tulipsadminapp/Ui/Splash/splash_view.dart' as _i2;

class Routes {
  static const splashView = '/';

  static const onboardScreen = '/onboard-screen';

  static const signInScreen = '/sign-in-screen';

  static const homeScreen = '/home-screen';

  static const addServiceScreen = '/add-service-screen';

  static const addServiceOneScreen = '/add-service-one-screen';

  static const addCatScreen = '/add-cat-screen';

  static const all = <String>{
    splashView,
    onboardScreen,
    signInScreen,
    homeScreen,
    addServiceScreen,
    addServiceOneScreen,
    addCatScreen,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.splashView,
      page: _i2.SplashView,
    ),
    _i1.RouteDef(
      Routes.onboardScreen,
      page: _i3.OnboardScreen,
    ),
    _i1.RouteDef(
      Routes.signInScreen,
      page: _i4.SignInScreen,
    ),
    _i1.RouteDef(
      Routes.homeScreen,
      page: _i5.HomeScreen,
    ),
    _i1.RouteDef(
      Routes.addServiceScreen,
      page: _i6.AddServiceScreen,
    ),
    _i1.RouteDef(
      Routes.addServiceOneScreen,
      page: _i7.AddServiceOneScreen,
    ),
    _i1.RouteDef(
      Routes.addCatScreen,
      page: _i8.AddCatScreen,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.SplashView: (data) {
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.SplashView(),
        settings: data,
      );
    },
    _i3.OnboardScreen: (data) {
      final args = data.getArgs<OnboardScreenArguments>(
        orElse: () => const OnboardScreenArguments(),
      );
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => _i3.OnboardScreen(key: args.key),
        settings: data,
      );
    },
    _i4.SignInScreen: (data) {
      final args = data.getArgs<SignInScreenArguments>(
        orElse: () => const SignInScreenArguments(),
      );
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => _i4.SignInScreen(key: args.key),
        settings: data,
      );
    },
    _i5.HomeScreen: (data) {
      final args = data.getArgs<HomeScreenArguments>(
        orElse: () => const HomeScreenArguments(),
      );
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => _i5.HomeScreen(key: args.key),
        settings: data,
      );
    },
    _i6.AddServiceScreen: (data) {
      final args = data.getArgs<AddServiceScreenArguments>(
        orElse: () => const AddServiceScreenArguments(),
      );
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => _i6.AddServiceScreen(key: args.key),
        settings: data,
      );
    },
    _i7.AddServiceOneScreen: (data) {
      final args = data.getArgs<AddServiceOneScreenArguments>(nullOk: false);
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => _i7.AddServiceOneScreen(
            key: args.key,
            url: args.url,
            name: args.name,
            discription: args.discription,
            category: args.category),
        settings: data,
      );
    },
    _i8.AddCatScreen: (data) {
      final args = data.getArgs<AddCatScreenArguments>(
        orElse: () => const AddCatScreenArguments(),
      );
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => _i8.AddCatScreen(key: args.key),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class OnboardScreenArguments {
  const OnboardScreenArguments({this.key});

  final _i9.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant OnboardScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class SignInScreenArguments {
  const SignInScreenArguments({this.key});

  final _i9.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant SignInScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class HomeScreenArguments {
  const HomeScreenArguments({this.key});

  final _i9.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant HomeScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class AddServiceScreenArguments {
  const AddServiceScreenArguments({this.key});

  final _i9.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant AddServiceScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class AddServiceOneScreenArguments {
  const AddServiceOneScreenArguments({
    this.key,
    required this.url,
    required this.name,
    required this.discription,
    required this.category,
  });

  final _i9.Key? key;

  final String url;

  final String name;

  final String discription;

  final String category;

  @override
  String toString() {
    return '{"key": "$key", "url": "$url", "name": "$name", "discription": "$discription", "category": "$category"}';
  }

  @override
  bool operator ==(covariant AddServiceOneScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.url == url &&
        other.name == name &&
        other.discription == discription &&
        other.category == category;
  }

  @override
  int get hashCode {
    return key.hashCode ^
        url.hashCode ^
        name.hashCode ^
        discription.hashCode ^
        category.hashCode;
  }
}

class AddCatScreenArguments {
  const AddCatScreenArguments({this.key});

  final _i9.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant AddCatScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

extension NavigatorStateExtension on _i10.NavigationService {
  Future<dynamic> navigateToSplashView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.splashView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToOnboardScreen({
    _i9.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.onboardScreen,
        arguments: OnboardScreenArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSignInScreen({
    _i9.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.signInScreen,
        arguments: SignInScreenArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToHomeScreen({
    _i9.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.homeScreen,
        arguments: HomeScreenArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAddServiceScreen({
    _i9.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.addServiceScreen,
        arguments: AddServiceScreenArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAddServiceOneScreen({
    _i9.Key? key,
    required String url,
    required String name,
    required String discription,
    required String category,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.addServiceOneScreen,
        arguments: AddServiceOneScreenArguments(
            key: key,
            url: url,
            name: name,
            discription: discription,
            category: category),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAddCatScreen({
    _i9.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.addCatScreen,
        arguments: AddCatScreenArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSplashView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.splashView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithOnboardScreen({
    _i9.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.onboardScreen,
        arguments: OnboardScreenArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSignInScreen({
    _i9.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.signInScreen,
        arguments: SignInScreenArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeScreen({
    _i9.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.homeScreen,
        arguments: HomeScreenArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAddServiceScreen({
    _i9.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.addServiceScreen,
        arguments: AddServiceScreenArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAddServiceOneScreen({
    _i9.Key? key,
    required String url,
    required String name,
    required String discription,
    required String category,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.addServiceOneScreen,
        arguments: AddServiceOneScreenArguments(
            key: key,
            url: url,
            name: name,
            discription: discription,
            category: category),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAddCatScreen({
    _i9.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.addCatScreen,
        arguments: AddCatScreenArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
