import 'dart:io';

import 'package:every_watch/features/followed/ui/pages/followed_page.dart';
import 'package:every_watch/features/home/ui/pages/home_page.dart';
import 'package:every_watch/features/profile/ui/pages/profile_page.dart';
import 'package:every_watch/flutter_flow/flutter_flow_theme.dart';
import 'package:every_watch/flutter_flow/flutter_flow_util.dart';
import 'package:every_watch/pages/main_page/custom_camera_screen.dart';
import 'package:flutter/material.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  final List<Widget> _pages = [
    const HomePage(),
    const FollowedPage(),
    const Center(
      child: Text('Find Watch'),
    ),
    const ProfilePage(),
  ];

  @override
  void initState() {
    super.initState();

    _tabController = TabController(
      vsync: this,
      length: 4,
      initialIndex: 0,
    );

    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    if (_tabController.index == 2) {
      _tabController.index = 0; // Prevent switching

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CustomCameraScreen(
            onSearch: (context, base64Image) => _searchImage(),
          ),
        ),
      );
    }
  }

  void _searchImage() {}

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
            bottom:
                Platform.isAndroid ? MediaQuery.of(context).padding.bottom : 8),
        child: TabBar(
          indicatorColor: FlutterFlowTheme.of(context).secondaryBackground,
          labelColor: FlutterFlowTheme.of(context).primary,
          unselectedLabelColor: FlutterFlowTheme.of(context).alternate,
          dividerColor: FlutterFlowTheme.of(context).secondaryBackground,
          labelStyle: FlutterFlowTheme.of(context).titleMedium.override(
                fontFamily: 'DM Sans',
                fontSize: 12.0,
                letterSpacing: 0.0,
                lineHeight: 1.33,
              ),
          tabs: [
            Tab(
              text: 'Home',
              icon: Icon(
                FFIcons.khome,
                size: 24.0,
              ),
            ),
            Tab(
              text: 'Followed',
              icon: Icon(
                Icons.favorite_border,
                size: 24.0,
              ),
            ),
            Tab(
              text: 'Find Watch',
              iconMargin: EdgeInsets.only(bottom: 6),
              icon: Icon(
                FFIcons.ksearch,
                size: 20,
              ),
            ),
            Tab(
              text: 'Profile',
              icon: Icon(
                FFIcons.kprofile,
                size: 24.0,
              ),
            ),
          ],
          controller: _tabController,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _tabController,
              children: _pages,
            ),
          ),
        ],
      ),
    );
  }
}
