import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:test1/ui/login/login_viewmodel.dart';
import 'package:test1/utils/extensions.dart';
import 'package:test1/utils/image_constants.dart';
import 'package:test1/widgets/color_constants.dart';
import 'package:test1/widgets/custom_button.dart';
import 'package:test1/widgets/custom_textfield.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
        viewModelBuilder: () => LoginViewModel(),
        builder: (context, viewModel, child) {
          return Scaffold(
            backgroundColor: ColorConstants.backgroundColor,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    ImageConstants.logo,
                    width: 200,
                    height: 200,
                  ),
                  SizedBox(height: context.height * 0.05),
                  CustomTextField(
                    textEditingController: viewModel.emailController,
                    hintText: 'Email',
                    errorText: viewModel.emailError,
                  ),
                  SizedBox(height: context.height * 0.02),
                  CustomTextField(
                    textEditingController: viewModel.userNameController,
                    hintText: 'Username',
                    errorText: viewModel.userNameError,
                    obscureText: viewModel.obscureText,
                    suffixIcon: IconButton(
                        onPressed: () {
                          viewModel.obscureText = !viewModel.obscureText;
                          viewModel.notifyListeners();
                        },
                        icon: viewModel.obscureText
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility)),
                  ),
                  SizedBox(height: context.height * 0.02),
                  CustomButton(
                    buttonText: 'LOGIN',
                    onPressed: viewModel.login,
                  )
                ],
              ),
            ),
          );
        });
  }
}
