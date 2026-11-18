// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'screenshot_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ScreenshotFailure {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ScreenshotFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ScreenshotFailure()';
}


}

/// @nodoc
class $ScreenshotFailureCopyWith<$Res>  {
$ScreenshotFailureCopyWith(ScreenshotFailure _, $Res Function(ScreenshotFailure) __);
}


/// Adds pattern-matching-related methods to [ScreenshotFailure].
extension ScreenshotFailurePatterns on ScreenshotFailure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _PermissionDenied value)?  permissionDenied,TResult Function( _NoDisplay value)?  noDisplay,TResult Function( _ConversionFailed value)?  conversionFailed,TResult Function( _Unexpected value)?  unexpected,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PermissionDenied() when permissionDenied != null:
return permissionDenied(_that);case _NoDisplay() when noDisplay != null:
return noDisplay(_that);case _ConversionFailed() when conversionFailed != null:
return conversionFailed(_that);case _Unexpected() when unexpected != null:
return unexpected(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _PermissionDenied value)  permissionDenied,required TResult Function( _NoDisplay value)  noDisplay,required TResult Function( _ConversionFailed value)  conversionFailed,required TResult Function( _Unexpected value)  unexpected,}){
final _that = this;
switch (_that) {
case _PermissionDenied():
return permissionDenied(_that);case _NoDisplay():
return noDisplay(_that);case _ConversionFailed():
return conversionFailed(_that);case _Unexpected():
return unexpected(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _PermissionDenied value)?  permissionDenied,TResult? Function( _NoDisplay value)?  noDisplay,TResult? Function( _ConversionFailed value)?  conversionFailed,TResult? Function( _Unexpected value)?  unexpected,}){
final _that = this;
switch (_that) {
case _PermissionDenied() when permissionDenied != null:
return permissionDenied(_that);case _NoDisplay() when noDisplay != null:
return noDisplay(_that);case _ConversionFailed() when conversionFailed != null:
return conversionFailed(_that);case _Unexpected() when unexpected != null:
return unexpected(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  permissionDenied,TResult Function()?  noDisplay,TResult Function()?  conversionFailed,TResult Function( String message)?  unexpected,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PermissionDenied() when permissionDenied != null:
return permissionDenied();case _NoDisplay() when noDisplay != null:
return noDisplay();case _ConversionFailed() when conversionFailed != null:
return conversionFailed();case _Unexpected() when unexpected != null:
return unexpected(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  permissionDenied,required TResult Function()  noDisplay,required TResult Function()  conversionFailed,required TResult Function( String message)  unexpected,}) {final _that = this;
switch (_that) {
case _PermissionDenied():
return permissionDenied();case _NoDisplay():
return noDisplay();case _ConversionFailed():
return conversionFailed();case _Unexpected():
return unexpected(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  permissionDenied,TResult? Function()?  noDisplay,TResult? Function()?  conversionFailed,TResult? Function( String message)?  unexpected,}) {final _that = this;
switch (_that) {
case _PermissionDenied() when permissionDenied != null:
return permissionDenied();case _NoDisplay() when noDisplay != null:
return noDisplay();case _ConversionFailed() when conversionFailed != null:
return conversionFailed();case _Unexpected() when unexpected != null:
return unexpected(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _PermissionDenied implements ScreenshotFailure {
  const _PermissionDenied();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PermissionDenied);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ScreenshotFailure.permissionDenied()';
}


}




/// @nodoc


class _NoDisplay implements ScreenshotFailure {
  const _NoDisplay();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _NoDisplay);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ScreenshotFailure.noDisplay()';
}


}




/// @nodoc


class _ConversionFailed implements ScreenshotFailure {
  const _ConversionFailed();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConversionFailed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ScreenshotFailure.conversionFailed()';
}


}




/// @nodoc


class _Unexpected implements ScreenshotFailure {
  const _Unexpected(this.message);
  

 final  String message;

/// Create a copy of ScreenshotFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UnexpectedCopyWith<_Unexpected> get copyWith => __$UnexpectedCopyWithImpl<_Unexpected>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Unexpected&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode {
    return Object.hash(runtimeType,message);
}

@override
String toString() {
    return 'ScreenshotFailure.unexpected(message: $message)';
}


}

/// @nodoc
abstract mixin class _$UnexpectedCopyWith<$Res> implements $ScreenshotFailureCopyWith<$Res> {
  factory _$UnexpectedCopyWith(_Unexpected value, $Res Function(_Unexpected) _then) = __$UnexpectedCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$UnexpectedCopyWithImpl<$Res>
    implements _$UnexpectedCopyWith<$Res> {
  __$UnexpectedCopyWithImpl(this._self, this._then);

  final _Unexpected _self;
  final $Res Function(_Unexpected) _then;

/// Create a copy of ScreenshotFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Unexpected(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
