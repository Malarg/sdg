import 'package:sdg/features/common/presentation/validation/sdg_validation_common_error.dart';
import 'package:sdg/features/common/presentation/validation/sdg_validation_state.dart';
import 'package:sdg/features/common/presentation/validation/sdg_validator.dart';
import 'package:sdg/features/locations/domain/entities/country.dart';

import 'package:riverpod/riverpod.dart';
import 'package:sdg/features/locations/presentation/widgets/country/selected_country_controller.dart';

final _provider =
    NotifierProvider.autoDispose<
      SelectedCountryValidator,
      SdgValidationState<SdgValidationCommonError>
    >(SelectedCountryValidator.new);

class SelectedCountryValidator
    extends SdgValidator<Country, SdgValidationCommonError> {
  static final provider = _provider;

  @override
  SdgValidationState<SdgValidationCommonError> build() {
    ref.listen(SelectedCountryController.provider, (_, country) {
      if (state is! SdgValidationStateError) {
        return;
      }
      state = SdgValidationStateIdle();
    });
    return SdgValidationStateIdle();
  }

  @override
  List<SdgValidationCommonError? Function(Country?)> getValidators() {
    return [
      (country) => country == null ? SdgValidationCommonError.empty : null,
    ];
  }
}
