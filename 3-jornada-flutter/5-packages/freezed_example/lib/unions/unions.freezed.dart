// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'unions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$Example {
  String get name => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name, int age) person,
    required TResult Function(String name, int population) city,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name, int age)? person,
    TResult? Function(String name, int population)? city,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name, int age)? person,
    TResult Function(String name, int population)? city,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Person value) person,
    required TResult Function(City value) city,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Person value)? person,
    TResult? Function(City value)? city,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Person value)? person,
    TResult Function(City value)? city,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of Example
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExampleCopyWith<Example> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExampleCopyWith<$Res> {
  factory $ExampleCopyWith(Example value, $Res Function(Example) then) =
      _$ExampleCopyWithImpl<$Res, Example>;
  @useResult
  $Res call({String name});
}

/// @nodoc
class _$ExampleCopyWithImpl<$Res, $Val extends Example>
    implements $ExampleCopyWith<$Res> {
  _$ExampleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Example
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? name = null}) {
    return _then(
      _value.copyWith(
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PersonImplCopyWith<$Res> implements $ExampleCopyWith<$Res> {
  factory _$$PersonImplCopyWith(
    _$PersonImpl value,
    $Res Function(_$PersonImpl) then,
  ) = __$$PersonImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, int age});
}

/// @nodoc
class __$$PersonImplCopyWithImpl<$Res>
    extends _$ExampleCopyWithImpl<$Res, _$PersonImpl>
    implements _$$PersonImplCopyWith<$Res> {
  __$$PersonImplCopyWithImpl(
    _$PersonImpl _value,
    $Res Function(_$PersonImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Example
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? name = null, Object? age = null}) {
    return _then(
      _$PersonImpl(
        null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        null == age
            ? _value.age
            : age // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$PersonImpl implements Person {
  const _$PersonImpl(this.name, this.age);

  @override
  final String name;
  @override
  final int age;

  @override
  String toString() {
    return 'Example.person(name: $name, age: $age)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PersonImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.age, age) || other.age == age));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, age);

  /// Create a copy of Example
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PersonImplCopyWith<_$PersonImpl> get copyWith =>
      __$$PersonImplCopyWithImpl<_$PersonImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name, int age) person,
    required TResult Function(String name, int population) city,
  }) {
    return person(name, age);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name, int age)? person,
    TResult? Function(String name, int population)? city,
  }) {
    return person?.call(name, age);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name, int age)? person,
    TResult Function(String name, int population)? city,
    required TResult orElse(),
  }) {
    if (person != null) {
      return person(name, age);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Person value) person,
    required TResult Function(City value) city,
  }) {
    return person(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Person value)? person,
    TResult? Function(City value)? city,
  }) {
    return person?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Person value)? person,
    TResult Function(City value)? city,
    required TResult orElse(),
  }) {
    if (person != null) {
      return person(this);
    }
    return orElse();
  }
}

abstract class Person implements Example {
  const factory Person(final String name, final int age) = _$PersonImpl;

  @override
  String get name;
  int get age;

  /// Create a copy of Example
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PersonImplCopyWith<_$PersonImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CityImplCopyWith<$Res> implements $ExampleCopyWith<$Res> {
  factory _$$CityImplCopyWith(
    _$CityImpl value,
    $Res Function(_$CityImpl) then,
  ) = __$$CityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, int population});
}

/// @nodoc
class __$$CityImplCopyWithImpl<$Res>
    extends _$ExampleCopyWithImpl<$Res, _$CityImpl>
    implements _$$CityImplCopyWith<$Res> {
  __$$CityImplCopyWithImpl(_$CityImpl _value, $Res Function(_$CityImpl) _then)
    : super(_value, _then);

  /// Create a copy of Example
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? name = null, Object? population = null}) {
    return _then(
      _$CityImpl(
        null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        null == population
            ? _value.population
            : population // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$CityImpl implements City {
  const _$CityImpl(this.name, this.population);

  @override
  final String name;
  @override
  final int population;

  @override
  String toString() {
    return 'Example.city(name: $name, population: $population)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CityImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.population, population) ||
                other.population == population));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, population);

  /// Create a copy of Example
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CityImplCopyWith<_$CityImpl> get copyWith =>
      __$$CityImplCopyWithImpl<_$CityImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name, int age) person,
    required TResult Function(String name, int population) city,
  }) {
    return city(name, population);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name, int age)? person,
    TResult? Function(String name, int population)? city,
  }) {
    return city?.call(name, population);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name, int age)? person,
    TResult Function(String name, int population)? city,
    required TResult orElse(),
  }) {
    if (city != null) {
      return city(name, population);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Person value) person,
    required TResult Function(City value) city,
  }) {
    return city(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Person value)? person,
    TResult? Function(City value)? city,
  }) {
    return city?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Person value)? person,
    TResult Function(City value)? city,
    required TResult orElse(),
  }) {
    if (city != null) {
      return city(this);
    }
    return orElse();
  }
}

abstract class City implements Example {
  const factory City(final String name, final int population) = _$CityImpl;

  @override
  String get name;
  int get population;

  /// Create a copy of Example
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CityImplCopyWith<_$CityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
