import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mascarade/provider/fiche_provider.dart';
import 'package:mascarade/provider/pocket_base_provider.dart';
import 'package:mascarade/provider/tab_index_provider.dart';
import 'package:mascarade/tab/character_tab.dart';
import 'package:mascarade/tab/parametres_tab.dart';
import 'package:pocketbase/pocketbase.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fiche = ref.watch(ficheProvider);
    final tabIndex = ref.watch(tabIndexProvider);
    final pocketBase = ref.watch(pocketBaseProvider);
    final username =
        (pocketBase.authStore.model as RecordModel).data['username'];

    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(0xff87a556),
              centerTitle: true,
              title: Text(
                'Mascarade - $username',
              ),
            ),
            body: Builder(
              builder: (context) {
                switch (tabIndex) {
                  case 0:
                    return CharacterTab(constraints);
                  case 1:
                    return const ParametresTab();
                  default:
                    return const Center(
                      child: Text("Cette page n'existe pas ..."),
                    );
                }
              },
            ),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: const Color(0xff87a556),
              unselectedItemColor: Colors.white.withOpacity(.60),
              selectedItemColor: Colors.white,
              currentIndex: tabIndex,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.file),
                  label: 'Fiche',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Paramètres',
                ),
              ],
              onTap: (index) =>
                  ref.read(tabIndexProvider.notifier).state = index,
            ),
          );
        },
      ),
    );
  }
}
