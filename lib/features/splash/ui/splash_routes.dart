import 'package:go_router/go_router.dart';

import 'pages/splash_page.dart';

final splashRoutes = [
  GoRoute(
    name: 'SplashPage',
    path: '/',
    builder: (context, state) => const SplashPage(),
  ),
];
