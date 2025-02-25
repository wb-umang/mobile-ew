import 'package:every_watch/core/navigation/bottom_nav_screen.dart';
import 'package:every_watch/features/auth/ui/auth_routes.dart';
import 'package:every_watch/features/splash/ui/splash_routes.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    routes: [
      ...splashRoutes, // Splash routes
      ...authRoutes, // Authentication routes

      GoRoute(
        path: '/home',
        builder: (context, state) => const BottomNavScreen(),
      ),
    ],
  );
}
