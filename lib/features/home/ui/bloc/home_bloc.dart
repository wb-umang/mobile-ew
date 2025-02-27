import 'package:every_watch/features/home/data/models/watch_detail_model.dart';
import 'package:every_watch/features/home/data/models/watch_listing_filter_model.dart';
import 'package:every_watch/features/home/domain/usecases/watch_listing_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final WatchListingUsecase _watchListingUsecase;

  HomeBloc({
    required WatchListingUsecase watchListingUsecase,
  })  : _watchListingUsecase = watchListingUsecase,
        super(HomeInitial()) {
    on<HomeGetWatchListing>((event, emit) async {
      emit(HomeLoading());
      final res = await _watchListingUsecase(
        WatchListingParams(
          filter: event.filter,
        ),
      );

      res.fold((failure) {
        emit(HomeError(failure.message));
      }, (result) {
        emit(HomeSuccess(result));
      });
    });
  }
}
