// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'screen_capture.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ScreenCapture {


/// Create a copy of ScreenCapture
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScreenCaptureCopyWith<ScreenCapture> get copyWith => _$ScreenCaptureCopyWithImpl<ScreenCapture>(this as ScreenCapture, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ScreenCapture;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScreenCapture&&(identical(other.image, _this.image) || other.image == _this.image)&&(identical(other.scale, _this.scale) || other.scale == _this.scale)&&(identical(other.pixels, _this.pixels) || other.pixels == _this.pixels));
}


@override
int get hashCode {
  final _this = this as ScreenCapture;
  return Object.hash(runtimeType,_this.image,_this.scale,_this.pixels);
}

@override
String toString() {
  final _this = this as ScreenCapture;
  return 'ScreenCapture(image: ${_this.image}, scale: ${_this.scale}, pixels: ${_this.pixels})';
}


}

/// @nodoc
abstract mixin class $ScreenCaptureCopyWith<$Res>  {
  factory $ScreenCaptureCopyWith(ScreenCapture value, $Res Function(ScreenCapture) _then) = _$ScreenCaptureCopyWithImpl;
@useResult
$Res call({
 ui.Image image, double scale, PixelBuffer pixels
});




}
/// @nodoc
class _$ScreenCaptureCopyWithImpl<$Res>
    implements $ScreenCaptureCopyWith<$Res> {
  _$ScreenCaptureCopyWithImpl(this._self, this._then);

  final ScreenCapture _self;
  final $Res Function(ScreenCapture) _then;

/// Create a copy of ScreenCapture
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? image = null,Object? scale = null,Object? pixels = null,}) {
  return _then(ScreenCapture(
image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as ui.Image,scale: null == scale ? _self.scale : scale // ignore: cast_nullable_to_non_nullable
as double,pixels: null == pixels ? _self.pixels : pixels // ignore: cast_nullable_to_non_nullable
as PixelBuffer,
  ));
}

}



// dart format on
