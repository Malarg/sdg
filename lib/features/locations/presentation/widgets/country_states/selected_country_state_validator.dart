import 'package:sdg/features/common/presentation/validation/sdg_validation_state.dart';
import 'package:sdg/features/common/presentation/validation/sdg_validator.dart';
import 'package:sdg/features/locations/domain/entities/country_state.dart';
import 'package:sdg/features/locations/presentation/widgets/country_states/selected_country_state_controller.dart';
import 'package:sdg/features/locations/presentation/widgets/country/selected_country_controller.dart';

import 'package:riverpod/riverpod.dart';

final _provider =
    NotifierProvider.autoDispose<
      SelectedCountryStateValidator,
      SdgValidationState<SelectedCountryStateValidationError>
    >(SelectedCountryStateValidator.new);

enum SelectedCountryStateValidationError { empty, countryNotSelected }

class SelectedCountryStateValidator
    extends SdgValidator<CountryState, SelectedCountryStateValidationError> {
  static final provider = _provider;

  @override
  SdgValidationState<SelectedCountryStateValidationError> build() {
    ref.listen(SelectedCountryStateController.provider, (_, countryState) {
      if (state is! SdgValidationStateError) {
        return;
      }
      state = SdgValidationStateIdle();
    });
    return SdgValidationStateIdle();
  }

  @override
  List<SelectedCountryStateValidationError? Function(CountryState?)>
  getValidators() {
    return [_checkCountrySelected, _checkNotNull];
  }

  SelectedCountryStateValidationError? _checkCountrySelected(
    CountryState? countryState,
  ) {
    return switch (ref.read(SelectedCountryController.provider)) {
      null => SelectedCountryStateValidationError.countryNotSelected,
      _ => null,
    };
  }

  SelectedCountryStateValidationError? _checkNotNull(
    CountryState? countryState,
  ) {
    return switch (countryState) {
      null => SelectedCountryStateValidationError.empty,
      _ => null,
    };
  }
}
