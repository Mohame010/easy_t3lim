
sealed class ApiResult<T> {
  const factory ApiResult.success(T data) = Success<T>;
  const factory ApiResult.failure(String error) = Failure<T>;
}

class Success<T> implements ApiResult<T> {
  final T data;

  const Success(this.data);
}

class Failure<T> implements ApiResult<T> {
  final String error;

  const Failure(this.error);
}
// try and catch عشان تهندل مكان
extension ApiResultX<T> on ApiResult<T> {
  R when<R>({
    required R Function(T data) success,
    required R Function(String error) failure,
  }) {
    if (this is Success<T>) {
      return success((this as Success<T>).data);
    } else if (this is Failure<T>) {
      return failure((this as Failure<T>).error);
    } else {
      throw Exception('Unhandled ApiResult type: $this');
    }
  }
}
