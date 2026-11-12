
enum Genre {
  novel,
  history,
  fantasy,
  poetry,
}

extension GenreExtension on Genre {
  String get label {
    switch (this) {
      case Genre.novel:
        return 'Վեպ';
      case Genre.history:
        return 'Պատմություն';
      case Genre.fantasy:
        return 'Ֆանտաստիկա';
      case Genre.poetry:
        return 'Բանաստեղծություն';
    }
  }
}

class Book {
  final int id;
  final String title;
  final String author;
  final Genre genre;

  bool isRead;
  int rating;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.genre,
    this.isRead = false,
    this.rating = 0,
  });
}
