part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {
  final bool isScreenInitializing;

  const HomeEvent({this.isScreenInitializing = false});
}

final class HomeGetWatchListing extends HomeEvent {
  final WatchListingFilterModel filter;

  const HomeGetWatchListing(
      {required this.filter, required super.isScreenInitializing});
}
