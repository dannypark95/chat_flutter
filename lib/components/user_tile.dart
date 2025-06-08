import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final String text;
  final void Function()? onTap;

  const UserTile({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            // icon
            Icon(Icons.person),

            const SizedBox(width: 10.0),

            // username
            Text(text),
          ],
        ),
      ),
    );
  }
}
