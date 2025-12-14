import 'package:bookly_app/core/errors/error_handler.dart';
import 'package:bookly_app/core/helpers/book_model_response.dart';
import 'package:bookly_app/core/helpers/handle_error_method.dart';
import 'package:bookly_app/features/home/data/apis/api_services.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repo/home_repo.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImplementation implements HomeRepo {
  final ApiServices apiServices;

  HomeRepoImplementation(this.apiServices);

  @override
  Future<Either<Failure, List<BookModel>>> fetchLatestBooks() async {
    try {
      var data = await apiServices.get(
        endPoint: 'volumes?Filtering=free-ebooks&sorting=newest&q=programming',
      );
      return right(BookModelResponse().parseBookModels(data));
    } catch (e) {
      return HandleErrorMethod().handleError(e);
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      var data = await apiServices.get(
        endPoint: 'volumes?Filtering=free-ebooks&q=subject:programming',
      );
      return right(BookModelResponse().parseBookModels(data));
    } catch (e) {
      return HandleErrorMethod().handleError(e);
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchRelatedBooks({
    required String category,
  }) async {
    try {
      var data = await apiServices.get(
        endPoint:
            'volumes?Filtering=free-ebooks&sorting=relevence&q=programming',
      );
      return right(BookModelResponse().parseBookModels(data));
    } catch (e) {
      return HandleErrorMethod().handleError(e);
    }
  }
}
