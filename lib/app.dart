import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mascarade/page/home_page.dart';
import 'package:mascarade/page/loading_page.dart';
import 'package:mascarade/page/login_form.dart';
import 'package:mascarade/page/undefined_page.dart';
import 'package:mascarade/provider/fiche_provider.dart';
import 'package:mascarade/provider/pocket_base_provider.dart';
import 'package:mascarade/provider/shared_preferences_provider.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sharedPreferences = ref.watch(sharedPreferencesProvider);
    final pocketBase = ref.read(pocketBaseProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Cardo',
      ),
      home: sharedPreferences.when(
        loading: () => const LoadingPage(),
        error: (err, stack) => const UndefinedPage(
          title: 'Error loading shared preferences',
        ),
        data: (sharedPreferences) {
          if (pocketBase.authStore.token.isNotEmpty) return const HomePage();
          final email = sharedPreferences.getString('email');
          final password = sharedPreferences.getString('password');
          if (email != null &&
              email.isNotEmpty &&
              password != null &&
              password.isNotEmpty) {
            return FutureBuilder(
              future: pocketBase
                  .collection('users')
                  .authWithPassword(email, password),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  ref.read(ficheProvider.notifier).load();
                  return const HomePage();
                } else if (snapshot.hasError) {
                  sharedPreferences
                    ..remove('email')
                    ..remove('password');
                  return const UndefinedPage(
                    title: 'Login from stored credential failed',
                  );
                } else {
                  return const LoadingPage();
                }
              },
            );
          } else {
            return LoginForm();
          }
        },
      ),
    );
  }
}
