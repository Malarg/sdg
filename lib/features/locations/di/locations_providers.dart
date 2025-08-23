import 'package:riverpod/riverpod.dart';
import 'package:sdg/api/locations/locations_api.dart';
import 'package:sdg/features/app/di/app_providers.dart';
import 'package:sdg/features/locations/data/repositories/locations_repository_web.dart';
import 'package:sdg/features/locations/domain/repositories/locations_repository.dart';

class LocationsProviders {
  static final repositoryProvider = _repositoryProvider;
}

final _repositoryProvider = Provider<LocationsRepository>((ref) {
  final dio = ref.watch(AppProviders.dioProvider);
  final api = LocationsApi(dio);
  return LocationsRepositoryWeb(api: api);
});
