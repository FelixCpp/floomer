// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_window_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppWindowEvent {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AppWindowEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'AppWindowEvent()';
}


}

/// @nodoc
class $AppWindowEventCopyWith<$Res>  {
$AppWindowEventCopyWith(AppWindowEvent _, $Res Function(AppWindowEvent) __);
}


/// Adds pattern-matching-related methods to [AppWindowEvent].
extension AppWindowEventPatterns on AppWindowEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _ShowRequested value)?  showRequested,TResult Function( _ScreenRecordingSettingsRequested value)?  screenRecordingSettingsRequested,TResult Function( _CloseRequested value)?  closeRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShowRequested() when showRequested != null:
return showRequested(_that);case _ScreenRecordingSettingsRequested() when screenRecordingSettingsRequested != null:
return screenRecordingSettingsRequested(_that);case _CloseRequested() when closeRequested != null:
return closeRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _ShowRequested value)  showRequested,required TResult Function( _ScreenRecordingSettingsRequested value)  screenRecordingSettingsRequested,required TResult Function( _CloseRequested value)  closeRequested,}){
final _that = this;
switch (_that) {
case _ShowRequested():
return showRequested(_that);case _ScreenRecordingSettingsRequested():
return screenRecordingSettingsRequested(_that);case _CloseRequested():
return closeRequested(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _ShowRequested value)?  showRequested,TResult? Function( _ScreenRecordingSettingsRequested value)?  screenRecordingSettingsRequested,TResult? Function( _CloseRequested value)?  closeRequested,}){
final _that = this;
switch (_that) {
case _ShowRequested() when showRequested != null:
return showRequested(_that);case _ScreenRecordingSettingsRequested() when screenRecordingSettingsRequested != null:
return screenRecordingSettingsRequested(_that);case _CloseRequested() when closeRequested != null:
return closeRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  showRequested,TResult Function()?  screenRecordingSettingsRequested,TResult Function()?  closeRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShowRequested() when showRequested != null:
return showRequested();case _ScreenRecordingSettingsRequested() when screenRecordingSettingsRequested != null:
return screenRecordingSettingsRequested();case _CloseRequested() when closeRequested != null:
return closeRequested();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  showRequested,required TResult Function()  screenRecordingSettingsRequested,required TResult Function()  closeRequested,}) {final _that = this;
switch (_that) {
case _ShowRequested():
return showRequested();case _ScreenRecordingSettingsRequested():
return screenRecordingSettingsRequested();case _CloseRequested():
return closeRequested();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  showRequested,TResult? Function()?  screenRecordingSettingsRequested,TResult? Function()?  closeRequested,}) {final _that = this;
switch (_that) {
case _ShowRequested() when showRequested != null:
return showRequested();case _ScreenRecordingSettingsRequested() when screenRecordingSettingsRequested != null:
return screenRecordingSettingsRequested();case _CloseRequested() when closeRequested != null:
return closeRequested();case _:
  return null;

}
}

}

/// @nodoc


class _ShowRequested implements AppWindowEvent {
  const _ShowRequested();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShowRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'AppWindowEvent.showRequested()';
}


}




/// @nodoc


class _ScreenRecordingSettingsRequested implements AppWindowEvent {
  const _ScreenRecordingSettingsRequested();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScreenRecordingSettingsRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'AppWindowEvent.screenRecordingSettingsRequested()';
}


}




/// @nodoc


class _CloseRequested implements AppWindowEvent {
  const _CloseRequested();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CloseRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'AppWindowEvent.closeRequested()';
}


}




/// @nodoc
mixin _$AppWindowState {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AppWindowState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'AppWindowState()';
}


}

/// @nodoc
class $AppWindowStateCopyWith<$Res>  {
$AppWindowStateCopyWith(AppWindowState _, $Res Function(AppWindowState) __);
}


/// Adds pattern-matching-related methods to [AppWindowState].
extension AppWindowStatePatterns on AppWindowState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Hidden value)?  hidden,TResult Function( _Visible value)?  visible,TResult Function( _Failed value)?  failed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Hidden() when hidden != null:
return hidden(_that);case _Visible() when visible != null:
return visible(_that);case _Failed() when failed != null:
return failed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Hidden value)  hidden,required TResult Function( _Visible value)  visible,required TResult Function( _Failed value)  failed,}){
final _that = this;
switch (_that) {
case _Hidden():
return hidden(_that);case _Visible():
return visible(_that);case _Failed():
return failed(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Hidden value)?  hidden,TResult? Function( _Visible value)?  visible,TResult? Function( _Failed value)?  failed,}){
final _that = this;
switch (_that) {
case _Hidden() when hidden != null:
return hidden(_that);case _Visible() when visible != null:
return visible(_that);case _Failed() when failed != null:
return failed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  hidden,TResult Function()?  visible,TResult Function( AppWindowFailure failure)?  failed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Hidden() when hidden != null:
return hidden();case _Visible() when visible != null:
return visible();case _Failed() when failed != null:
return failed(_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  hidden,required TResult Function()  visible,required TResult Function( AppWindowFailure failure)  failed,}) {final _that = this;
switch (_that) {
case _Hidden():
return hidden();case _Visible():
return visible();case _Failed():
return failed(_that.failure);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  hidden,TResult? Function()?  visible,TResult? Function( AppWindowFailure failure)?  failed,}) {final _that = this;
switch (_that) {
case _Hidden() when hidden != null:
return hidden();case _Visible() when visible != null:
return visible();case _Failed() when failed != null:
return failed(_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _Hidden implements AppWindowState {
  const _Hidden();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Hidden);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'AppWindowState.hidden()';
}


}




/// @nodoc


class _Visible implements AppWindowState {
  const _Visible();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Visible);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'AppWindowState.visible()';
}


}




/// @nodoc


class _Failed implements AppWindowState {
  const _Failed(this.failure);
  

 final  AppWindowFailure failure;

/// Create a copy of AppWindowState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FailedCopyWith<_Failed> get copyWith => __$FailedCopyWithImpl<_Failed>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Failed&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode {
    return Object.hash(runtimeType,failure);
}

@override
String toString() {
    return 'AppWindowState.failed(failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$FailedCopyWith<$Res> implements $AppWindowStateCopyWith<$Res> {
  factory _$FailedCopyWith(_Failed value, $Res Function(_Failed) _then) = __$FailedCopyWithImpl;
@useResult
$Res call({
 AppWindowFailure failure
});


$AppWindowFailureCopyWith<$Res> get failure;

}
/// @nodoc
class __$FailedCopyWithImpl<$Res>
    implements _$FailedCopyWith<$Res> {
  __$FailedCopyWithImpl(this._self, this._then);

  final _Failed _self;
  final $Res Function(_Failed) _then;

/// Create a copy of AppWindowState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(_Failed(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as AppWindowFailure,
  ));
}

/// Create a copy of AppWindowState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppWindowFailureCopyWith<$Res> get failure {
  
  return $AppWindowFailureCopyWith<$Res>(_self.failure, (value) {
    return _then(_self.copyWith(failure: value));
  });
}
}

// dart format on
