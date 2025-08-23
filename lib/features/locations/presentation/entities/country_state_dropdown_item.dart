import 'package:sdg/features/common/presentation/mixins/sdg_dropdown_item_mixin.dart';
import 'package:sdg/features/locations/domain/entities/country_state.dart';

class CountryStateDropdownItem extends CountryState with SdgDropdownItemMixin {
  const CountryStateDropdownItem({
    required super.id,
    required super.value,
    required super.countryId,
  });

  CountryStateDropdownItem.fromCountryState(CountryState countryState)
      : super(
          id: countryState.id,
          value: countryState.value,
          countryId: countryState.countryId,
        );

  @override
  String get dropdownItemText => value;
}
