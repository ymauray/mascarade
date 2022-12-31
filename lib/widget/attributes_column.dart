import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mascarade/model/attribute.dart';
import 'package:mascarade/widget/entry.dart';
import 'package:mascarade/widget/five_dots.dart';
import 'package:mascarade/widget/small_caps_text.dart';

class AttributesColumn extends ConsumerWidget {
  const AttributesColumn({
    required this.label,
    required this.attributes,
    super.key,
  });

  final String label;
  final List<Attribute> attributes;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        SmallCapsText(
          label,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
        ...attributes.map(
          (attribute) => Entry(
            leading: attribute.name,
            trailing: FiveDots(attribute.value),
          ),
        ),
      ],
    );
  }
}
