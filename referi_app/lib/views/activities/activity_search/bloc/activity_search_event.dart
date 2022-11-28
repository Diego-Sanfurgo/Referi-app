part of 'activity_search_bloc.dart';

@immutable
abstract class ActivitySearchEvent {}

class FilterList extends ActivitySearchEvent {
  final String query;

  FilterList(this.query);
}

class SwitchAppbar extends ActivitySearchEvent {
  final bool isSearching;

  SwitchAppbar(this.isSearching);
}

class ObtainActivitiesByType extends ActivitySearchEvent {
  final String activityId;

  ObtainActivitiesByType(this.activityId);
}

class ToInitial extends ActivitySearchEvent {}
