
import '../models/book.dart';

List<Book> createBooks() {
  return [
    Book(
      id: 1,
      title: 'Փոքրիկ իշխանը',
      author: 'Անտուան դը Սենտ-Էքզյուպերի',
      genre: Genre.novel,
    ),
    Book(
      id: 2,
      title: 'Սամվել',
      author: 'Րաֆֆի',
      genre: Genre.history,
    ),
    Book(
      id: 3,
      title: 'Հարրի Փոթերը',
      author: 'Ջոան Ռոուլինգ',
      genre: Genre.fantasy,
    ),
    Book(
      id: 4,
      title: 'Աբու-Լալա Մահարի',
      author: 'Ավետիք Իսահակյան',
      genre: Genre.poetry,
    ),
    Book(
      id: 5,
      title: 'Գիքորը',
      author: 'Հովհաննես Թումանյան',
      genre: Genre.novel,
    ),
    Book(
      id: 6,
      title: 'Վարդանանք',
      author: 'Դերենիկ Դեմիրճյան',
      genre: Genre.history,
    ),
    Book(
      id: 7,
      title: 'Մատանիների տիրակալը',
      author: 'Ջոն Ռոնալդ Ռուել Թոլքին',
      genre: Genre.fantasy,
    ),
    Book(
      id: 8,
      title: 'Տաղեր',
      author: 'Եղիշե Չարենց',
      genre: Genre.poetry,
    ),
    Book(
      id: 9,
      title: 'Կայծեր',
      author: 'Րաֆֆի',
      genre: Genre.novel,
    ),
    Book(
      id: 10,
      title: 'Անուշ',
      author: 'Հովհաննես Թումանյան',
      genre: Genre.poetry,
    ),
  ];
}
