import 'package:bookly_app/core/errors/error_handler.dart';
import 'package:bookly_app/core/helpers/book_model_response.dart';
import 'package:bookly_app/core/helpers/handle_error_method.dart';
import 'package:bookly_app/features/home/data/apis/api_services.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/search/data/repo/search_repo.dart';
import 'package:dartz/dartz.dart';

class SearchRepoImplement implements SearchRepo {
  final ApiServices apiServices;

  SearchRepoImplement(this.apiServices);
  @override
  Future<Either<Failure, List<BookModel>>> fetchSearchBooks({
    required String title,
  }) async {
    try {
      var data = await apiServices.get(
        endPoint:
            'volumes?Filtering=free-ebooks&sorting=relevence&q=programming&title=$title',
      );
      return right(BookModelResponse().parseBookModels(data, nullable: true));
    } catch (e) {
      return HandleErrorMethod().handleError(e);
    }
  }
}
