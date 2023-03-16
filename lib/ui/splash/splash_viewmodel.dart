import 'dart:async';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:test1/app/app.locator.dart';
import 'package:test1/app/app.router.dart';
import 'package:test1/services/storage_services.dart';

class SplashViewModel extends BaseViewModel {
  navigate() {
    Timer(const Duration(seconds: 3), () {
      String? userId = LocalStorageServices.getUserId();
      if (userId != null) {
        locator<NavigationService>().pushNamedAndRemoveUntil(Routes.homeView);
      } else {
        locator<NavigationService>().pushNamedAndRemoveUntil(Routes.loginView);
      }
    });
  }
}
