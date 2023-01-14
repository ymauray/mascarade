import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mascarade/utils/security_enforcer.dart';

class HomePage extends ConsumerWidget with SecurityEnforcer  {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Vampire, la Mascarade'),
        ),
      ),
    );
  }
}
