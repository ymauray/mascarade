import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mascarade/utils/layout_type.dart';
import 'package:mascarade/widget/small_caps_text.dart';

class Entry extends ConsumerWidget {
  const Entry({
    this.leading,
    this.value,
    this.trailing,
    this.layout = LayoutType.wide,
    super.key,
  });

  final String? leading;
  final String? value;
  final Widget? trailing;
  final LayoutType layout;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: layout == LayoutType.wide ? 8 : 4,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (leading != null)
            Padding(
              padding: EdgeInsets.only(
                top: leading!.contains('\n')
                    ? (layout == LayoutType.wide ? 16 : 0)
                    : 0,
              ),
              child: GestureDetector(
                child: SmallCapsText(
                  '$leading',
                  style: TextStyle(
                    fontSize: layout == LayoutType.wide ? 16 : 24,
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
              style: TextStyle(
                fontSize: layout == LayoutType.wide ? 16 : 24,
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
