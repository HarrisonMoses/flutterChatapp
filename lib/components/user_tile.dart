import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  const UserTile({
    super.key,
    required this.onTap,
    required this.text}
    );

  final void Function()? onTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(12.0)
          ),
          margin: const EdgeInsets.symmetric(vertical:8 ,horizontal:18),
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              const Icon(Icons.person),
              const SizedBox(width:20),
              Text(text),
            ],
          ),
      ),
        );
  }
}