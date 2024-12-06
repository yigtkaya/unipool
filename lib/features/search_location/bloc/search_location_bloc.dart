import 'package:equatable/equatable.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:unipool/features/search_location/data/datasources/geoapify_datasource.dart';
import 'package:unipool/features/search_location/domain/models/geoapify_places_model.dart';

part 'search_event.dart';
part 'search_state.dart';

@injectable
final class SearchLocationBloc extends Bloc<SearchEvent, SearchState> {
  final GeoapifyDataSource _dataSource;

  SearchLocationBloc()
      : _dataSource = GeoapifyDataSource(apiKey: dotenv.get('GEOAPIFY_API_KEY')),
        super(SearchInitial()) {
    on<Search>(_fetchGeoapifyPlaces);
  }

  void _fetchGeoapifyPlaces(Search event, Emitter<SearchState> emit) async {
    if (event.query.isEmpty) {
      emit(SearchSuccess(geoapifyPlaces: [], fromFocused: event.fromFocused));
      return;
    }

    emit(SearchLoading());

    try {
      final locations = await _dataSource.searchPlaces(event.query);
      emit(SearchSuccess(geoapifyPlaces: locations, fromFocused: event.fromFocused));
    } catch (e) {
      emit(SearchFailure(message: 'Error: $e'));
    }
  }

  @override
  Future<void> close() {
    _dataSource.dispose();
    return super.close();
  }
}
