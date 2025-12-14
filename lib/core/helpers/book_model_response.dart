import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';

/// Helper method to convert JSON items to BookModel list
class BookModelResponse {
  List<BookModel> parseBookModels(dynamic data, {bool nullable = false}) {
    List<BookModel> books = [];
    final items = nullable ? (data['items'] ?? []) : data['items'];
    for (var item in items) {
      books.add(BookModel.fromJson(item));
    }
    return books;
  }
}
