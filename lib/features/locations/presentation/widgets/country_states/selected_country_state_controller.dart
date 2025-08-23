import 'package:riverpod/riverpod.dart';
import 'package:sdg/features/common/presentation/sdg_state.dart';
import 'package:sdg/features/locations/domain/entities/country_state.dart';
import 'package:sdg/features/locations/presentation/widgets/country_states/country_states_controller.dart';

final _provider = NotifierProvider<SelectedCountryStateController, CountryState?>(
  () => SelectedCountryStateController(),
);

class SelectedCountryStateController extends Notifier<CountryState?> {
  static final provider = _provider;

  @override
  CountryState? build() {
    ref.listen(CountryStatesController.provider, _onCountryStatesListChanged);
    return null;
  }

  void _onCountryStatesListChanged(
    SdgState<List<CountryState>>? prev,
    SdgState<List<CountryState>>? next,
  ) {
    if (next?.value?.contains(state) ?? false) {
      return;
    }
    state = null;
  }

  void selectCountryState(CountryState countryState) {
    state = countryState;
  }

  void clearSelection() {
    state = null;
  }

  bool get hasSelection => state != null;
}
