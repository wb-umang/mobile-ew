part of 'home_bloc.dart';

sealed class HomeState {
  const HomeState();
}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeSuccess extends HomeState {
  final List<WatchDetailModel> watchListings;

  const HomeSuccess(this.watchListings);
}

final class HomeError extends HomeState {
  final String message;

  const HomeError(this.message);
}
