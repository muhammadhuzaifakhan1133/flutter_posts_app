import 'package:stacked_services/stacked_services.dart';
import 'package:test1/app/app.locator.dart';

class Dialogs {
  static errorDialog({required String message}) {
    locator<DialogService>().showDialog(
      title: "Error",
      description: message,
    );
  }

  static loadingDialog() {
    locator<DialogService>().showDialog(
      title: "Loading",
      description: "Please wait...",
    );
  }

  static closeDialog() {
    locator<NavigationService>().back();
  }
}
