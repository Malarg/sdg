import 'package:sdg/features/locations/domain/entities/country.dart';
import 'package:sdg/features/locations/domain/entities/country_state.dart';

abstract class LocationsRepository {
  Future<List<Country>> getCountries();
  Future<List<CountryState>> getCountryStates(String countryId);
}