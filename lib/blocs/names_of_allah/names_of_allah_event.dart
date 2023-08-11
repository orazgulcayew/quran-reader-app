part of 'names_of_allah_bloc.dart';

abstract class NamesOfAllahEvent extends Equatable {
  const NamesOfAllahEvent();

  @override
  List<Object> get props => [];
}

class LoadNamesEvent extends NamesOfAllahEvent {}

class SearchNameEvent extends NamesOfAllahEvent {
  final String searchValue;

  const SearchNameEvent({required this.searchValue});

  @override
  List<Object> get props => [searchValue];
}
