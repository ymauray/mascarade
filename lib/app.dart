import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mascarade/extension/auth_store_extensions.dart';
import 'package:mascarade/page/dashboard.dart';
import 'package:mascarade/page/home_page.dart';
import 'package:mascarade/page/loading_page.dart';
import 'package:mascarade/page/login_form.dart';
import 'package:mascarade/page/undefined_page.dart';
import 'package:mascarade/provider/chronicle_provider.dart';
import 'package:mascarade/provider/fiche_provider.dart';
import 'package:mascarade/provider/pocket_base_provider.dart';
import 'package:mascarade/provider/shared_preferences_provider.dart';
import 'package:mascarade/widget/layout_aware_widget.dart';
import 'package:pocketbase/pocketbase.dart';

class App extends ConsumerWidget with LayoutAwareWidget {
  const App({super.key});

  MaterialColor createMaterialColor(Color color) {
    final strengths = <double>[.05];
    final swatch = <int, Color>{};
    final r = color.red;
    final g = color.green;
    final b = color.blue;

    for (var i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }

    for (final strength in strengths) {
      final ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }

    return MaterialColor(color.value, swatch);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sharedPreferences = ref.watch(sharedPreferencesProvider);
    final pocketBase = ref.read(pocketBaseProvider);
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: createMaterialColor(const Color(0xFF004400)),
        fontFamily: 'Cardo',
      ),
      home: sharedPreferences.when(
        loading: () => const LoadingPage(),
        error: (err, stack) => const UndefinedPage(
          title: 'Error loading shared preferences',
        ),
        data: (sharedPreferences) {
          if (pocketBase.authStore.token.isNotEmpty) {
            return pocketBase.authStore.isStoryTeller
                ? const Dashboard()
                : const HomePage();
          }
          final username = sharedPreferences.getString('username');
          final password = sharedPreferences.getString('password');
          if (username != null &&
              username.isNotEmpty &&
              password != null &&
              password.isNotEmpty) {
            return LayoutBuilder(
              builder: (context, constraints) {
                return FutureBuilder(
                  future: pocketBase
                      .collection('users')
                      .authWithPassword(username, password),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      ref.read(ficheProvider.notifier).load();
                      ref.read(chroniclesProvider.notifier).load();
                      return ((pocketBase.authStore.model as RecordModel)
                              .data['storyteller'] as bool)
                          ? const Dashboard()
                          : const HomePage();
                    } else if (snapshot.hasError) {
                      sharedPreferences
                        ..remove('email')
                        ..remove('password');
                      return LoginForm();
                    } else {
                      return const LoadingPage();
                    }
                  },
                );
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
