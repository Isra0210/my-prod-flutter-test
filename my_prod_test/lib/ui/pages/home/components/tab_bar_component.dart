import 'package:flutter/material.dart';

class TabBarComponent extends StatelessWidget {
  const TabBarComponent(
    this.label,
    this.isHighlighted,
    this.counter, {
    super.key,
  });

  final String label;
  final String counter;
  final bool isHighlighted;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label,
          style: isHighlighted ? Theme.of(context).textTheme.bodyMedium : Theme.of(context).textTheme.labelMedium,
        ),
        Container(
          margin: const EdgeInsets.only(left: 6),
          decoration: BoxDecoration(
            color:  Theme.of(context).colorScheme.onPrimary,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 1,
              horizontal: 8,
            ),
            child: Text(
              counter,
              style: Theme.of(context).textTheme.bodyMedium!,
            ),
          ),
        ),
      ],
    );
  }
}
