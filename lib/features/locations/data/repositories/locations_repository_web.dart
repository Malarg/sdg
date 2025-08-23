import 'package:sdg/api/locations/locations_api.dart';
import 'package:sdg/features/locations/domain/entities/country.dart';
import 'package:sdg/features/locations/domain/entities/country_state.dart';
import 'package:sdg/features/locations/domain/repositories/locations_repository.dart';
import '../mappers/country_mapper.dart';
import '../mappers/country_state_mapper.dart';

class LocationsRepositoryWeb implements LocationsRepository {
  final LocationsApi _api;

  LocationsRepositoryWeb({required LocationsApi api}) : _api = api;

  @override
  Future<List<Country>> getCountries() async {
    try {
      final countriesDto = await _api.getCountries();
      return countriesDto.map((dto) => CountryMapper.fromDto(dto)).toList();
    } catch (e, stacktrace) {
      throw Error.throwWithStackTrace(
        'Unexpected error while fetching countries: $e',
        stacktrace,
      );
    }
  }

  @override
  Future<List<CountryState>> getCountryStates(String countryId) async {
    try {
      final countryStatesDto = await _api.getCountryStates(countryId);
      return countryStatesDto.map((dto) => CountryStateMapper.fromDto(dto)).toList();
    } catch (e, stacktrace) {
      throw Error.throwWithStackTrace(
        'Unexpected error while fetching country states: $e',
        stacktrace,
      );
    }
  }
}
