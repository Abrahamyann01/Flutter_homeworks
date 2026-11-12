
import 'package:flutter/material.dart';
import '../models/book.dart';

class BookDetailsScreen extends StatefulWidget {
  final Book book;

  const BookDetailsScreen({
    super.key,
    required this.book,
  });

  @override
  State<BookDetailsScreen> createState() =>
      _BookDetailsScreenState();
}

class _BookDetailsScreenState
    extends State<BookDetailsScreen> {
  late int rating;

  @override
  void initState() {
    super.initState();
    rating = widget.book.rating;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Գրքի մասին'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.menu_book,
                size: 80,
                color: Colors.blue,
              ),
              const SizedBox(height: 25),

              Text(
                widget.book.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              Text(
                widget.book.author,
                style: const TextStyle(fontSize: 18),
              ),

              const SizedBox(height: 10),

              Text(
                'Ժանր՝ ${widget.book.genre.label}',
                style: const TextStyle(fontSize: 16),
              ),

              const SizedBox(height: 35),

              const Text(
                'Գնահատեք գիրքը',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {
                  return IconButton(
                    onPressed: () {
                      setState(() {
                        rating = index + 1;
                      });
                    },
                    icon: Icon(
                      index < rating
                          ? Icons.star
                          : Icons.star_border,
                      color: Colors.amber,
                      size: 38,
                    ),
                  );
                }),
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: rating == 0
                      ? null
                      : () {
                          Navigator.pop(context, rating);
                        },
                  child: const Text('Պահպանել'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
