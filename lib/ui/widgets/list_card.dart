import 'package:flutter/material.dart';

class ListCard extends StatelessWidget {
  final String title;
  final String description;

  const ListCard({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              title,
              style: theme.primaryTextTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 16),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              description,
              style: theme.primaryTextTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.normal, color: Colors.black),
            ),
            const SizedBox(
              height: 10,
            ),
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              child: Image.network(
                width: double.infinity,
                fit: BoxFit.cover,
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTcVhC5gBAeUUliOCSQZH3opqc-e9c8NnUQsVuxwIE8KQ&s',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
