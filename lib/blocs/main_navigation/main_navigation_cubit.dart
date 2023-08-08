import 'package:bloc/bloc.dart';

class MainNavigationCubit extends Cubit<int> {
  MainNavigationCubit() : super(0);

  void changeIndex(int index) => emit(index);
}
