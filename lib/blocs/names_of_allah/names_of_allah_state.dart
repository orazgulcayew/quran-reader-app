part of 'names_of_allah_bloc.dart';

abstract class NamesOfAllahState extends Equatable {
  final List<Name> names;
  const NamesOfAllahState({required this.names});

  @override
  List<Object> get props => [];
}

class NamesLoading extends NamesOfAllahState {
  NamesLoading() : super(names: []);
}

class NamesLoadingDone extends NamesOfAllahState {
  const NamesLoadingDone({required super.names});

  @override
  List<Object> get props => [names];
}
