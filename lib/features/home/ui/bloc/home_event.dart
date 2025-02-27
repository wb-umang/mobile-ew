part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

final class HomeGetWatchListing extends HomeEvent {
  final WatchListingFilterModel filter;

  HomeGetWatchListing({required this.filter});
}
