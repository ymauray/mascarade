import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mascarade/utils/lyout_type.dart';
import 'package:mascarade/widget/small_caps_text.dart';

class HorizontalSeparator extends ConsumerWidget {
  const HorizontalSeparator({
    this.layout = LayoutType.wide,
    this.label,
    super.key,
  });

  final String? label;
  final LayoutType layout;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: layout == LayoutType.wide ? 8 : 24,
      ),
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
                  style: TextStyle(
                    fontSize: layout == LayoutType.wide ? 36 : 24,
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
