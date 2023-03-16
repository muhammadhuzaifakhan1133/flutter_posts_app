import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:test1/models/user_model.dart';
import 'package:test1/ui/filter_post/filter_posts_view.dart';
import 'package:test1/ui/home/home_view.dart';
import 'package:test1/ui/login/login_view.dart';
import 'package:test1/ui/splash/splash_view.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: SplashView, initial: true),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: HomeView),
    MaterialRoute(page: FilterPostsView),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: UserModel),
  ],
)
class App {}
