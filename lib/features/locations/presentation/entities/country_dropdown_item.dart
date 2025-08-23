import 'package:sdg/features/common/presentation/mixins/sdg_dropdown_item_mixin.dart';
import 'package:sdg/features/locations/domain/entities/coutry.dart';

class CountryDropdownItem extends Country with SdgDropdownItemMixin {
  const CountryDropdownItem({required super.id, required super.value});

  CountryDropdownItem.fromCountry(Country country)
    : super(id: country.id, value: country.value);

  @override
  String get dropdownItemText => value;
}
