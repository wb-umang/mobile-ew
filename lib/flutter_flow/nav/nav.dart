import 'dart:async';

import 'package:every_watch/core/storage/secure_storage.dart';
import 'package:every_watch/features/auth/ui/pages/login_page/login_page.dart';
import 'package:every_watch/features/auth/ui/pages/signup_page/signup_page.dart';
import 'package:every_watch/features/auth/ui/pages/welcome_page/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/backend/schema/structs/index.dart';

import '/index.dart';
import '/flutter_flow/flutter_flow_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();
  static AppStateNotifier? _instance;

  bool _showSplashImage = true;
  bool get showSplashImage => _showSplashImage;

  void stopShowingSplashImage() {
    Future.delayed(const Duration(milliseconds: 1000), () {
      _showSplashImage = false;
      notifyListeners();
    });
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      redirect: (context, state) async {
        bool isLoggedIn = await SecureStorage.isLoggedIn();
        // Show Splash Screen first
        if (appStateNotifier.showSplashImage) {
          return '/';
        } else {
          if (isLoggedIn) {
            return state.fullPath == '/' ? '/mainPage' : state.fullPath;
          } else {
            return state.fullPath == '/' ? '/welcomePage' : state.fullPath;
          }
        }
      },
      errorBuilder: (context, state) => Container(
        color: Colors.transparent,
        child: Image.asset(
          'assets/images/Splas_Screen.jpg',
          fit: BoxFit.fill,
        ),
      ),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => Container(
            color: Colors.transparent,
            child: Image.asset(
              'assets/images/Splas_Screen.jpg',
              fit: BoxFit.fill,
            ),
          ),
        ),
        FFRoute(
          name: 'WelcomePage',
          path: '/welcomePage',
          builder: (context, params) => const WelcomePage(),
        ),
        FFRoute(
          name: 'LoginPage',
          path: '/loginPage',
          builder: (context, params) => const LoginPage(),
        ),
        FFRoute(
          name: 'RegisterPage',
          path: '/registerPage',
          builder: (context, params) => const SignupPage(),
        ),
        FFRoute(
          name: 'ForgotPasswordPage',
          path: '/forgotPasswordPage',
          builder: (context, params) => const ForgotPasswordPageWidget(),
        ),
        FFRoute(
          name: 'VerifyCodePage',
          path: '/verifyCodePage',
          builder: (context, params) => VerifyCodePageWidget(
            email: params.getParam(
              'email',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'CreateNewPasswordPage',
          path: '/createNewPasswordPage',
          builder: (context, params) => const CreateNewPasswordPageWidget(),
        ),
        FFRoute(
          name: 'MainPage',
          path: '/mainPage',
          builder: (context, params) => const MainPageWidget(),
        ),
        FFRoute(
          name: 'WatchPage',
          path: '/watchPage',
          builder: (context, params) => const WatchPageWidget(),
        ),
        FFRoute(
          name: 'SettingsPage',
          path: '/settingsPage',
          builder: (context, params) => const SettingsPageWidget(),
        ),
        FFRoute(
          name: 'ChangePasswordPage',
          path: '/changePasswordPage',
          builder: (context, params) => const ChangePasswordPageWidget(),
        ),
        FFRoute(
          name: 'ChangeNamePage',
          path: '/changeNamePage',
          builder: (context, params) => ChangeNamePageWidget(
            title: params.getParam(
              'title',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'RolePage',
          path: '/rolePage',
          builder: (context, params) => RolePageWidget(
            initialOption: params.getParam(
              'initialOption',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'LookingForPage',
          path: '/lookingForPage',
          builder: (context, params) => LookingForPageWidget(
            initialOption: params.getParam(
              'initialOption',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'InfoPage',
          path: '/infoPage',
          builder: (context, params) => const InfoPageWidget(),
        ),
        FFRoute(
          name: 'CurrencyPage',
          path: '/currencyPage',
          builder: (context, params) => CurrencyPageWidget(
            initialOption: params.getParam(
              'initialOption',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'ReferralPage',
          path: '/referralPage',
          builder: (context, params) => ReferralPageWidget(
            initialOption: params.getParam(
              'initialOption',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'NotificationsPage',
          path: '/notificationsPage',
          builder: (context, params) => const NotificationsPageWidget(),
        ),
        FFRoute(
          name: 'PushSettingsPage',
          path: '/pushSettingsPage',
          builder: (context, params) => const PushSettingsPageWidget(),
        ),
        FFRoute(
          name: 'EmailSettingsPage',
          path: '/emailSettingsPage',
          builder: (context, params) => const EmailSettingsPageWidget(),
        ),
        FFRoute(
          name: 'FiltersPage',
          path: '/filtersPage',
          builder: (context, params) => const FiltersPageWidget(),
        ),
        FFRoute(
          name: 'AllFiltersPage',
          path: '/allFiltersPage',
          builder: (context, params) => AllFiltersPageWidget(
            title: params.getParam(
              'title',
              ParamType.String,
            ),
            keyName: params.getParam(
              'keyName',
              ParamType.String,
            ),
          ),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() =>
      const TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
