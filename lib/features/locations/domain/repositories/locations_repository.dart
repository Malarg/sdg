import 'package:sdg/features/locations/domain/entities/coutry.dart';

abstract class LocationsRepository {
  Future<List<Country>> getCountries();
}