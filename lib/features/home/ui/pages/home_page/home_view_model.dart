import 'package:every_watch/features/home/data/models/watch_listing_filter_model.dart';
import 'package:every_watch/features/home/ui/bloc/home_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewModel extends Cubit<HomeState> {
  HomeViewModel() : super(HomeInitial());

  void getWatchListing(
    BuildContext context,
    WatchListingFilterModel filter,
  ) {
    emit(HomeLoading());
    context.read<HomeBloc>().add(
          HomeGetWatchListing(filter: filter),
        );
  }

  void handleHomeState(HomeState state) {
    emit(state); // Forward AuthBloc state changes to UI
  }
}
