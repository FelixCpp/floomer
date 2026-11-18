// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'screen_capture_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ScreenCaptureDto {


/// Create a copy of ScreenCaptureDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScreenCaptureDtoCopyWith<ScreenCaptureDto> get copyWith => _$ScreenCaptureDtoCopyWithImpl<ScreenCaptureDto>(this as ScreenCaptureDto, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ScreenCaptureDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScreenCaptureDto&&const DeepCollectionEquality().equals(other.pixels, _this.pixels)&&(identical(other.width, _this.width) || other.width == _this.width)&&(identical(other.height, _this.height) || other.height == _this.height)&&(identical(other.bytesPerRow, _this.bytesPerRow) || other.bytesPerRow == _this.bytesPerRow)&&(identical(other.scale, _this.scale) || other.scale == _this.scale));
}


@override
int get hashCode {
  final _this = this as ScreenCaptureDto;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.pixels),_this.width,_this.height,_this.bytesPerRow,_this.scale);
}

@override
String toString() {
  final _this = this as ScreenCaptureDto;
  return 'ScreenCaptureDto(pixels: ${_this.pixels}, width: ${_this.width}, height: ${_this.height}, bytesPerRow: ${_this.bytesPerRow}, scale: ${_this.scale})';
}


}

/// @nodoc
abstract mixin class $ScreenCaptureDtoCopyWith<$Res>  {
  factory $ScreenCaptureDtoCopyWith(ScreenCaptureDto value, $Res Function(ScreenCaptureDto) _then) = _$ScreenCaptureDtoCopyWithImpl;
@useResult
$Res call({
 Uint8List pixels, int width, int height, int bytesPerRow, double scale
});




}
/// @nodoc
class _$ScreenCaptureDtoCopyWithImpl<$Res>
    implements $ScreenCaptureDtoCopyWith<$Res> {
  _$ScreenCaptureDtoCopyWithImpl(this._self, this._then);

  final ScreenCaptureDto _self;
  final $Res Function(ScreenCaptureDto) _then;

/// Create a copy of ScreenCaptureDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pixels = null,Object? width = null,Object? height = null,Object? bytesPerRow = null,Object? scale = null,}) {
  return _then(ScreenCaptureDto(
pixels: null == pixels ? _self.pixels : pixels // ignore: cast_nullable_to_non_nullable
as Uint8List,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int,bytesPerRow: null == bytesPerRow ? _self.bytesPerRow : bytesPerRow // ignore: cast_nullable_to_non_nullable
as int,scale: null == scale ? _self.scale : scale // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [ScreenCaptureDto].
extension ScreenCaptureDtoPatterns on ScreenCaptureDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({required TResult orElse(),}){
final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({required TResult orElse(),}) {final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  return null;

}
}

}

// dart format on
