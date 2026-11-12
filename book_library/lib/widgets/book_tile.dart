
import 'package:flutter/material.dart';
import '../models/book.dart';

class BookTile extends StatelessWidget {
  final Book book;
  final ValueChanged<bool?> onReadChanged;
  final VoidCallback onTap;

  const BookTile({
    super.key,
    required this.book,
    required this.onReadChanged,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        onTap: onTap,
        leading: const Icon(
          Icons.menu_book,
          size: 30,
          color: Colors.blue,
        ),
        title: Text(
          book.title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            decoration: book.isRead
                ? TextDecoration.lineThrough
                : TextDecoration.none,
          ),
        ),
        subtitle: Text(
          '${book.author} • ${book.genre.label}',
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(5, (index) {
                return Icon(
                  index < book.rating
                      ? Icons.star
                      : Icons.star_border,
                  color: Colors.amber,
                  size: 17,
                );
              }),
            ),
            Checkbox(
              value: book.isRead,
              onChanged: onReadChanged,
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}
