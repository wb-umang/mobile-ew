import 'package:every_watch/features/home/ui/bloc/home_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewModel extends Cubit<HomeState> {
  HomeViewModel() : super(HomeInitial());

  void sampleMethod(BuildContext context) {}

  void handleHomeState(HomeState state) {
    emit(state); // Forward AuthBloc state changes to UI
  }
}
