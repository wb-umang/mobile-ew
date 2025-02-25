import 'package:every_watch/core/di/init_dependencies.dart';
import 'package:every_watch/core/navigation/app_router.dart';
import 'package:every_watch/core/storage/secure_storage.dart';
import 'package:every_watch/core/utils/app_strings.dart';
import 'package:every_watch/features/auth/ui/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:provider/provider.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/internationalization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SecureStorage.init();
  // Load the environment variables from the .env file
  await dotenv.load(fileName: ".env");
  initDependencies();

  GoRouter.optionURLReflectsImperativeAPIs = true;
  usePathUrlStrategy();

  await FlutterFlowTheme.initialize();

  final appState = FFAppState(); // Initialize FFAppState
  await appState.initializePersistedState();

  // TODO: Remove this in future when we have a proper app state configuration
  runApp(ChangeNotifierProvider(
    create: (context) => appState,
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  ThemeMode _themeMode = FlutterFlowTheme.themeMode;

  late GoRouter _router;

  @override
  void initState() {
    super.initState();

    final appStateNotifier = AppStateNotifier.instance;
    _router = createRouter(appStateNotifier);
    safeSetState(() => appStateNotifier.stopShowingSplashImage());
  }

  void setLocale(String language) {
    safeSetState(() => _locale = createLocale(language));
  }

  void setThemeMode(ThemeMode mode) => safeSetState(() {
        _themeMode = mode;
        FlutterFlowTheme.saveThemeMode(mode);
      });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => serviceLocator<AuthBloc>(),
        child: MaterialApp.router(
          title: AppStrings.appName,
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            FFLocalizationsDelegate(),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          locale: _locale,
          supportedLocales: const [
            Locale('en'),
          ],
          theme: ThemeData(
            brightness: Brightness.light,
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
          ),
          themeMode: ThemeMode
              .light, // TODO: Remove this in future when we have a proper dark theme configuration
          routerConfig: AppRouter.router,
        ));
  }
}
