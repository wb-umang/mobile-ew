import 'dart:async';

import 'package:every_watch/core/storage/secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  Future<void> _navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 3)); // Simulate splash delay
    bool isLoggedIn = await SecureStorage.isLoggedIn();

    if (mounted) {
      if (isLoggedIn) {
        context.go('/home');
      } else {
        context.go('/welcome');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Image.asset(
        'assets/images/Splas_Screen.jpg',
        fit: BoxFit.fill,
      ),
    );
  }
}
