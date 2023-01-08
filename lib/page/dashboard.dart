import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mascarade/page/login_form.dart';
import 'package:mascarade/provider/pocket_base_provider.dart';
import 'package:mascarade/utils/layout_type.dart';
import 'package:mascarade/widget/layout_aware_widget.dart';

class Dashboard extends ConsumerWidget with LayoutAwareWidget {
  const Dashboard({
    this.layout = LayoutType.wide,
    super.key,
  });

  final LayoutType layout;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(
      builder: (context, constaints) {
        final layout = getLayout(constaints);
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Mascarade - Tableau de bord'),
          ),
          drawer: layout == LayoutType.narrow
              ? const Drawer(
                  child: SafeArea(child: DashboardMenu()),
                )
              : null,
          body: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (layout == LayoutType.wide) ...[
                Column(
                  children: [
                    SizedBox(
                      width: constaints.maxWidth / 4,
                      child: const DashboardMenu(),
                    ),
                  ],
                ),
                const VerticalDivider()
              ],
              const DashboardMainArea(),
            ],
          ),
        );
      },
    );
  }
}

class DashboardMainArea extends StatelessWidget {
  const DashboardMainArea({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text('Tableau de bord');
  }
}

class DashboardMenu extends ConsumerWidget {
  const DashboardMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pocketBase = ref.watch(pocketBaseProvider);
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          const Text('Menu'),
          const Divider(
            height: 32,
          ),
          ElevatedButton(
            onPressed: () async {
              pocketBase.authStore.clear();
              await Navigator.of(context).pushReplacement(
                MaterialPageRoute<void>(
                  builder: (_) => LoginForm(),
                ),
              );
            },
            child: const Text('Deconnexion'),
          ),
        ],
      ),
    );
  }
}
