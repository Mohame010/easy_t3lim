// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signup_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SignupResult {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignupResult);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SignupResult()';
}


}

/// @nodoc
class $SignupResultCopyWith<$Res>  {
$SignupResultCopyWith(SignupResult _, $Res Function(SignupResult) __);
}


/// Adds pattern-matching-related methods to [SignupResult].
extension SignupResultPatterns on SignupResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SignupSuccess value)?  success,TResult Function( SignupError value)?  error,TResult Function( SignupServerError value)?  serverError,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SignupSuccess() when success != null:
return success(_that);case SignupError() when error != null:
return error(_that);case SignupServerError() when serverError != null:
return serverError(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SignupSuccess value)  success,required TResult Function( SignupError value)  error,required TResult Function( SignupServerError value)  serverError,}){
final _that = this;
switch (_that) {
case SignupSuccess():
return success(_that);case SignupError():
return error(_that);case SignupServerError():
return serverError(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SignupSuccess value)?  success,TResult? Function( SignupError value)?  error,TResult? Function( SignupServerError value)?  serverError,}){
final _that = this;
switch (_that) {
case SignupSuccess() when success != null:
return success(_that);case SignupError() when error != null:
return error(_that);case SignupServerError() when serverError != null:
return serverError(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( SignupSucessfullyResponseModel userModel)?  success,TResult Function( SignupErrorResponseModel errorModel)?  error,TResult Function( ApiErrorModel errorModel)?  serverError,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SignupSuccess() when success != null:
return success(_that.userModel);case SignupError() when error != null:
return error(_that.errorModel);case SignupServerError() when serverError != null:
return serverError(_that.errorModel);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( SignupSucessfullyResponseModel userModel)  success,required TResult Function( SignupErrorResponseModel errorModel)  error,required TResult Function( ApiErrorModel errorModel)  serverError,}) {final _that = this;
switch (_that) {
case SignupSuccess():
return success(_that.userModel);case SignupError():
return error(_that.errorModel);case SignupServerError():
return serverError(_that.errorModel);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( SignupSucessfullyResponseModel userModel)?  success,TResult? Function( SignupErrorResponseModel errorModel)?  error,TResult? Function( ApiErrorModel errorModel)?  serverError,}) {final _that = this;
switch (_that) {
case SignupSuccess() when success != null:
return success(_that.userModel);case SignupError() when error != null:
return error(_that.errorModel);case SignupServerError() when serverError != null:
return serverError(_that.errorModel);case _:
  return null;

}
}

}

/// @nodoc


class SignupSuccess implements SignupResult {
  const SignupSuccess({required this.userModel});
  

 final  SignupSucessfullyResponseModel userModel;

/// Create a copy of SignupResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignupSuccessCopyWith<SignupSuccess> get copyWith => _$SignupSuccessCopyWithImpl<SignupSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignupSuccess&&(identical(other.userModel, userModel) || other.userModel == userModel));
}


@override
int get hashCode => Object.hash(runtimeType,userModel);

@override
String toString() {
  return 'SignupResult.success(userModel: $userModel)';
}


}

/// @nodoc
abstract mixin class $SignupSuccessCopyWith<$Res> implements $SignupResultCopyWith<$Res> {
  factory $SignupSuccessCopyWith(SignupSuccess value, $Res Function(SignupSuccess) _then) = _$SignupSuccessCopyWithImpl;
@useResult
$Res call({
 SignupSucessfullyResponseModel userModel
});




}
/// @nodoc
class _$SignupSuccessCopyWithImpl<$Res>
    implements $SignupSuccessCopyWith<$Res> {
  _$SignupSuccessCopyWithImpl(this._self, this._then);

  final SignupSuccess _self;
  final $Res Function(SignupSuccess) _then;

/// Create a copy of SignupResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userModel = null,}) {
  return _then(SignupSuccess(
userModel: null == userModel ? _self.userModel : userModel // ignore: cast_nullable_to_non_nullable
as SignupSucessfullyResponseModel,
  ));
}


}

/// @nodoc


class SignupError implements SignupResult {
  const SignupError({required this.errorModel});
  

 final  SignupErrorResponseModel errorModel;

/// Create a copy of SignupResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignupErrorCopyWith<SignupError> get copyWith => _$SignupErrorCopyWithImpl<SignupError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignupError&&(identical(other.errorModel, errorModel) || other.errorModel == errorModel));
}


@override
int get hashCode => Object.hash(runtimeType,errorModel);

@override
String toString() {
  return 'SignupResult.error(errorModel: $errorModel)';
}


}

/// @nodoc
abstract mixin class $SignupErrorCopyWith<$Res> implements $SignupResultCopyWith<$Res> {
  factory $SignupErrorCopyWith(SignupError value, $Res Function(SignupError) _then) = _$SignupErrorCopyWithImpl;
@useResult
$Res call({
 SignupErrorResponseModel errorModel
});




}
/// @nodoc
class _$SignupErrorCopyWithImpl<$Res>
    implements $SignupErrorCopyWith<$Res> {
  _$SignupErrorCopyWithImpl(this._self, this._then);

  final SignupError _self;
  final $Res Function(SignupError) _then;

/// Create a copy of SignupResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorModel = null,}) {
  return _then(SignupError(
errorModel: null == errorModel ? _self.errorModel : errorModel // ignore: cast_nullable_to_non_nullable
as SignupErrorResponseModel,
  ));
}


}

/// @nodoc


class SignupServerError implements SignupResult {
  const SignupServerError({required this.errorModel});
  

 final  ApiErrorModel errorModel;

/// Create a copy of SignupResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignupServerErrorCopyWith<SignupServerError> get copyWith => _$SignupServerErrorCopyWithImpl<SignupServerError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignupServerError&&(identical(other.errorModel, errorModel) || other.errorModel == errorModel));
}


@override
int get hashCode => Object.hash(runtimeType,errorModel);

@override
String toString() {
  return 'SignupResult.serverError(errorModel: $errorModel)';
}


}

/// @nodoc
abstract mixin class $SignupServerErrorCopyWith<$Res> implements $SignupResultCopyWith<$Res> {
  factory $SignupServerErrorCopyWith(SignupServerError value, $Res Function(SignupServerError) _then) = _$SignupServerErrorCopyWithImpl;
@useResult
$Res call({
 ApiErrorModel errorModel
});




}
/// @nodoc
class _$SignupServerErrorCopyWithImpl<$Res>
    implements $SignupServerErrorCopyWith<$Res> {
  _$SignupServerErrorCopyWithImpl(this._self, this._then);

  final SignupServerError _self;
  final $Res Function(SignupServerError) _then;

/// Create a copy of SignupResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorModel = null,}) {
  return _then(SignupServerError(
errorModel: null == errorModel ? _self.errorModel : errorModel // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}


}

// dart format on
