import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:quran_reader_app/blocs/main_navigation/main_navigation_cubit.dart';
import 'package:quran_reader_app/config/theme/theme.dart';
import 'package:quran_reader_app/core/constants/constants.dart';
import 'package:quran_reader_app/injection_container.dart';
import 'package:quran_reader_app/pages/favorites/favorites_page.dart';
import 'package:quran_reader_app/pages/home/home_page.dart';
import 'package:quran_reader_app/pages/read_quran/read_quran_page.dart';
import 'package:quran_reader_app/pages/settings/settings_page.dart';

class MainNavigation extends StatelessWidget {
  const MainNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final MainNavigationCubit mainNavigationCubit = sl();
    const List<Widget> screens = [
      HomePage(),
      ReadQuranPage(),
      FavoritesPage(),
      SettingsPage()
    ];

    return BlocBuilder<MainNavigationCubit, int>(
        builder: (context, selectedIndex) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
        ),
        body: SafeArea(
            child: IndexedStack(index: selectedIndex, children: screens)),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedIndex,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              mainNavigationCubit.changeIndex(index);
            },
            items: [
              const BottomNavigationBarItem(
                  icon: Icon(Iconsax.home_2), label: 'Home'),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    quran,
                    height: 24,
                    color: selectedIndex == 1
                        ? AppTheme.primaryColor2
                        : AppTheme.neutralDarkColor.withOpacity(0.7),
                  ),
                  label: 'Quran'),
              const BottomNavigationBarItem(
                  icon: Icon(Iconsax.heart), label: 'Favorites'),
              const BottomNavigationBarItem(
                  icon: Icon(Iconsax.setting), label: 'Settings'),
            ]),
      );
    });
  }
}
