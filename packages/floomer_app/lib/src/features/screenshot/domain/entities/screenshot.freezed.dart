// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'screenshot.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Screenshot {


/// Create a copy of Screenshot
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScreenshotCopyWith<Screenshot> get copyWith => _$ScreenshotCopyWithImpl<Screenshot>(this as Screenshot, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as Screenshot;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Screenshot&&(identical(other.image, _this.image) || other.image == _this.image)&&(identical(other.scale, _this.scale) || other.scale == _this.scale));
}


@override
int get hashCode {
  final _this = this as Screenshot;
  return Object.hash(runtimeType,_this.image,_this.scale);
}

@override
String toString() {
  final _this = this as Screenshot;
  return 'Screenshot(image: ${_this.image}, scale: ${_this.scale})';
}


}

/// @nodoc
abstract mixin class $ScreenshotCopyWith<$Res>  {
  factory $ScreenshotCopyWith(Screenshot value, $Res Function(Screenshot) _then) = _$ScreenshotCopyWithImpl;
@useResult
$Res call({
 ui.Image image, double scale
});




}
/// @nodoc
class _$ScreenshotCopyWithImpl<$Res>
    implements $ScreenshotCopyWith<$Res> {
  _$ScreenshotCopyWithImpl(this._self, this._then);

  final Screenshot _self;
  final $Res Function(Screenshot) _then;

/// Create a copy of Screenshot
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? image = null,Object? scale = null,}) {
  return _then(Screenshot(
image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as ui.Image,scale: null == scale ? _self.scale : scale // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}



// dart format on
