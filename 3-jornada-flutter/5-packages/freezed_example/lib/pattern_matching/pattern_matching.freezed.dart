// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pattern_matching.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$Union {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int value) $default, {
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(int value)? $default, {
    TResult? Function()? loading,
    TResult? Function(String? message)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int value)? $default, {
    TResult Function()? loading,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(UnionData value) $default, {
    required TResult Function(UnionLoading value) loading,
    required TResult Function(UnionError value) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(UnionData value)? $default, {
    TResult? Function(UnionLoading value)? loading,
    TResult? Function(UnionError value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(UnionData value)? $default, {
    TResult Function(UnionLoading value)? loading,
    TResult Function(UnionError value)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnionCopyWith<$Res> {
  factory $UnionCopyWith(Union value, $Res Function(Union) then) =
      _$UnionCopyWithImpl<$Res, Union>;
}

/// @nodoc
class _$UnionCopyWithImpl<$Res, $Val extends Union>
    implements $UnionCopyWith<$Res> {
  _$UnionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Union
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$UnionDataImplCopyWith<$Res> {
  factory _$$UnionDataImplCopyWith(
    _$UnionDataImpl value,
    $Res Function(_$UnionDataImpl) then,
  ) = __$$UnionDataImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int value});
}

/// @nodoc
class __$$UnionDataImplCopyWithImpl<$Res>
    extends _$UnionCopyWithImpl<$Res, _$UnionDataImpl>
    implements _$$UnionDataImplCopyWith<$Res> {
  __$$UnionDataImplCopyWithImpl(
    _$UnionDataImpl _value,
    $Res Function(_$UnionDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Union
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? value = null}) {
    return _then(
      _$UnionDataImpl(
        null == value
            ? _value.value
            : value // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$UnionDataImpl implements UnionData {
  _$UnionDataImpl(this.value);

  @override
  final int value;

  @override
  String toString() {
    return 'Union(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnionDataImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  /// Create a copy of Union
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnionDataImplCopyWith<_$UnionDataImpl> get copyWith =>
      __$$UnionDataImplCopyWithImpl<_$UnionDataImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int value) $default, {
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) {
    return $default(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(int value)? $default, {
    TResult? Function()? loading,
    TResult? Function(String? message)? error,
  }) {
    return $default?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int value)? $default, {
    TResult Function()? loading,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(UnionData value) $default, {
    required TResult Function(UnionLoading value) loading,
    required TResult Function(UnionError value) error,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(UnionData value)? $default, {
    TResult? Function(UnionLoading value)? loading,
    TResult? Function(UnionError value)? error,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(UnionData value)? $default, {
    TResult Function(UnionLoading value)? loading,
    TResult Function(UnionError value)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class UnionData implements Union {
  factory UnionData(final int value) = _$UnionDataImpl;

  int get value;

  /// Create a copy of Union
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnionDataImplCopyWith<_$UnionDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnionLoadingImplCopyWith<$Res> {
  factory _$$UnionLoadingImplCopyWith(
    _$UnionLoadingImpl value,
    $Res Function(_$UnionLoadingImpl) then,
  ) = __$$UnionLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UnionLoadingImplCopyWithImpl<$Res>
    extends _$UnionCopyWithImpl<$Res, _$UnionLoadingImpl>
    implements _$$UnionLoadingImplCopyWith<$Res> {
  __$$UnionLoadingImplCopyWithImpl(
    _$UnionLoadingImpl _value,
    $Res Function(_$UnionLoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Union
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$UnionLoadingImpl implements UnionLoading {
  _$UnionLoadingImpl();

  @override
  String toString() {
    return 'Union.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UnionLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int value) $default, {
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(int value)? $default, {
    TResult? Function()? loading,
    TResult? Function(String? message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int value)? $default, {
    TResult Function()? loading,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(UnionData value) $default, {
    required TResult Function(UnionLoading value) loading,
    required TResult Function(UnionError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(UnionData value)? $default, {
    TResult? Function(UnionLoading value)? loading,
    TResult? Function(UnionError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(UnionData value)? $default, {
    TResult Function(UnionLoading value)? loading,
    TResult Function(UnionError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class UnionLoading implements Union {
  factory UnionLoading() = _$UnionLoadingImpl;
}

/// @nodoc
abstract class _$$UnionErrorImplCopyWith<$Res> {
  factory _$$UnionErrorImplCopyWith(
    _$UnionErrorImpl value,
    $Res Function(_$UnionErrorImpl) then,
  ) = __$$UnionErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$UnionErrorImplCopyWithImpl<$Res>
    extends _$UnionCopyWithImpl<$Res, _$UnionErrorImpl>
    implements _$$UnionErrorImplCopyWith<$Res> {
  __$$UnionErrorImplCopyWithImpl(
    _$UnionErrorImpl _value,
    $Res Function(_$UnionErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Union
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = freezed}) {
    return _then(
      _$UnionErrorImpl(
        freezed == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$UnionErrorImpl implements UnionError {
  _$UnionErrorImpl([this.message]);

  @override
  final String? message;

  @override
  String toString() {
    return 'Union.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnionErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of Union
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnionErrorImplCopyWith<_$UnionErrorImpl> get copyWith =>
      __$$UnionErrorImplCopyWithImpl<_$UnionErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int value) $default, {
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(int value)? $default, {
    TResult? Function()? loading,
    TResult? Function(String? message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int value)? $default, {
    TResult Function()? loading,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(UnionData value) $default, {
    required TResult Function(UnionLoading value) loading,
    required TResult Function(UnionError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(UnionData value)? $default, {
    TResult? Function(UnionLoading value)? loading,
    TResult? Function(UnionError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(UnionData value)? $default, {
    TResult Function(UnionLoading value)? loading,
    TResult Function(UnionError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class UnionError implements Union {
  factory UnionError([final String? message]) = _$UnionErrorImpl;

  String? get message;

  /// Create a copy of Union
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnionErrorImplCopyWith<_$UnionErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
