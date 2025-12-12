import 'package:flutter_bloc/flutter_bloc.dart';

class HoverCubit extends Cubit<String> {
  HoverCubit() : super("");

  void setHover(String id) {
    emit(id);
  }
}
