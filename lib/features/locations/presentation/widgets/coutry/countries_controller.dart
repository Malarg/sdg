import 'dart:developer';

import 'package:riverpod/riverpod.dart';
import 'package:sdg/features/common/presentation/sdg_state.dart';
import 'package:sdg/features/locations/di/locations_providers.dart';
import 'package:sdg/features/locations/domain/entities/coutry.dart';

final _provider =
    NotifierProvider<CountriesController, SdgState<List<Country>>>(
      () => CountriesController(),
    );

class CountriesController extends Notifier<SdgState<List<Country>>> {
  static final provider = _provider;

  @override
  SdgState<List<Country>> build() {
    Future.delayed(Duration.zero, getCountries);
    return SdgStateInitial();
  }

  Future<void> getCountries() async {
    state = SdgStateLoading(value: state.value);
    final repository = ref.read(LocationsProviders.repositoryProvider);
    try {
      final countries = await repository.getCountries();
      state = SdgStateIdle(value: countries);
    } on Exception catch (e, stacktrace) {
      log('Loading countries failured', stackTrace: stacktrace);
      state = SdgStateError(error: e, value: state.value);
    }
  }
}
