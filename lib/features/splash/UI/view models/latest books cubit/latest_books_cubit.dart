import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repo/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'latest_books_state.dart';

class LatestBooksCubit extends Cubit<LatestBooksState> {
  LatestBooksCubit(this.homeRepo) : super(LatestBooksInitial());
  final HomeRepo homeRepo;
  Future<void> fetchLatestBooks() async {
    emit(LatestBooksLoading());
    var result = await homeRepo.fetchLatestBooks();
    result.fold(
      (failure) {
        emit(LatestBooksFailure(failure.errMessage));
      },
      (books) {
        emit(LatestBooksSuccess(books));
      },
    );
  }
}
