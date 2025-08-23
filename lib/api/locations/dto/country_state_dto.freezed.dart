// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'country_state_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CountryStateDto {

 String get value; String get id; String get countryId;



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CountryStateDto&&(identical(other.value, value) || other.value == value)&&(identical(other.id, id) || other.id == id)&&(identical(other.countryId, countryId) || other.countryId == countryId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value,id,countryId);

@override
String toString() {
  return 'CountryStateDto(value: $value, id: $id, countryId: $countryId)';
}


}




/// Adds pattern-matching-related methods to [CountryStateDto].
extension CountryStateDtoPatterns on CountryStateDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CountryStateDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CountryStateDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CountryStateDto value)  $default,){
final _that = this;
switch (_that) {
case _CountryStateDto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CountryStateDto value)?  $default,){
final _that = this;
switch (_that) {
case _CountryStateDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String value,  String id,  String countryId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CountryStateDto() when $default != null:
return $default(_that.value,_that.id,_that.countryId);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String value,  String id,  String countryId)  $default,) {final _that = this;
switch (_that) {
case _CountryStateDto():
return $default(_that.value,_that.id,_that.countryId);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String value,  String id,  String countryId)?  $default,) {final _that = this;
switch (_that) {
case _CountryStateDto() when $default != null:
return $default(_that.value,_that.id,_that.countryId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(createToJson: false)

class _CountryStateDto implements CountryStateDto {
  const _CountryStateDto({required this.value, required this.id, required this.countryId});
  factory _CountryStateDto.fromJson(Map<String, dynamic> json) => _$CountryStateDtoFromJson(json);

@override final  String value;
@override final  String id;
@override final  String countryId;




@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CountryStateDto&&(identical(other.value, value) || other.value == value)&&(identical(other.id, id) || other.id == id)&&(identical(other.countryId, countryId) || other.countryId == countryId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value,id,countryId);

@override
String toString() {
  return 'CountryStateDto(value: $value, id: $id, countryId: $countryId)';
}


}




// dart format on
