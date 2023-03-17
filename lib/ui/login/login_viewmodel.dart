import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:test1/app/app.locator.dart';
import 'package:test1/app/app.router.dart';
import 'package:test1/models/user_model.dart';
import 'package:test1/services/auth_services.dart';
import 'package:test1/services/storage_services.dart';
import 'package:test1/utils/dialogs.dart';

class LoginViewModel extends BaseViewModel {
  TextEditingController emailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  String? emailError;
  String? userNameError;
  bool obscureText = true;

  login() async {
    if (!validateFields()) {
      return;
    }
    Dialogs.loadingDialog();
    UserModel? user = await AuthServices.login(
        email: emailController.text, username: userNameController.text);
    Dialogs.closeDialog();
    if (user != null) {
      LocalStorageServices.saveUserId(user.id.toString());
      locator<NavigationService>().pushNamedAndRemoveUntil(Routes.homeView);
    } else {
      Dialogs.errorDialog(message: "Invalid Credentials");
    }
  }

  resetError() {
    emailError = null;
    userNameError = null;
  }

  validateFields() {
    resetError();
    bool isValidate = true;
    if (emailController.text.isEmpty) {
      emailError = "Email is required";
      isValidate = false;
    }
    if (userNameController.text.isEmpty) {
      userNameError = "Username is required";
      isValidate = false;
    }
    notifyListeners();
    return isValidate;
  }
}
