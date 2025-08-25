import 'package:sdg/features/locations/domain/entities/country.dart';
import 'package:sdg/features/locations/domain/entities/country_state.dart';
import 'package:sdg/features/locations/domain/repositories/locations_repository.dart';
class MockLocationsRepository implements LocationsRepository {
  @override
  Future<List<Country>> getCountries() async {
    return [
      const Country(id: '1', value: 'USA'),
      const Country(id: '2', value: 'Canada'),
    ];
  }

  @override
  Future<List<CountryState>> getCountryStates(String countryId) async {
    if (countryId == '1') {
      return [
        const CountryState(id: '1', value: 'California', countryId: '1'),
        const CountryState(id: '2', value: 'Texas', countryId: '1'),
      ];
    }
    if (countryId == '2') {
      return [
        const CountryState(id: '1', value: 'Ontario', countryId: '2'),
        const CountryState(id: '2', value: 'Quebec', countryId: '2'),
      ];
    }
    return [];
  }
}
