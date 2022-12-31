import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mascarade/widget/small_caps_text.dart';

class Entry extends ConsumerWidget {
  const Entry({this.leading, this.trailing, super.key});

  final String? leading;
  final Widget? trailing;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (leading != null)
            SmallCapsText(
              '$leading',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          if (leading != null) const SizedBox(width: 8),
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
          if (trailing != null) const SizedBox(width: 8),
          if (trailing != null) trailing!,
        ],
      ),
    );
  }
}
