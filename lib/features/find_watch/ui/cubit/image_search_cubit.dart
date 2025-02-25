import 'package:flutter_bloc/flutter_bloc.dart';

import 'image_search_state.dart'; // Import the new state class

class ImageSearchCubit extends Cubit<ImageSearchState> {
  ImageSearchCubit() : super(ImageSearchState(flag: false, searchText: ""));

  void toggleFlag() {
    emit(state.copyWith(flag: !state.flag));
  }

  void setFlag(bool value) {
    emit(state.copyWith(flag: value));
  }

  void setSearchText(String text) {
    emit(state.copyWith(searchText: text));
  }
}
