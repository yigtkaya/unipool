part of '../search_location_view.dart';

mixin _SearchFieldsMixin on State<_SearchContainer> {
  final TextEditingController fromController = TextEditingController();
  final TextEditingController toController = TextEditingController();
  Timer? _debounceTimer;

  @override
  void initState() {
    super.initState();
    // Set initial values from TripRouteCubit state
    final initialState = context.read<TripRouteCubit>().state;
    fromController.text = initialState.from?.name ?? '';
    toController.text = initialState.to?.name ?? '';
  }

  @override
  void dispose() {
    fromController.dispose();
    toController.dispose();
    _debounceTimer?.cancel();
    super.dispose();
  }

  void debounceSearch(String query, bool fromFocused) {
    if (_debounceTimer?.isActive ?? false) {
      _debounceTimer!.cancel();
    }
    _debounceTimer = Timer(const Duration(milliseconds: 600), () {
      onSearch(query, fromFocused);
    });
  }

  void onSearch(String query, bool fromFocused) {
    context.read<SearchLocationBloc>().add(Search(query: query, fromFocused: fromFocused));
  }
}
