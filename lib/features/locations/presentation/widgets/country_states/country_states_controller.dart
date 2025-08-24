import 'dart:developer';

import 'package:riverpod/riverpod.dart';
import 'package:sdg/features/common/presentation/sdg_state.dart';
import 'package:sdg/features/locations/di/locations_providers.dart';
import 'package:sdg/features/locations/domain/entities/country_state.dart';
import 'package:sdg/features/locations/presentation/widgets/country/selected_country_controller.dart';

final _provider =
    NotifierProvider.autoDispose<CountryStatesController, SdgState<List<CountryState>>>(
      () => CountryStatesController(),
    );

class CountryStatesController extends AutoDisposeNotifier<SdgState<List<CountryState>>> {
  static final provider = _provider;

  @override
  SdgState<List<CountryState>> build() {
    ref.listen(SelectedCountryController.provider, (prev, next) {
      if (next == null) {
        clearStates();
      } else {
        getCountryStates(next.id);
      }
    });
    return SdgStateInitial();
  }

  Future<void> getCountryStates(String countryId) async {
    state = SdgStateLoading(value: state.value);
    final repository = ref.read(LocationsProviders.repositoryProvider);
    try {
      final countryStates = await repository.getCountryStates(countryId);
      state = SdgStateIdle(value: countryStates);
    } on Exception catch (e, stacktrace) {
      log('Loading country states failed', stackTrace: stacktrace);
      state = SdgStateError(error: e, value: state.value);
    }
  }

  void clearStates() {
    state = SdgStateInitial();
  }
}
