import 'package:flutter/material.dart';

class Buttomcompo extends StatelessWidget {
  final String text;
  final void Function() ? onTap;
  const Buttomcompo({super.key,
  required this.text,
  this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration:BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all( 25),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        child:Center(
          child:Text(text),
          ),
      ),
    );
  }
}