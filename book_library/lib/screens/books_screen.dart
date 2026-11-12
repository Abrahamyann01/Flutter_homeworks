
import 'package:flutter/material.dart';

import '../models/book.dart';
import '../data/books_data.dart';
import '../widgets/book_tile.dart';
import 'book_details_screen.dart';

class BooksScreen extends StatefulWidget {
  const BooksScreen({super.key});

  @override
  State<BooksScreen> createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksScreen> {
  String selectedGenre = 'Բոլորը';

  final List<Book> books = createBooks();

  final TextEditingController searchController =
      TextEditingController();

  String searchQuery = '';

  int get readCount {
    return books.where((book) => book.isRead).length;
  }

  List<Book> get filteredBooks {
    return books.where((book) {
      final query = searchQuery.toLowerCase().trim();

      final matchesSearch =
          book.title.toLowerCase().contains(query) ||
          book.author.toLowerCase().contains(query);

      final matchesGenre =
          selectedGenre == 'Բոլորը' ||
          book.genre.label == selectedGenre;

      return matchesSearch && matchesGenre;
    }).toList();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void deleteBook(Book book) {
    final removedIndex = books.indexOf(book);

    setState(() {
      books.remove(book);
    });

    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${book.title} ջնջվեց'),
        action: SnackBarAction(
          label: 'Վերականգնել',
          onPressed: () {
            setState(() {
              books.insert(
                removedIndex.clamp(0, books.length).toInt(),
                book,
              );
            });
          },
        ),
      ),
    );
  }

  Future<void> openBookDetails(Book book) async {
    final result = await Navigator.push<int>(
      context,
      MaterialPageRoute(
        builder: (context) {
          return BookDetailsScreen(book: book);
        },
      ),
    );

    if (!mounted) return;

    if (result != null) {
      setState(() {
        book.rating = result;
        book.isRead = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final visibleBooks = filteredBooks;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Իմ Գրադարանը',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Կարդացված $readCount/${books.length}',
              style: const TextStyle(fontSize: 17),
            ),
          ],
        ),
      ),

      body: Column(
        children: [
          const SizedBox(height: 10),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: TextField(
              controller: searchController,
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Որոնել գիրք կամ հեղինակ...',
                suffixIcon: searchQuery.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          searchController.clear();

                          setState(() {
                            searchQuery = '';
                          });
                        },
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),

          const SizedBox(height: 10),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                const SizedBox(width: 10),

                ChoiceChip(
                  label: const Text('Բոլորը'),
                  selected: selectedGenre == 'Բոլորը',
                  onSelected: (value) {
                    setState(() {
                      selectedGenre = 'Բոլորը';
                    });
                  },
                ),

                const SizedBox(width: 10),

                ChoiceChip(
                  label: const Text('Վեպ'),
                  selected: selectedGenre == 'Վեպ',
                  onSelected: (value) {
                    setState(() {
                      selectedGenre = 'Վեպ';
                    });
                  },
                ),

                const SizedBox(width: 10),

                ChoiceChip(
                  label: const Text('Պատմություն'),
                  selected: selectedGenre == 'Պատմություն',
                  onSelected: (value) {
                    setState(() {
                      selectedGenre = 'Պատմություն';
                    });
                  },
                ),

                const SizedBox(width: 10),

                ChoiceChip(
                  label: const Text('Ֆանտաստիկա'),
                  selected: selectedGenre == 'Ֆանտաստիկա',
                  onSelected: (value) {
                    setState(() {
                      selectedGenre = 'Ֆանտաստիկա';
                    });
                  },
                ),

                const SizedBox(width: 10),

                ChoiceChip(
                  label: const Text('Բանաստեղծություն'),
                  selected: selectedGenre == 'Բանաստեղծություն',
                  onSelected: (value) {
                    setState(() {
                      selectedGenre = 'Բանաստեղծություն';
                    });
                  },
                ),

                const SizedBox(width: 10),
              ],
            ),
          ),

          const SizedBox(height: 10),

          Expanded(
            child: visibleBooks.isEmpty
                ? const Center(
                    child: Text(
                      'Գրքեր չեն գտնվել',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                  )
                : ListView.separated(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    itemCount: visibleBooks.length,

                    itemBuilder: (context, index) {
                      final book = visibleBooks[index];

                      return Dismissible(
                        key: ValueKey(book.id),
                        direction: DismissDirection.endToStart,

                        background: Container(
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: 20),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.delete,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),

                        onDismissed: (direction) {
                          deleteBook(book);
                        },

                        child: BookTile(
                          book: book,

                          onReadChanged: (value) {
                            setState(() {
                              book.isRead = value ?? false;
                            });
                          },

                          onTap: () {
                            openBookDetails(book);
                          },
                        ),
                      );
                    },

                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 4);
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
