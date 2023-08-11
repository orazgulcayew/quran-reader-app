import 'package:get_it/get_it.dart';
import 'package:quran_reader_app/blocs/main_navigation/main_navigation_cubit.dart';
import 'package:quran_reader_app/blocs/names_of_allah/names_of_allah_bloc.dart';
import 'package:quran_reader_app/blocs/settings/settings_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Cache
  final prefs = await SharedPreferences.getInstance();

  // Cubit
  sl.registerLazySingleton<MainNavigationCubit>(() => MainNavigationCubit());

  // Blocs
  sl.registerLazySingleton<SettingsBloc>(() => SettingsBloc(prefs));

  sl.registerFactory<NamesOfAllahBloc>(() => NamesOfAllahBloc(allNames: []));
}
