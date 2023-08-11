import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:quran_reader_app/blocs/names_of_allah/names_of_allah_bloc.dart';
import 'package:quran_reader_app/core/widgets/custom_appbar.dart';

import '../../core/widgets/name_card.dart';
import '../../injection_container.dart';

class NamesOfAllahPage extends StatelessWidget {
  const NamesOfAllahPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NamesOfAllahBloc>(
      create: (context) => sl<NamesOfAllahBloc>()..add(LoadNamesEvent()),
      child: Scaffold(
        appBar: const CustomAppBar(
          title: "Names of Allah",
        ),
        body: BlocBuilder<NamesOfAllahBloc, NamesOfAllahState>(
            builder: (context, state) {
          if (state is NamesLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is NamesLoadingDone) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 12, bottom: 12),
                  child: TextField(
                    decoration: const InputDecoration(
                        hintText: 'Search...',
                        suffixIcon: Icon(EvaIcons.search)),
                    onChanged: (value) {
                      BlocProvider.of<NamesOfAllahBloc>(context).add(
                        SearchNameEvent(searchValue: value),
                      );
                    },
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.names.length,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: NameCard(name: state.names[index]),
                      );
                    },
                  ),
                ),
              ],
            );
          }

          return const SizedBox();
        }),
      ),
    );
  }
}
