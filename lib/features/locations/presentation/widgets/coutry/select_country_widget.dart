import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sdg/features/common/presentation/sdg_state.dart';
import 'package:sdg/features/common/presentation/widgets/sdg_dropdown_button.dart';
import 'package:sdg/features/locations/domain/entities/coutry.dart';
import 'package:sdg/features/locations/presentation/entities/country_dropdown_item.dart';
import 'package:sdg/features/locations/presentation/widgets/coutry/countries_controller.dart';
import 'package:sdg/features/locations/presentation/widgets/coutry/selected_country_controller.dart';

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

    return SdgDropdownButton<CountryDropdownItem>(
      items: dropdownItems,
      selectedItem: selectedDropdownItem,
      state: _buildDropdownState(countriesState),
      errorButtonText: 'Reload',
      onErrorButtonPressed: () => _handleErrorButtonPressed(ref),
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

  SdgDropdownState _buildDropdownState(SdgState<List<Country>> countriesState) {
    return switch (countriesState) {
      SdgStateInitial() => SdgDropdownState.inactive,
      SdgStateLoading() => SdgDropdownState.loading,
      SdgStateIdle() => SdgDropdownState.active,
      SdgStateError() => SdgDropdownState.error,
    };
  }

  void _handleErrorButtonPressed(WidgetRef ref) {
    final countriesController = ref.read(CountriesController.provider.notifier);
    countriesController.getCountries();
  }
}
