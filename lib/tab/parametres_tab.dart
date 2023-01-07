import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mascarade/page/login_form.dart';
import 'package:mascarade/provider/fiche_provider.dart';
import 'package:mascarade/provider/pocket_base_provider.dart';
import 'package:mascarade/provider/tab_index_provider.dart';

class ParametresTab extends ConsumerWidget {
  const ParametresTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pocketBase = ref.watch(pocketBaseProvider);
    return Column(
      children: [
        Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: const Padding(
                    padding: EdgeInsets.all(16),
                    child: Text('Recharger la fiche'),
                  ),
                  onPressed: () async {
                    await ref.read(ficheProvider.notifier).load();
                    ref.read(tabIndexProvider.notifier).state = 0;
                  },
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  child: const Padding(
                    padding: EdgeInsets.all(16),
                    child: Text('Déconnexion'),
                  ),
                  onPressed: () async {
                    pocketBase.authStore.clear();
                    await Navigator.of(context).pushReplacement(
                      MaterialPageRoute<void>(
                        builder: (_) => LoginForm(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        const Text(
          'Icône et illustration par Cybergothpunkfreak, '
          'obtenue sur https://www.deviantart.com/',
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
