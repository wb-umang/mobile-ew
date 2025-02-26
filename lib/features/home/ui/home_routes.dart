import 'package:every_watch/features/home/ui/pages/watch_detail_page/watch_detail_page.dart';
import 'package:go_router/go_router.dart';

final homeRoutes = [
  GoRoute(
    name: 'WatchDetailPage',
    path: '/watch-detail',
    builder: (context, state) => const WatchDetailPage(),
  ),
];
