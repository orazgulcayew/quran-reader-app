import 'package:get_it/get_it.dart';
import 'package:quran_reader_app/blocs/main_navigation/main_navigation_cubit.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  //Blocs
  sl.registerLazySingleton<MainNavigationCubit>(() => MainNavigationCubit());
}
