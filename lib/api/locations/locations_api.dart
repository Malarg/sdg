import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'dto/country_dto.dart';

part 'locations_api.g.dart';

const _prefix = '/api/v1';

@RestApi()
abstract class LocationsApi {
  factory LocationsApi(Dio dio, {String baseUrl}) = _LocationsApi;

  @GET('$_prefix/countries')
  Future<List<CountryDto>> getCountries();
}