// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'order_page_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$OrderPageEventTearOff {
  const _$OrderPageEventTearOff();

  LocationChanged locationChanged(String location) {
    return LocationChanged(
      location,
    );
  }

  SearchButtonPressed searchButtonPressed() {
    return const SearchButtonPressed();
  }
}

/// @nodoc
const $OrderPageEvent = _$OrderPageEventTearOff();

/// @nodoc
mixin _$OrderPageEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String location) locationChanged,
    required TResult Function() searchButtonPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String location)? locationChanged,
    TResult Function()? searchButtonPressed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LocationChanged value) locationChanged,
    required TResult Function(SearchButtonPressed value) searchButtonPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LocationChanged value)? locationChanged,
    TResult Function(SearchButtonPressed value)? searchButtonPressed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderPageEventCopyWith<$Res> {
  factory $OrderPageEventCopyWith(
          OrderPageEvent value, $Res Function(OrderPageEvent) then) =
      _$OrderPageEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$OrderPageEventCopyWithImpl<$Res>
    implements $OrderPageEventCopyWith<$Res> {
  _$OrderPageEventCopyWithImpl(this._value, this._then);

  final OrderPageEvent _value;
  // ignore: unused_field
  final $Res Function(OrderPageEvent) _then;
}

/// @nodoc
abstract class $LocationChangedCopyWith<$Res> {
  factory $LocationChangedCopyWith(
          LocationChanged value, $Res Function(LocationChanged) then) =
      _$LocationChangedCopyWithImpl<$Res>;
  $Res call({String location});
}

/// @nodoc
class _$LocationChangedCopyWithImpl<$Res>
    extends _$OrderPageEventCopyWithImpl<$Res>
    implements $LocationChangedCopyWith<$Res> {
  _$LocationChangedCopyWithImpl(
      LocationChanged _value, $Res Function(LocationChanged) _then)
      : super(_value, (v) => _then(v as LocationChanged));

  @override
  LocationChanged get _value => super._value as LocationChanged;

  @override
  $Res call({
    Object? location = freezed,
  }) {
    return _then(LocationChanged(
      location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LocationChanged implements LocationChanged {
  const _$LocationChanged(this.location);

  @override
  final String location;

  @override
  String toString() {
    return 'OrderPageEvent.locationChanged(location: $location)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is LocationChanged &&
            (identical(other.location, location) ||
                const DeepCollectionEquality()
                    .equals(other.location, location)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(location);

  @JsonKey(ignore: true)
  @override
  $LocationChangedCopyWith<LocationChanged> get copyWith =>
      _$LocationChangedCopyWithImpl<LocationChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String location) locationChanged,
    required TResult Function() searchButtonPressed,
  }) {
    return locationChanged(location);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String location)? locationChanged,
    TResult Function()? searchButtonPressed,
    required TResult orElse(),
  }) {
    if (locationChanged != null) {
      return locationChanged(location);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LocationChanged value) locationChanged,
    required TResult Function(SearchButtonPressed value) searchButtonPressed,
  }) {
    return locationChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LocationChanged value)? locationChanged,
    TResult Function(SearchButtonPressed value)? searchButtonPressed,
    required TResult orElse(),
  }) {
    if (locationChanged != null) {
      return locationChanged(this);
    }
    return orElse();
  }
}

abstract class LocationChanged implements OrderPageEvent {
  const factory LocationChanged(String location) = _$LocationChanged;

  String get location => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocationChangedCopyWith<LocationChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchButtonPressedCopyWith<$Res> {
  factory $SearchButtonPressedCopyWith(
          SearchButtonPressed value, $Res Function(SearchButtonPressed) then) =
      _$SearchButtonPressedCopyWithImpl<$Res>;
}

/// @nodoc
class _$SearchButtonPressedCopyWithImpl<$Res>
    extends _$OrderPageEventCopyWithImpl<$Res>
    implements $SearchButtonPressedCopyWith<$Res> {
  _$SearchButtonPressedCopyWithImpl(
      SearchButtonPressed _value, $Res Function(SearchButtonPressed) _then)
      : super(_value, (v) => _then(v as SearchButtonPressed));

  @override
  SearchButtonPressed get _value => super._value as SearchButtonPressed;
}

/// @nodoc

class _$SearchButtonPressed implements SearchButtonPressed {
  const _$SearchButtonPressed();

