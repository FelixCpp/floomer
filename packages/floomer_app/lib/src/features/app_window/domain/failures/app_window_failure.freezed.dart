// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_window_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppWindowFailure {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AppWindowFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'AppWindowFailure()';
}


}

/// @nodoc
class $AppWindowFailureCopyWith<$Res>  {
$AppWindowFailureCopyWith(AppWindowFailure _, $Res Function(AppWindowFailure) __);
}


/// Adds pattern-matching-related methods to [AppWindowFailure].
extension AppWindowFailurePatterns on AppWindowFailure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SettingsUnavailableFailure value)?  settingsUnavailable,TResult Function( UnexpectedAppWindowFailure value)?  unexpected,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SettingsUnavailableFailure() when settingsUnavailable != null:
return settingsUnavailable(_that);case UnexpectedAppWindowFailure() when unexpected != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SettingsUnavailableFailure value)  settingsUnavailable,required TResult Function( UnexpectedAppWindowFailure value)  unexpected,}){
final _that = this;
switch (_that) {
case SettingsUnavailableFailure():
return settingsUnavailable(_that);case UnexpectedAppWindowFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SettingsUnavailableFailure value)?  settingsUnavailable,TResult? Function( UnexpectedAppWindowFailure value)?  unexpected,}){
final _that = this;
switch (_that) {
case SettingsUnavailableFailure() when settingsUnavailable != null:
return settingsUnavailable(_that);case UnexpectedAppWindowFailure() when unexpected != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  settingsUnavailable,TResult Function( String message)?  unexpected,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SettingsUnavailableFailure() when settingsUnavailable != null:
return settingsUnavailable();case UnexpectedAppWindowFailure() when unexpected != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  settingsUnavailable,required TResult Function( String message)  unexpected,}) {final _that = this;
switch (_that) {
case SettingsUnavailableFailure():
return settingsUnavailable();case UnexpectedAppWindowFailure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  settingsUnavailable,TResult? Function( String message)?  unexpected,}) {final _that = this;
switch (_that) {
case SettingsUnavailableFailure() when settingsUnavailable != null:
return settingsUnavailable();case UnexpectedAppWindowFailure() when unexpected != null:
return unexpected(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class SettingsUnavailableFailure implements AppWindowFailure {
  const SettingsUnavailableFailure();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SettingsUnavailableFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'AppWindowFailure.settingsUnavailable()';
}


}




/// @nodoc


class UnexpectedAppWindowFailure implements AppWindowFailure {
  const UnexpectedAppWindowFailure(this.message);
  

 final  String message;

/// Create a copy of AppWindowFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnexpectedAppWindowFailureCopyWith<UnexpectedAppWindowFailure> get copyWith => _$UnexpectedAppWindowFailureCopyWithImpl<UnexpectedAppWindowFailure>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is UnexpectedAppWindowFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode {
    return Object.hash(runtimeType,message);
}

@override
String toString() {
    return 'AppWindowFailure.unexpected(message: $message)';
}


}

/// @nodoc
abstract mixin class $UnexpectedAppWindowFailureCopyWith<$Res> implements $AppWindowFailureCopyWith<$Res> {
  factory $UnexpectedAppWindowFailureCopyWith(UnexpectedAppWindowFailure value, $Res Function(UnexpectedAppWindowFailure) _then) = _$UnexpectedAppWindowFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$UnexpectedAppWindowFailureCopyWithImpl<$Res>
    implements $UnexpectedAppWindowFailureCopyWith<$Res> {
  _$UnexpectedAppWindowFailureCopyWithImpl(this._self, this._then);

  final UnexpectedAppWindowFailure _self;
  final $Res Function(UnexpectedAppWindowFailure) _then;

/// Create a copy of AppWindowFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(UnexpectedAppWindowFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
