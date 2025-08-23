import '../../../../api/locations/dto/country_dto.dart';
import '../../domain/entities/coutry.dart';

class CountryMapper {
  /// Converts a [Country] domain entity to a [CountryDto] data transfer object
  static CountryDto toDto(Country country) {
    return CountryDto(
      value: country.value,
      id: country.id,
    );
  }

  /// Converts a [CountryDto] data transfer object to a [Country] domain entity
  static Country fromDto(CountryDto dto) {
    return Country(
      value: dto.value,
      id: dto.id,
    );
  }
}