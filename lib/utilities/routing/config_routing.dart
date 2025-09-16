import 'package:advanced_ecommerce/utilities/routing/app_routs.dart';
import 'package:advanced_ecommerce/views/pages/auth_screen.dart';
import 'package:advanced_ecommerce/views/pages/nav_bar_screen.dart';
import 'package:go_router/go_router.dart';

class ConfigRouting {
  static final GoRouter goRouter = GoRouter(
    initialLocation: AppRouts.auth,
    routes: [
      GoRoute(
        path: AppRouts.auth,
        name: AppRouts.auth,
        builder: (context, state) => AuthScreen(),
      ),
      GoRoute(
        path: AppRouts.navBar,
        name: AppRouts.navBar,
        builder: (context, state) => NavBarScreen(),
      ),
    ],
  );
}
