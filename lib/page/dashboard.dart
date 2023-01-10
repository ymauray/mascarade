import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mascarade/extension/auth_store_extensions.dart';
import 'package:mascarade/page/chronicle_provider.dart';
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
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: const [
          Text('Tableau de bord'),
        ],
      ),
    );
  }
}

class DashboardMenu extends ConsumerWidget {
  const DashboardMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pocketBase = ref.watch(pocketBaseProvider);
    final name = pocketBase.authStore.getString('name');
    final chronicleController = TextEditingController(text: name);

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          const Text('Chroniques'),
          const Divider(height: 32),
          // const Text('Code de la chronique'),
          // Text(
          //   pocketBase.authStore.getString('chronicle'),
          //   style: const TextStyle(fontWeight: FontWeight.bold),
          // ),
          // const SizedBox(height: 8),
          // const Text('Nom de la chronique'),
          // Text(
          //   name.isEmpty ? 'Non renseigné' : name,
          //   style: const TextStyle(fontWeight: FontWeight.bold),
          // ),
          // TextButton(
          //   onPressed: () async {
          //     final changed = await showDialog<bool>(
          //       context: context,
          //       builder: (context) => AlertDialog(
          //         title: const Text('Modifier le nom de la chronique'),
          //         content: TextField(
          //           controller: chronicleController,
          //         ),
          //         actions: [
          //           TextButton(
          //             onPressed: () {
          //               Navigator.of(context).pop(false);
          //             },
          //             child: const Text('Annuler'),
          //           ),
          //           ElevatedButton(
          //             onPressed: () {
          //               Navigator.of(context).pop(true);
          //             },
          //             child: const Text('Modifier'),
          //           ),
          //         ],
          //       ),
          //     );
          //     if (changed ?? false) {}
          //   },
          //   child: const Text('Modifier'),
          // ),
          // const Divider(height: 32),
          ElevatedButton(
            onPressed: () async {
              final created = await showDialog<bool>(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Nom de la chronique'),
                  content: TextField(
                    controller: chronicleController,
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                      child: const Text('Annuler'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      },
                      child: const Text('Créer'),
                    ),
                  ],
                ),
              );
              if (created ?? false) {
                final chronicleDal = ref.watch(chronicleDalProvider);
                chronicleDal.create(chronicleController.text);
              }
            },
            child: const Text('Nouvelle chronique'),
          ),
          const Divider(height: 32),
          TextButton(
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
