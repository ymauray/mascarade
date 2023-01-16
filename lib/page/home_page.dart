import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mascarade/page/login_form.dart';
import 'package:mascarade/provider/pocket_base_provider.dart';
import 'package:mascarade/utils/security_enforcer.dart';

class HomePage extends ConsumerWidget with SecurityEnforcer {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pb = ref.watch(pockerBaseProvider);

    if (pb.authStore.model == null) {
      return LoginForm(returnTo: this);
    } else {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Vampire, la Mascarade'),
          ),
          body: const Center(
            child: Text('You are logged in'),
          ),
        ),
      );
    }
  }
}
