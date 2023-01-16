import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mascarade/provider/login_form_provider.dart';
import 'package:mascarade/provider/pocket_base_provider.dart';
import 'package:pocketbase/pocketbase.dart';

class LoginForm extends ConsumerWidget {
  LoginForm({
    required this.returnTo,
    super.key,
  });

  final Widget returnTo;
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmationController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginForm = ref.watch(loginFormProvider);
    final pb = ref.watch(pockerBaseProvider);

    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 350,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Mascarade',
                    style: TextStyle(
                      fontSize: 48,
                      fontFamily: 'Percolator',
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: usernameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Identifiant',
                    ),
                    //onSubmitted: (value) => onButtonPressed(),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Mot de passe',
                    ),
                    obscureText: true,
                    //onSubmitted: (value) => onButtonPressed(),
                  ),
                  if (!loginForm.isRegistrationForm) ...[
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () async {
                        if (usernameController.text.isEmpty ||
                            passwordController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content:
                                  const Text('Tous les champs sont requis'),
                              backgroundColor: Theme.of(context).errorColor,
                            ),
                          );
                          return;
                        }
                        try {
                          await pb.collection('users').authWithPassword(
                                usernameController.text,
                                passwordController.text,
                              );
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text('Authentification réussie'),
                              backgroundColor: Theme.of(context).primaryColor,
                            ),
                          );
                          passwordController.clear();
                          confirmationController.clear();
                          await Navigator.of(context).pushReplacement(
                            MaterialPageRoute<void>(
                              builder: (_) => returnTo,
                            ),
                          );
                        } on ClientException catch (e) {
                          final key =
                              (e.response['data'] as Map<String, dynamic>)
                                  .keys
                                  .first;
                          final map =
                              (e.response['data'] as Map<String, dynamic>)[key]
                                  as Map<String, dynamic>;
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "$key : ${map['message']}",
                              ),
                              backgroundColor: Theme.of(context).errorColor,
                            ),
                          );
                        }
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(16),
                        child: Text('Connection'),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextButton(
                      onPressed: () {
                        ref.read(loginFormProvider.notifier).registrationForm =
                            true;
                      },
                      child: const Text('Pas encore de compte ?'),
                    ),
                  ],
                  if (loginForm.isRegistrationForm) ...[
                    const SizedBox(height: 16),
                    TextField(
                      controller: confirmationController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Confirmation du mot de passe',
                      ),
                      obscureText: true,
                      //onSubmitted: (value) => onButtonPressed(),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Checkbox(
                          visualDensity: VisualDensity.compact,
                          value: loginForm.registerStoryteller,
                          onChanged: (value) {
                            ref
                                .read(loginFormProvider.notifier)
                                .registerStoryteller = value ?? false;
                          },
                        ),
                        const Text("S'enregistrer comme conteur"),
                      ],
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () async {
                        if (usernameController.text.isEmpty ||
                            passwordController.text.isEmpty ||
                            confirmationController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content:
                                  const Text('Tous les champs sont requis'),
                              backgroundColor: Theme.of(context).errorColor,
                            ),
                          );
                          return;
                        }
                        if (passwordController.text !=
                            confirmationController.text) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text(
                                'Le mot de passe et sa confirmation doivent '
                                'être identiques',
                              ),
                              backgroundColor: Theme.of(context).errorColor,
                            ),
                          );
                          return;
                        }
                        try {
                          await pb.collection('users').create(
                            body: {
                              'username': usernameController.text,
                              'password': passwordController.text,
                              'passwordConfirm': confirmationController.text,
                              'storyteller': loginForm.registerStoryteller,
                            },
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text('Enregistrement réussi'),
                              backgroundColor: Theme.of(context).primaryColor,
                            ),
                          );
                          passwordController.clear();
                          confirmationController.clear();
                          ref
                              .read(loginFormProvider.notifier)
                              .registrationForm = false;
                        } on ClientException catch (e) {
                          final key =
                              (e.response['data'] as Map<String, dynamic>)
                                  .keys
                                  .first;
                          final map =
                              (e.response['data'] as Map<String, dynamic>)[key]
                                  as Map<String, dynamic>;
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "$key : ${map['message']}",
                              ),
                              backgroundColor: Theme.of(context).errorColor,
                            ),
                          );
                        }
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(16),
                        child: Text('Enregistrement'),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextButton(
                      onPressed: () {
                        ref.read(loginFormProvider.notifier).registrationForm =
                            false;
                      },
                      child: const Text('Vous avez déjà un compte ?'),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
