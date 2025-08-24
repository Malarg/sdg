import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sdg/features/common/presentation/validation/sdg_validation_common_error.dart';
import 'package:sdg/features/common/presentation/validation/sdg_validation_state.dart';
import 'package:sdg/features/common/presentation/validation/sdg_validator.dart';
import 'package:sdg/features/locations/presentation/widgets/country_states/selected_country_state_controller.dart';
import 'package:sdg/features/locations/presentation/widgets/country_states/selected_country_state_validator.dart';
import 'package:sdg/features/locations/presentation/widgets/country/selected_country_controller.dart';
import 'package:sdg/features/locations/presentation/widgets/country/selected_country_validator.dart';

final _provider =
    NotifierProvider.autoDispose<
      LocationsScreenValidator,
      SdgValidationState<SdgValidationCommonError>
    >(LocationsScreenValidator.new);

class LocationsScreenValidator
    extends SdgValidator<Object, SdgValidationCommonError> {
  static final provider = _provider;

  @override
  List<SdgValidationCommonError? Function(Object?)> getValidators() {
    final country = ref.read(SelectedCountryController.provider);
    ref
        .read(SelectedCountryValidator.provider.notifier)
        .validate(value: country);

    final countryState = ref.read(SelectedCountryStateController.provider);
    ref
        .read(SelectedCountryStateValidator.provider.notifier)
        .validate(value: countryState);

    return [
      (_) {
        final isCountryValid = ref
            .read(SelectedCountryValidator.provider)
            .isValid;
        final isCountryStateValid = ref
            .read(SelectedCountryStateValidator.provider)
            .isValid;

        if (isCountryValid && isCountryStateValid) {
          return null;
        }

        return SdgValidationCommonError.invalid;
      },
    ];
  }
}
