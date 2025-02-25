import 'package:every_watch/features/auth/ui/pages/login_page/login_page.dart';
import 'package:every_watch/features/auth/ui/pages/signup_page/signup_page.dart';
import 'package:every_watch/features/auth/ui/pages/welcome_page/welcome_page.dart';
import 'package:go_router/go_router.dart';

final authRoutes = [
  GoRoute(
    name: 'WelcomePage',
    path: '/welcome',
    builder: (context, state) => const WelcomePage(),
  ),
  GoRoute(
    name: 'LoginPage',
    path: '/login',
    builder: (context, state) => const LoginPage(),
  ),
  GoRoute(
    name: 'SignupPage',
    path: '/signup',
    builder: (context, state) => const SignupPage(),
  ),
];
