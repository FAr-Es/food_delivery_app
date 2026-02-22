import 'package:flutter_bloc/flutter_bloc.dart';

class ViewCubit extends Cubit<bool> {  
  ViewCubit() : super(false);  

  void toggleView(bool isListSelected) {
    emit(isListSelected);  
  }
}