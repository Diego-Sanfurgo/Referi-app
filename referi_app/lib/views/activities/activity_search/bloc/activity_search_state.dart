part of 'activity_search_bloc.dart';

@immutable
abstract class ActivitySearchState {}

class ActivitySearchInitial extends ActivitySearchState {}

class ActivitySearchNotFound extends ActivitySearchState {}

class ActivitySearchResults extends ActivitySearchState {
  final List<DTOActivity> list;
  final bool isSearching;

  ActivitySearchResults(this.list, {required this.isSearching});
}

class SwitchedAppbarState extends ActivitySearchState {
  final bool isSearching;

  SwitchedAppbarState(this.isSearching);
}
