import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mascarade/widget/small_caps_text.dart';

class Entry extends ConsumerWidget {
  const Entry({this.leading, this.value, this.trailing, super.key});

  final String? leading;
  final String? value;
  final Widget? trailing;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (leading != null)
            Padding(
              padding: EdgeInsets.only(
                top: leading!.contains('\n') ? 16 : 0,
              ),
              child: GestureDetector(
                child: SmallCapsText(
                  '$leading',
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                onDoubleTap: () {
                  debugPrint('Double tap on $leading');
                },
              ),
            ),
          if (leading != null) const SizedBox(width: 8),
          if (value != null)
            SmallCapsText(
              value!,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          if (leading == null) const SizedBox(height: 22),
          const Expanded(
            child: DecoratedBox(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 2,
                    color: Colors.grey,
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
