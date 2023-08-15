import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';

import '../../data/models/names.dart';

part 'names_of_allah_event.dart';
part 'names_of_allah_state.dart';

class NamesOfAllahBloc extends Bloc<NamesOfAllahEvent, NamesOfAllahState> {
  final List<Name> allNames;

  NamesOfAllahBloc({required this.allNames}) : super(NamesLoading()) {
    on<LoadNamesEvent>(onLoadNames);

    on<SearchNameEvent>(onSearch);
  }

  void onLoadNames(
      LoadNamesEvent event, Emitter<NamesOfAllahState> emit) async {
    if (state is NamesLoading) {
      final localJson =
          await rootBundle.loadString("assets/data/allah_names.json");

      final decodedJson = jsonDecode(localJson);

      for (var name in decodedJson) {
        allNames.add(Name.fromJson(name));
      }

      emit(NamesLoadingDone(names: allNames));
    }
  }

  void onSearch(SearchNameEvent event, Emitter<NamesOfAllahState> emit) {
    if (state is NamesLoadingDone) {
      List<Name> tempList = [];

      if (event.searchValue.isNotEmpty) {
        for (var name in allNames) {
          if (name.enName.toLowerCase().contains(event.searchValue)) {
            tempList.add(name);
          }
        }
      } else {
        tempList = allNames;
      }
      emit(NamesLoadingDone(names: tempList));
    }
  }
}
