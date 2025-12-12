import 'package:flutter_bloc/flutter_bloc.dart';

class ScrollCubit extends Cubit<bool> {
  ScrollCubit() : super(true);

  void setScrollDirection({required bool isScrollingUp}) {
    emit(isScrollingUp);
  }
}
