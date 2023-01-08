import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mascarade/extension/auth_store_extensions.dart';
import 'package:mascarade/page/dashboard.dart';
import 'package:mascarade/page/home_page.dart';
import 'package:mascarade/provider/fiche_provider.dart';
import 'package:mascarade/provider/login_form_state_provider.dart';
import 'package:mascarade/provider/pocket_base_provider.dart';
import 'package:mascarade/provider/shared_preferences_provider.dart';
import 'package:mascarade/provider/tab_index_provider.dart';

class LoginForm extends ConsumerWidget {
  LoginForm({super.key})
      : usernameController = TextEditingController(),
        passwordController = TextEditingController(),
        confirmPasswordController = TextEditingController();

  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pocketBase = ref.watch(pocketBaseProvider);
    final loginFormState = ref.watch(loginFormStateProvider);
    final loginForm = ref.watch(loginFormStateProvider.notifier);

    Future<void> onLoginButtonPressed() async {
      loginForm
        ..toggleIsBusy()
        ..clearError()
        ..clearInfo();
      final authenticated = await loginForm.authenticate(
        usernameController.text,
        passwordController.text,
      );
      loginForm.toggleIsBusy();
      if (authenticated) {
        final sp = await ref.read(
          sharedPreferencesProvider.future,
        );
        await sp.setString(
          'username',
          usernameController.text,
        );
        await sp.setString(
          'password',
          passwordController.text,
        );
        await ref.read(ficheProvider.notifier).load();
        ref.read(tabIndexProvider.notifier).state = 0;
        await Navigator.of(context).pushReplacement(
          MaterialPageRoute<void>(
            builder: (context) => pocketBase.authStore.isStoryTeller
                ? const Dashboard()
                : const HomePage(),
          ),
        );
      } else {
        passwordController.clear();
        confirmPasswordController.clear();
      }
    }

    Future<void> onRegisterButtonPressed() async {
      loginForm
        ..toggleIsBusy()
        ..clearError()
        ..clearInfo();
      final registered = await loginForm.register(
        usernameController.text,
        passwordController.text,
        confirmPasswordController.text,
      );
      loginForm.toggleIsBusy();
      if (registered) {
        //);
        passwordController.clear();
        confirmPasswordController.clear();
        loginForm.toggleIsRegistrationForm();
      } else {
        passwordController.clear();
        confirmPasswordController.clear();
      }
    }

    Future<void> onButtonPressed() async {
      if (loginFormState.isRegistrationForm) {
        await onRegisterButtonPressed();
      } else {
        await onLoginButtonPressed();
      }
    }

    return Material(
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                child: Stack(
                  children: [
                    SizedBox(
                      width: 350,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Username input
                              TextField(
                                controller: usernameController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Identifiant',
                                ),
                                onSubmitted: (value) => onButtonPressed(),
                              ),
                              const SizedBox(height: 16),
                              // Password input
                              TextField(
                                obscureText: true,
                                controller: passwordController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Mot de passe',
                                ),
                                onSubmitted: (value) => onButtonPressed(),
                              ),
                              if (loginFormState.isRegistrationForm) ...[
                                const SizedBox(height: 16),
                                // Confirm password input
                                TextField(
                                  obscureText: true,
                                  controller: confirmPasswordController,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Confirmer le mot de passe',
                                  ),
                                  onSubmitted: (value) => onButtonPressed(),
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  children: [
                                    Checkbox(
                                      value:
                                          loginFormState.registerAsStoryteller,
                                      onChanged: (value) {
                                        loginForm.toggleRegisterAsStoryteller();
                                      },
                                    ),
                                    const Text(
                                      "S'enregistrer en tant que Conteur",
                                    )
                                  ],
                                ),
                              ],
                              const SizedBox(height: 32),
                              if (!loginFormState.isRegistrationForm) ...[
                                ElevatedButton(
                                  onPressed: onLoginButtonPressed,
                                  child: const Text('Connexion'),
                                ),
                                const SizedBox(height: 24),
                                TextButton(
                                  onPressed: loginForm.toggleIsRegistrationForm,
                                  child: const Text(
                                    "Vous n'avez pas de compte ? Créez-en un.",
                                  ),
                                ),
                              ],
                              if (loginFormState.isRegistrationForm) ...[
                                ElevatedButton(
                                  onPressed: onRegisterButtonPressed,
                                  child: const Text('Enregistrer'),
                                ),
                                const SizedBox(height: 24),
                                // Register button
                                TextButton(
                                  onPressed: loginForm.toggleIsRegistrationForm,
                                  child: const Text(
                                    'Vous avez déjà un compte ? '
                                    'Connectez-vous.',
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                      ),
                    ),
                    if (loginFormState.isBusy)
                      Positioned(
                        top: 0,
                        right: 0,
                        bottom: 0,
                        left: 0,
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.25),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
          if (loginFormState.error.isNotEmpty)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  color: Colors.red,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Align(
                    child: Text(
                      loginFormState.error,
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          if (loginFormState.info.isNotEmpty)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  color: Colors.green,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Align(
                    child: Text(
                      loginFormState.info,
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
