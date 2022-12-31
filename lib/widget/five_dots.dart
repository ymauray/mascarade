import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FiveDots extends ConsumerWidget {
  const FiveDots(this.value, {super.key});

  final int value;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Dot(checked: value >= 1),
        Dot(checked: value >= 2),
        Dot(checked: value >= 3),
        Dot(checked: value >= 4),
        Dot(checked: value >= 5),
      ],
    );
  }
}

class Dot extends ConsumerWidget {
  const Dot({required this.checked, super.key});

  final bool checked;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          color: checked ? Colors.black : Colors.white,
          border: Border.all(),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
