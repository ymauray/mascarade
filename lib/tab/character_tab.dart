import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mascarade/utils/layout_type.dart';
import 'package:mascarade/widget/advantages_section.dart';
import 'package:mascarade/widget/attributes_section.dart';
import 'package:mascarade/widget/capacities_section.dart';
import 'package:mascarade/widget/horizontal_separator.dart';
import 'package:mascarade/widget/identity.dart';

class CharacterTab extends ConsumerWidget {
  const CharacterTab({
    this.layout = LayoutType.wide,
    super.key,
  });

  final LayoutType layout;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: layout == LayoutType.narrow
            ? const PortraitLayout()
            : const LandscapeLayout(),
      ),
    );
  }
}

class LandscapeLayout extends ConsumerWidget {
  const LandscapeLayout({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        FractionallySizedBox(
          widthFactor: .4,
          child: Image.asset(
            'assets/images/vampire_the_masquarade.png',
            filterQuality: FilterQuality.medium,
          ),
        ),
        const Identity(),
        const HorizontalSeparator(
          label: 'Attributs (7/5/3)',
        ),
        const AttributesSection(),
        const HorizontalSeparator(
          label: 'Capacités (13/9/5)',
        ),
        const CapacitiesSection(),
        const HorizontalSeparator(
          label: 'Avantages',
        ),
        const AdvantagesSection(),
        const HorizontalSeparator(),
      ],
    );
  }
}

class PortraitLayout extends ConsumerWidget {
  const PortraitLayout({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        FractionallySizedBox(
          widthFactor: .6,
          child: Image.asset(
            'assets/images/vampire_the_masquarade.png',
            filterQuality: FilterQuality.medium,
          ),
        ),
        const Identity(
          layout: LayoutType.narrow,
        ),
        const HorizontalSeparator(
          layout: LayoutType.narrow,
          label: 'Attributs (7/5/3)',
        ),
        const AttributesSection(
          layout: LayoutType.narrow,
        ),
        const HorizontalSeparator(
          layout: LayoutType.narrow,
          label: 'Capacités (13/9/5)',
        ),
        const CapacitiesSection(
          layout: LayoutType.narrow,
        ),
        const HorizontalSeparator(
          layout: LayoutType.narrow,
          label: 'Avantages',
        ),
        const AdvantagesSection(
          layout: LayoutType.narrow,
        ),
        const HorizontalSeparator(
          layout: LayoutType.narrow,
        ),
      ],
    );
  }
}
