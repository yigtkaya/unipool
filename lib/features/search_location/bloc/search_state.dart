part of 'search_location_bloc.dart';

final class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object?> get props => [];
}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchSuccess extends SearchState {
  final bool fromFocused;
  final List<GeoapifyPlace> geoapifyPlaces;

  const SearchSuccess({required this.geoapifyPlaces, required this.fromFocused});

  @override
  List<Object?> get props => [geoapifyPlaces, fromFocused];
}

final class SearchFailure extends SearchState {
  final String message;

  const SearchFailure({required this.message});

  @override
  List<Object?> get props => [message];
}
