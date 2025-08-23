import 'package:riverpod/riverpod.dart';
import 'package:sdg/features/common/presentation/sdg_state.dart';
import 'package:sdg/features/locations/domain/entities/country.dart';
import 'package:sdg/features/locations/presentation/widgets/coutry/countries_controller.dart';

final _provider = NotifierProvider<SelectedCountryController, Country?>(
  () => SelectedCountryController(),
);

class SelectedCountryController extends Notifier<Country?> {
  static final provider = _provider;

  @override
  Country? build() {
    ref.listen(CountriesController.provider, _onCountriesListChanged);
    return null;
  }

  void _onCountriesListChanged(
    SdgState<List<Country>>? prev,
    SdgState<List<Country>>? next,
  ) {
    if (next?.value?.contains(state) ?? false) {
      return;
    }
    state = null;
  }

  void selectCountry(Country country) {
    state = country;
  }

  void clearSelection() {
    state = null;
  }

  bool get hasSelection => state != null;
}
