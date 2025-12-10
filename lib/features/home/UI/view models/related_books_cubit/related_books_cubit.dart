import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repo/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'related_books_state.dart';

class RelatedBooksCubit extends Cubit<RelatedBooksState> {
  RelatedBooksCubit(this.homeRepo) : super(RelatedBooksInitial());
  final HomeRepo homeRepo;

  Future<void> fetchRelatedBooks() async {
    emit(RelatedBooksLoading());
    var result = await homeRepo.fetchRelatedBooks();
    result.fold(
      (failure) {
        return RelatedBooksFailure(failure.errMessage);
      },
      (books) {
        return RelatedBooksSuccess(books);
      },
    );
  }
}