  @override
  String toString() {
    return 'OrderPageEvent.searchButtonPressed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is SearchButtonPressed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String location) locationChanged,
    required TResult Function() searchButtonPressed,
  }) {
    return searchButtonPressed();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String location)? locationChanged,
    TResult Function()? searchButtonPressed,
    required TResult orElse(),
  }) {
    if (searchButtonPressed != null) {
      return searchButtonPressed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LocationChanged value) locationChanged,
    required TResult Function(SearchButtonPressed value) searchButtonPressed,
  }) {
    return searchButtonPressed(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LocationChanged value)? locationChanged,
    TResult Function(SearchButtonPressed value)? searchButtonPressed,
    required TResult orElse(),
  }) {
    if (searchButtonPressed != null) {
      return searchButtonPressed(this);
    }
    return orElse();
  }
}

abstract class SearchButtonPressed implements OrderPageEvent {
  const factory SearchButtonPressed() = _$SearchButtonPressed;
}

/// @nodoc
class _$OrderPageStateTearOff {
  const _$OrderPageStateTearOff();

  _OrderPageState call(
      {required String location, required bool showLocationList}) {
    return _OrderPageState(
      location: location,
      showLocationList: showLocationList,
    );
  }
}

/// @nodoc
const $OrderPageState = _$OrderPageStateTearOff();

/// @nodoc
mixin _$OrderPageState {
  String get location => throw _privateConstructorUsedError;
  bool get showLocationList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderPageStateCopyWith<OrderPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderPageStateCopyWith<$Res> {
  factory $OrderPageStateCopyWith(
          OrderPageState value, $Res Function(OrderPageState) then) =
      _$OrderPageStateCopyWithImpl<$Res>;
  $Res call({String location, bool showLocationList});
}

/// @nodoc
class _$OrderPageStateCopyWithImpl<$Res>
    implements $OrderPageStateCopyWith<$Res> {
  _$OrderPageStateCopyWithImpl(this._value, this._then);

  final OrderPageState _value;
  // ignore: unused_field
  final $Res Function(OrderPageState) _then;

  @override
  $Res call({
    Object? location = freezed,
    Object? showLocationList = freezed,
  }) {
    return _then(_value.copyWith(
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      showLocationList: showLocationList == freezed
          ? _value.showLocationList
          : showLocationList // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$OrderPageStateCopyWith<$Res>
    implements $OrderPageStateCopyWith<$Res> {
  factory _$OrderPageStateCopyWith(
          _OrderPageState value, $Res Function(_OrderPageState) then) =
      __$OrderPageStateCopyWithImpl<$Res>;
  @override
  $Res call({String location, bool showLocationList});
}

/// @nodoc
class __$OrderPageStateCopyWithImpl<$Res>
    extends _$OrderPageStateCopyWithImpl<$Res>
    implements _$OrderPageStateCopyWith<$Res> {
  __$OrderPageStateCopyWithImpl(
      _OrderPageState _value, $Res Function(_OrderPageState) _then)
      : super(_value, (v) => _then(v as _OrderPageState));

  @override
  _OrderPageState get _value => super._value as _OrderPageState;

  @override
  $Res call({
    Object? location = freezed,
    Object? showLocationList = freezed,
  }) {
    return _then(_OrderPageState(
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      showLocationList: showLocationList == freezed
          ? _value.showLocationList
          : showLocationList // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_OrderPageState implements _OrderPageState {
  const _$_OrderPageState(
      {required this.location, required this.showLocationList});

  @override
  final String location;
  @override
  final bool showLocationList;

  @override
  String toString() {
    return 'OrderPageState(location: $location, showLocationList: $showLocationList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _OrderPageState &&
            (identical(other.location, location) ||
                const DeepCollectionEquality()
                    .equals(other.location, location)) &&
            (identical(other.showLocationList, showLocationList) ||
                const DeepCollectionEquality()
                    .equals(other.showLocationList, showLocationList)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(location) ^
      const DeepCollectionEquality().hash(showLocationList);

  @JsonKey(ignore: true)
  @override
  _$OrderPageStateCopyWith<_OrderPageState> get copyWith =>
      __$OrderPageStateCopyWithImpl<_OrderPageState>(this, _$identity);
}

abstract class _OrderPageState implements OrderPageState {
  const factory _OrderPageState(
      {required String location,
      required bool showLocationList}) = _$_OrderPageState;

  @override
  String get location => throw _privateConstructorUsedError;
  @override
  bool get showLocationList => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$OrderPageStateCopyWith<_OrderPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
