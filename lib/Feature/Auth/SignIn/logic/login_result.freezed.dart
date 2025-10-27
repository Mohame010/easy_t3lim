// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LoginResult {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginResult);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginResult()';
}


}

/// @nodoc
class $LoginResultCopyWith<$Res>  {
$LoginResultCopyWith(LoginResult _, $Res Function(LoginResult) __);
}


/// Adds pattern-matching-related methods to [LoginResult].
extension LoginResultPatterns on LoginResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoginSuccess value)?  success,TResult Function( LoginError value)?  error,TResult Function( LoginServerError value)?  serverError,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoginSuccess() when success != null:
return success(_that);case LoginError() when error != null:
return error(_that);case LoginServerError() when serverError != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoginSuccess value)  success,required TResult Function( LoginError value)  error,required TResult Function( LoginServerError value)  serverError,}){
final _that = this;
switch (_that) {
case LoginSuccess():
return success(_that);case LoginError():
return error(_that);case LoginServerError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoginSuccess value)?  success,TResult? Function( LoginError value)?  error,TResult? Function( LoginServerError value)?  serverError,}){
final _that = this;
switch (_that) {
case LoginSuccess() when success != null:
return success(_that);case LoginError() when error != null:
return error(_that);case LoginServerError() when serverError != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( LoginResponseModel userModel)?  success,TResult Function( LoginFailureResponseModel errorModel)?  error,TResult Function( ApiErrorModel errorModel)?  serverError,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoginSuccess() when success != null:
return success(_that.userModel);case LoginError() when error != null:
return error(_that.errorModel);case LoginServerError() when serverError != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( LoginResponseModel userModel)  success,required TResult Function( LoginFailureResponseModel errorModel)  error,required TResult Function( ApiErrorModel errorModel)  serverError,}) {final _that = this;
switch (_that) {
case LoginSuccess():
return success(_that.userModel);case LoginError():
return error(_that.errorModel);case LoginServerError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( LoginResponseModel userModel)?  success,TResult? Function( LoginFailureResponseModel errorModel)?  error,TResult? Function( ApiErrorModel errorModel)?  serverError,}) {final _that = this;
switch (_that) {
case LoginSuccess() when success != null:
return success(_that.userModel);case LoginError() when error != null:
return error(_that.errorModel);case LoginServerError() when serverError != null:
return serverError(_that.errorModel);case _:
  return null;

}
}

}

/// @nodoc


class LoginSuccess implements LoginResult {
  const LoginSuccess({required this.userModel});
  

 final  LoginResponseModel userModel;

/// Create a copy of LoginResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginSuccessCopyWith<LoginSuccess> get copyWith => _$LoginSuccessCopyWithImpl<LoginSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginSuccess&&(identical(other.userModel, userModel) || other.userModel == userModel));
}


@override
int get hashCode => Object.hash(runtimeType,userModel);

@override
String toString() {
  return 'LoginResult.success(userModel: $userModel)';
}


}

/// @nodoc
abstract mixin class $LoginSuccessCopyWith<$Res> implements $LoginResultCopyWith<$Res> {
  factory $LoginSuccessCopyWith(LoginSuccess value, $Res Function(LoginSuccess) _then) = _$LoginSuccessCopyWithImpl;
@useResult
$Res call({
 LoginResponseModel userModel
});




}
/// @nodoc
class _$LoginSuccessCopyWithImpl<$Res>
    implements $LoginSuccessCopyWith<$Res> {
  _$LoginSuccessCopyWithImpl(this._self, this._then);

  final LoginSuccess _self;
  final $Res Function(LoginSuccess) _then;

/// Create a copy of LoginResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userModel = null,}) {
  return _then(LoginSuccess(
userModel: null == userModel ? _self.userModel : userModel // ignore: cast_nullable_to_non_nullable
as LoginResponseModel,
  ));
}


}

/// @nodoc


class LoginError implements LoginResult {
  const LoginError({required this.errorModel});
  

 final  LoginFailureResponseModel errorModel;

/// Create a copy of LoginResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginErrorCopyWith<LoginError> get copyWith => _$LoginErrorCopyWithImpl<LoginError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginError&&(identical(other.errorModel, errorModel) || other.errorModel == errorModel));
}


@override
int get hashCode => Object.hash(runtimeType,errorModel);

@override
String toString() {
  return 'LoginResult.error(errorModel: $errorModel)';
}


}

/// @nodoc
abstract mixin class $LoginErrorCopyWith<$Res> implements $LoginResultCopyWith<$Res> {
  factory $LoginErrorCopyWith(LoginError value, $Res Function(LoginError) _then) = _$LoginErrorCopyWithImpl;
@useResult
$Res call({
 LoginFailureResponseModel errorModel
});




}
/// @nodoc
class _$LoginErrorCopyWithImpl<$Res>
    implements $LoginErrorCopyWith<$Res> {
  _$LoginErrorCopyWithImpl(this._self, this._then);

  final LoginError _self;
  final $Res Function(LoginError) _then;

/// Create a copy of LoginResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorModel = null,}) {
  return _then(LoginError(
errorModel: null == errorModel ? _self.errorModel : errorModel // ignore: cast_nullable_to_non_nullable
as LoginFailureResponseModel,
  ));
}


}

/// @nodoc


class LoginServerError implements LoginResult {
  const LoginServerError({required this.errorModel});
  

 final  ApiErrorModel errorModel;

/// Create a copy of LoginResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginServerErrorCopyWith<LoginServerError> get copyWith => _$LoginServerErrorCopyWithImpl<LoginServerError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginServerError&&(identical(other.errorModel, errorModel) || other.errorModel == errorModel));
}


@override
int get hashCode => Object.hash(runtimeType,errorModel);

@override
String toString() {
  return 'LoginResult.serverError(errorModel: $errorModel)';
}


}

/// @nodoc
abstract mixin class $LoginServerErrorCopyWith<$Res> implements $LoginResultCopyWith<$Res> {
  factory $LoginServerErrorCopyWith(LoginServerError value, $Res Function(LoginServerError) _then) = _$LoginServerErrorCopyWithImpl;
@useResult
$Res call({
 ApiErrorModel errorModel
});




}
/// @nodoc
class _$LoginServerErrorCopyWithImpl<$Res>
    implements $LoginServerErrorCopyWith<$Res> {
  _$LoginServerErrorCopyWithImpl(this._self, this._then);

  final LoginServerError _self;
  final $Res Function(LoginServerError) _then;

/// Create a copy of LoginResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorModel = null,}) {
  return _then(LoginServerError(
errorModel: null == errorModel ? _self.errorModel : errorModel // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}


}

// dart format on
