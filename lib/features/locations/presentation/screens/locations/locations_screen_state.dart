enum LocationsScreenValidationError {
  noCountrySelected,
  noCountryStateSelected,
}

sealed class LocationsScreenState {}

class LocationsScreenStateInitial extends LocationsScreenState {}

class LocationsScreenStateValidation extends LocationsScreenState {}

class LocationsScreenStateValidationSuccess extends LocationsScreenState {}

class LocationsScreenStateValidationError extends LocationsScreenState {
  final LocationsScreenValidationError error;

  LocationsScreenStateValidationError({required this.error});
}
