import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mascarade/widget/small_caps_text.dart';

class HorizontalSeparator extends ConsumerWidget {
  const HorizontalSeparator({this.label, super.key});

  final String? label;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            const Expanded(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 2,
                    ),
                  ),
                ),
              ),
            ),
            if (label != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SmallCapsText(
                  label!,
                  style: const TextStyle(
                    fontSize: 36,
                  ),
                ),
              ),
            if (label == null)
              const SizedBox(
                height: 48,
              ),
            const Expanded(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 2,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
