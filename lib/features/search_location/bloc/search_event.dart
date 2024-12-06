part of 'search_location_bloc.dart';

sealed class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object?> get props => [];
}

final class Search extends SearchEvent {
  final String query;
  final bool fromFocused;

  const Search({required this.query, required this.fromFocused});
}
