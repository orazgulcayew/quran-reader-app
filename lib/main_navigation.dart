import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:quran_reader_app/blocs/main_navigation/main_navigation_cubit.dart';
import 'package:quran_reader_app/core/widgets/custom_appbar.dart';
import 'package:quran_reader_app/injection_container.dart';
import 'package:quran_reader_app/pages/favorites/favorites_page.dart';
import 'package:quran_reader_app/pages/home/home_page.dart';
import 'package:quran_reader_app/pages/read_quran/read_quran_page.dart';
import 'package:quran_reader_app/pages/settings/settings_page.dart';

import 'core/utils/custom_font_icon.dart';

class MainNavigation extends StatelessWidget {
  const MainNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final MainNavigationCubit mainNavigationCubit = sl<MainNavigationCubit>();
    const List<Widget> screens = [
      HomePage(),
      ReadQuranPage(),
      FavoritesPage(),
      SettingsPage()
    ];

    return BlocBuilder<MainNavigationCubit, int>(
        builder: (context, selectedIndex) {
      final theme = Theme.of(context).colorScheme;
      return Scaffold(
        appBar: CustomAppBar(
          title: getTitle(selectedIndex),
          hasParent: false,
        ),
        body: SafeArea(
            child: IndexedStack(index: selectedIndex, children: screens)),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedIndex,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              mainNavigationCubit.changeIndex(index);
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Iconsax.home_2), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Quran.quran), label: 'Quran'),
              BottomNavigationBarItem(
                  icon: Icon(Iconsax.heart), label: 'Favorites'),
              BottomNavigationBarItem(
                  icon: Icon(Iconsax.setting), label: 'Settings'),
            ]),
      );
    });
  }

  String getTitle(int selectedIndex) {
    switch (selectedIndex) {
      case 0:
        return "Home";
      case 1:
        return "Quran";
      case 2:
        return "Favorites";
      case 3:
        return "Settings";
      default:
        return "";
    }
  }
}
