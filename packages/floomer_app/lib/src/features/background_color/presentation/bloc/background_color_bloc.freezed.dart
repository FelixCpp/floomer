// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'background_color_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BackgroundColorEvent {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is BackgroundColorEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'BackgroundColorEvent()';
}


}

/// @nodoc
class $BackgroundColorEventCopyWith<$Res>  {
$BackgroundColorEventCopyWith(BackgroundColorEvent _, $Res Function(BackgroundColorEvent) __);
}


/// Adds pattern-matching-related methods to [BackgroundColorEvent].
extension BackgroundColorEventPatterns on BackgroundColorEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,}) {final _that = this;
switch (_that) {
case _Started():
return started();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _:
  return null;

}
}

}

/// @nodoc


class _Started implements BackgroundColorEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'BackgroundColorEvent.started()';
}


}




/// @nodoc
mixin _$BackgroundColorState {

 ui.Color get color;
/// Create a copy of BackgroundColorState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BackgroundColorStateCopyWith<BackgroundColorState> get copyWith => _$BackgroundColorStateCopyWithImpl<BackgroundColorState>(this as BackgroundColorState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as BackgroundColorState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BackgroundColorState&&(identical(other.color, _this.color) || other.color == _this.color));
}


@override
int get hashCode {
  final _this = this as BackgroundColorState;
  return Object.hash(runtimeType,_this.color);
}

@override
String toString() {
  final _this = this as BackgroundColorState;
  return 'BackgroundColorState(color: ${_this.color})';
}


}

/// @nodoc
abstract mixin class $BackgroundColorStateCopyWith<$Res>  {
  factory $BackgroundColorStateCopyWith(BackgroundColorState value, $Res Function(BackgroundColorState) _then) = _$BackgroundColorStateCopyWithImpl;
@useResult
$Res call({
 ui.Color color
});




}
/// @nodoc
class _$BackgroundColorStateCopyWithImpl<$Res>
    implements $BackgroundColorStateCopyWith<$Res> {
  _$BackgroundColorStateCopyWithImpl(this._self, this._then);

  final BackgroundColorState _self;
  final $Res Function(BackgroundColorState) _then;

/// Create a copy of BackgroundColorState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? color = null,}) {
  return _then(BackgroundColorState(
color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as ui.Color,
  ));
}

}


/// Adds pattern-matching-related methods to [BackgroundColorState].
extension BackgroundColorStatePatterns on BackgroundColorState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BackgroundColorState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BackgroundColorState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BackgroundColorState value)  $default,){
final _that = this;
switch (_that) {
case _BackgroundColorState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BackgroundColorState value)?  $default,){
final _that = this;
switch (_that) {
case _BackgroundColorState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ui.Color color)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BackgroundColorState() when $default != null:
return $default(_that.color);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ui.Color color)  $default,) {final _that = this;
switch (_that) {
case _BackgroundColorState():
return $default(_that.color);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ui.Color color)?  $default,) {final _that = this;
switch (_that) {
case _BackgroundColorState() when $default != null:
return $default(_that.color);case _:
  return null;

}
}

}

/// @nodoc


class _BackgroundColorState implements BackgroundColorState {
  const _BackgroundColorState({this.color = const ui.Color(0xFF000000)});
  

@override@JsonKey() final  ui.Color color;

/// Create a copy of BackgroundColorState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BackgroundColorStateCopyWith<_BackgroundColorState> get copyWith => __$BackgroundColorStateCopyWithImpl<_BackgroundColorState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BackgroundColorState&&(identical(other.color, color) || other.color == color));
}


@override
int get hashCode {
    return Object.hash(runtimeType,color);
}

@override
String toString() {
    return 'BackgroundColorState(color: $color)';
}


}

/// @nodoc
abstract mixin class _$BackgroundColorStateCopyWith<$Res> implements $BackgroundColorStateCopyWith<$Res> {
  factory _$BackgroundColorStateCopyWith(_BackgroundColorState value, $Res Function(_BackgroundColorState) _then) = __$BackgroundColorStateCopyWithImpl;
@override @useResult
$Res call({
 ui.Color color
});




}
/// @nodoc
class __$BackgroundColorStateCopyWithImpl<$Res>
    implements _$BackgroundColorStateCopyWith<$Res> {
  __$BackgroundColorStateCopyWithImpl(this._self, this._then);

  final _BackgroundColorState _self;
  final $Res Function(_BackgroundColorState) _then;

/// Create a copy of BackgroundColorState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? color = null,}) {
  return _then(_BackgroundColorState(
color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as ui.Color,
  ));
}


}

// dart format on
