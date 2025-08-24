import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sdg/features/common/presentation/validation/sdg_validation_common_error.dart';
import 'package:sdg/features/common/presentation/validation/sdg_validation_state.dart';
import 'package:sdg/features/common/presentation/widgets/sdg_dropdown_button.dart';
import 'package:sdg/features/locations/presentation/entities/country_dropdown_item.dart';
import 'package:sdg/features/locations/presentation/widgets/country/countries_controller.dart';
import 'package:sdg/features/locations/presentation/widgets/country/selected_country_controller.dart';
import 'package:sdg/features/locations/presentation/widgets/country/selected_country_validator.dart';

class SelectCountryWidget extends ConsumerWidget {
  const SelectCountryWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final countriesState = ref.watch(CountriesController.provider);
    final List<CountryDropdownItem> dropdownItems =
        countriesState.value?.map(CountryDropdownItem.fromCountry).toList() ??
        [];

    final selectedCountry = ref.watch(SelectedCountryController.provider);
    final CountryDropdownItem? selectedDropdownItem = selectedCountry != null
        ? CountryDropdownItem.fromCountry(selectedCountry)
        : null;

    final validationState = ref.watch(SelectedCountryValidator.provider);
    final errorText = switch (validationState) {
      SdgValidationStateError(error: final countryError) => switch (countryError) {
        SdgValidationCommonError.empty => 'Select a country',
        _ => null,
      },
      _ => null,
    };

    return SdgDropdownButton<CountryDropdownItem>(
      items: dropdownItems,
      selectedItem: selectedDropdownItem,
      state: SdgDropdownState.fromSdgState(countriesState),
      errorButtonText: 'Reload',
      onErrorButtonPressed: () => _handleErrorButtonPressed(ref),
      errorText: errorText,
      onItemSelected: (CountryDropdownItem? item) {
        _onItemSelected(item, ref);
      },
    );
  }

  void _onItemSelected(CountryDropdownItem? item, WidgetRef ref) {
    final selectedCountryController = ref.read(
      SelectedCountryController.provider.notifier,
    );
    if (item != null) {
      selectedCountryController.selectCountry(item);
    } else {
      selectedCountryController.clearSelection();
    }
  }

  void _handleErrorButtonPressed(WidgetRef ref) {
    final countriesController = ref.read(CountriesController.provider.notifier);
    countriesController.getCountries();
  }
}
