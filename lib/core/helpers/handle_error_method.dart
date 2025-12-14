import 'package:bookly_app/core/errors/error_handler.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';


/// Helper method to handle errors consistently across all API calls
class HandleErrorMethod {
  Either<Failure, List<BookModel>> handleError(dynamic exception) {
    if (exception is DioException) {
      return left(ServerFailure.fromDioException(exception));
    }
    return left(ServerFailure(exception.toString()));
  }
}