import 'package:sdg/api/locations/locations_api.dart';
import 'package:sdg/features/locations/domain/entities/coutry.dart';
import 'package:sdg/features/locations/domain/repositories/locations_repository.dart';
import '../mappers/country_mapper.dart';

class LocationsRepositoryWeb implements LocationsRepository {
  final LocationsApi _api;

  LocationsRepositoryWeb({required LocationsApi api}) : _api = api;

  @override
  Future<Country> getCountries() async {
    try {
      final countriesDto = await _api.getCountries();
      return CountryMapper.fromDto(countriesDto.first);
    } catch (e, stacktrace) {
      throw Error.throwWithStackTrace(
        'Unexpected error while fetching countries: $e',
        stacktrace,
      );
    }
  }
}
