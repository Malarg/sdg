import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sdg/features/common/presentation/widgets/sdg_dropdown_button.dart';
import 'package:sdg/features/locations/presentation/entities/country_state_dropdown_item.dart';
import 'package:sdg/features/locations/presentation/widgets/country_states/country_states_controller.dart';
import 'package:sdg/features/locations/presentation/widgets/country_states/selected_country_state_controller.dart';
import 'package:sdg/features/locations/presentation/widgets/coutry/selected_country_controller.dart';

class SelectCountryStateWidget extends ConsumerWidget {
  const SelectCountryStateWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final countryStatesState = ref.watch(CountryStatesController.provider);
    final List<CountryStateDropdownItem> dropdownItems =
        countryStatesState.value
            ?.map(CountryStateDropdownItem.fromCountryState)
            .toList() ??
        [];

    final selectedCountryState = ref.watch(
      SelectedCountryStateController.provider,
    );
    final CountryStateDropdownItem? selectedDropdownItem =
        selectedCountryState != null
        ? CountryStateDropdownItem.fromCountryState(selectedCountryState)
        : null;

    return SdgDropdownButton<CountryStateDropdownItem>(
      items: dropdownItems,
      selectedItem: selectedDropdownItem,
      state: SdgDropdownState.fromSdgState(countryStatesState),
      errorButtonText: 'Reload',
      onErrorButtonPressed: () => _handleErrorButtonPressed(ref),
      onItemSelected: (CountryStateDropdownItem? item) {
        _onItemSelected(item, ref);
      },
    );
  }

  void _onItemSelected(CountryStateDropdownItem? item, WidgetRef ref) {
    final selectedCountryStateController = ref.read(
      SelectedCountryStateController.provider.notifier,
    );
    if (item != null) {
      selectedCountryStateController.selectCountryState(item);
    } else {
      selectedCountryStateController.clearSelection();
    }
  }

  void _handleErrorButtonPressed(WidgetRef ref) {
    final selectedCountry = ref.read(SelectedCountryController.provider);
    if (selectedCountry != null) {
      ref
          .read(CountryStatesController.provider.notifier)
          .getCountryStates(selectedCountry.id);
    }
  }
}
