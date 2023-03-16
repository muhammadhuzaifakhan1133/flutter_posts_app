import 'package:test1/utils/exports.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewModel>.nonReactive(
        viewModelBuilder: () => SplashViewModel(),
        onViewModelReady: (viewModel) {
          viewModel.navigate();
        },
        builder: (context, viewModel, child) {
          return Scaffold(
            backgroundColor: ColorConstants.backgroundColor,
            body: Center(
              child: Image.asset(ImageConstants.logo),
            ),
          );
        });
  }
}
