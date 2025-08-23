import 'package:riverpod/riverpod.dart';
import 'package:sdg/features/locations/presentation/screens/locations/locations_screen_state.dart';
import 'package:sdg/features/locations/presentation/widgets/country_states/selected_country_state_controller.dart';
import 'package:sdg/features/locations/presentation/widgets/coutry/selected_country_controller.dart';

final _provider =
    NotifierProvider.autoDispose<LocationsController, LocationsScreenState>(
      () => LocationsController(),
    );

class LocationsController extends AutoDisposeNotifier<LocationsScreenState> {
  static final provider = _provider;

  @override
  LocationsScreenState build() {
    return LocationsScreenStateInitial();
  }

  void continueToNextStep() {
    state = LocationsScreenStateValidation();
    final selectedCountry = ref.read(SelectedCountryController.provider);
    if (selectedCountry == null) {
      state = LocationsScreenStateValidationError(
        error: LocationsScreenValidationError.noCountrySelected,
      );
      return;
    }
    final selectedCountryState = ref.read(
      SelectedCountryStateController.provider,
    );
    if (selectedCountryState == null) {
      state = LocationsScreenStateValidationError(
        error: LocationsScreenValidationError.noCountryStateSelected,
      );
      return;
    }
    state = LocationsScreenStateValidationSuccess();
  }
}
