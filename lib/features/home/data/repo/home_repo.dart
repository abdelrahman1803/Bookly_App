import 'package:bookly_app/core/errors/error_handler.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookModel>>> fetchLatestBooks();
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks();
  Future<Either<Failure, List<BookModel>>> fetchRelatedBooks({
    required String category,
  });
  Future<Either<Failure,List<BookModel>>> fetchSearchBooks({required String title});
}
