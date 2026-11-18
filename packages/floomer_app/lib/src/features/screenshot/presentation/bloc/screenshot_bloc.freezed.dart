// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'screenshot_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ScreenshotEvent {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ScreenshotEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ScreenshotEvent()';
}


}

/// @nodoc
class $ScreenshotEventCopyWith<$Res>  {
$ScreenshotEventCopyWith(ScreenshotEvent _, $Res Function(ScreenshotEvent) __);
}


/// Adds pattern-matching-related methods to [ScreenshotEvent].
extension ScreenshotEventPatterns on ScreenshotEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Requested value)?  requested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Requested() when requested != null:
return requested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Requested value)  requested,}){
final _that = this;
switch (_that) {
case _Requested():
return requested(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Requested value)?  requested,}){
final _that = this;
switch (_that) {
case _Requested() when requested != null:
return requested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  requested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Requested() when requested != null:
return requested();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  requested,}) {final _that = this;
switch (_that) {
case _Requested():
return requested();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  requested,}) {final _that = this;
switch (_that) {
case _Requested() when requested != null:
return requested();case _:
  return null;

}
}

}

/// @nodoc


class _Requested implements ScreenshotEvent {
  const _Requested();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Requested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ScreenshotEvent.requested()';
}


}




/// @nodoc
mixin _$ScreenshotState {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ScreenshotState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ScreenshotState()';
}


}

/// @nodoc
class $ScreenshotStateCopyWith<$Res>  {
$ScreenshotStateCopyWith(ScreenshotState _, $Res Function(ScreenshotState) __);
}


/// Adds pattern-matching-related methods to [ScreenshotState].
extension ScreenshotStatePatterns on ScreenshotState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _InProgress value)?  inProgress,TResult Function( _Ready value)?  ready,TResult Function( _Failed value)?  failed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _InProgress() when inProgress != null:
return inProgress(_that);case _Ready() when ready != null:
return ready(_that);case _Failed() when failed != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _InProgress value)  inProgress,required TResult Function( _Ready value)  ready,required TResult Function( _Failed value)  failed,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _InProgress():
return inProgress(_that);case _Ready():
return ready(_that);case _Failed():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _InProgress value)?  inProgress,TResult? Function( _Ready value)?  ready,TResult? Function( _Failed value)?  failed,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _InProgress() when inProgress != null:
return inProgress(_that);case _Ready() when ready != null:
return ready(_that);case _Failed() when failed != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  inProgress,TResult Function( ScreenCapture screenshot)?  ready,TResult Function( ScreenshotFailure failure)?  failed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _InProgress() when inProgress != null:
return inProgress();case _Ready() when ready != null:
return ready(_that.screenshot);case _Failed() when failed != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  inProgress,required TResult Function( ScreenCapture screenshot)  ready,required TResult Function( ScreenshotFailure failure)  failed,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _InProgress():
return inProgress();case _Ready():
return ready(_that.screenshot);case _Failed():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  inProgress,TResult? Function( ScreenCapture screenshot)?  ready,TResult? Function( ScreenshotFailure failure)?  failed,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _InProgress() when inProgress != null:
return inProgress();case _Ready() when ready != null:
return ready(_that.screenshot);case _Failed() when failed != null:
return failed(_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _Initial extends ScreenshotState {
  const _Initial(): super._();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ScreenshotState.initial()';
}


}




/// @nodoc


class _InProgress extends ScreenshotState {
  const _InProgress(): super._();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _InProgress);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ScreenshotState.inProgress()';
}


}




/// @nodoc


class _Ready extends ScreenshotState {
  const _Ready(this.screenshot): super._();
  

 final  ScreenCapture screenshot;

/// Create a copy of ScreenshotState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReadyCopyWith<_Ready> get copyWith => __$ReadyCopyWithImpl<_Ready>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Ready&&(identical(other.screenshot, screenshot) || other.screenshot == screenshot));
}


@override
int get hashCode {
    return Object.hash(runtimeType,screenshot);
}

@override
String toString() {
    return 'ScreenshotState.ready(screenshot: $screenshot)';
}


}

/// @nodoc
abstract mixin class _$ReadyCopyWith<$Res> implements $ScreenshotStateCopyWith<$Res> {
  factory _$ReadyCopyWith(_Ready value, $Res Function(_Ready) _then) = __$ReadyCopyWithImpl;
@useResult
$Res call({
 ScreenCapture screenshot
});


$ScreenCaptureCopyWith<$Res> get screenshot;

}
/// @nodoc
class __$ReadyCopyWithImpl<$Res>
    implements _$ReadyCopyWith<$Res> {
  __$ReadyCopyWithImpl(this._self, this._then);

  final _Ready _self;
  final $Res Function(_Ready) _then;

/// Create a copy of ScreenshotState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? screenshot = null,}) {
  return _then(_Ready(
null == screenshot ? _self.screenshot : screenshot // ignore: cast_nullable_to_non_nullable
as ScreenCapture,
  ));
}

/// Create a copy of ScreenshotState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ScreenCaptureCopyWith<$Res> get screenshot {
  
  return $ScreenCaptureCopyWith<$Res>(_self.screenshot, (value) {
    return _then(_self.copyWith(screenshot: value));
  });
}
}

/// @nodoc


class _Failed extends ScreenshotState {
  const _Failed(this.failure): super._();
  

 final  ScreenshotFailure failure;

/// Create a copy of ScreenshotState
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
    return 'ScreenshotState.failed(failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$FailedCopyWith<$Res> implements $ScreenshotStateCopyWith<$Res> {
  factory _$FailedCopyWith(_Failed value, $Res Function(_Failed) _then) = __$FailedCopyWithImpl;
@useResult
$Res call({
 ScreenshotFailure failure
});


$ScreenshotFailureCopyWith<$Res> get failure;

}
/// @nodoc
class __$FailedCopyWithImpl<$Res>
    implements _$FailedCopyWith<$Res> {
  __$FailedCopyWithImpl(this._self, this._then);

  final _Failed _self;
  final $Res Function(_Failed) _then;

/// Create a copy of ScreenshotState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(_Failed(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as ScreenshotFailure,
  ));
}

/// Create a copy of ScreenshotState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ScreenshotFailureCopyWith<$Res> get failure {
  
  return $ScreenshotFailureCopyWith<$Res>(_self.failure, (value) {
    return _then(_self.copyWith(failure: value));
  });
}
}

// dart format on
