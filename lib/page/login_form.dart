import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mascarade/page/home_page.dart';
import 'package:mascarade/provider/fiche_provider.dart';
import 'package:mascarade/provider/login_form_state_provider.dart';
import 'package:mascarade/provider/shared_preferences_provider.dart';

class LoginForm extends ConsumerWidget {
  LoginForm({super.key})
      : emailController = TextEditingController(),
        passwordController = TextEditingController(),
        confirmPasswordController = TextEditingController();

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginFormState = ref.watch(loginFormStateProvider);
    final loginForm = ref.watch(loginFormStateProvider.notifier);
    emailController.text = loginFormState.email;

    return Material(
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 350,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Email input
                      TextField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Courriel',
                        ),
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
                      ),
                      if (loginFormState.isRegistrationForm)
                        const SizedBox(height: 16),
                      if (loginFormState.isRegistrationForm)
                        // Confirm password input
                        TextField(
                          obscureText: true,
                          controller: confirmPasswordController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Confirmer le mot de passe',
                          ),
                        ),
                      const SizedBox(height: 32),
                      // Login button
                      if (!loginFormState.isRegistrationForm)
                        ElevatedButton(
                          onPressed: () async {
                            loginForm.setEmail(emailController.text);
                            final authenticated = await loginForm.authenticate(
                              passwordController.text,
                            );
                            if (authenticated) {
                              final sp = await ref.read(
                                sharedPreferencesProvider.future,
                              );
                              await sp.setString('email', emailController.text);
                              await sp.setString(
                                'password',
                                passwordController.text,
                              );
                              await ref.read(ficheProvider.notifier).load();
                              await Navigator.of(context).pushReplacement(
                                MaterialPageRoute<void>(
                                  builder: (context) => const HomePage(),
                                ),
                              );
                            }
                          },
                          child: const Text('Connexion'),
                        ),
                      if (loginFormState.isRegistrationForm)
                        ElevatedButton(
                          onPressed: () async {
                            loginForm.setEmail(emailController.text);
                            final registered = await loginForm.register(
                              passwordController.text,
                              confirmPasswordController.text,
                            );
                            if (registered) {
                              //);
                              passwordController.clear();
                              confirmPasswordController.clear();
                              loginForm.toggleIsRegistrationForm();
                            }
                          },
                          child: const Text('Enregistrer'),
                        ),
                      const SizedBox(height: 24),
                      // Register button
                      if (loginFormState.isRegistrationForm)
                        TextButton(
                          onPressed: loginForm.toggleIsRegistrationForm,
                          child: const Text(
                            'Vous avez déjà un compte ? Connectez-vous.',
                          ),
                        ),

                      if (!loginFormState.isRegistrationForm)
                        TextButton(
                          onPressed: loginForm.toggleIsRegistrationForm,
                          child: const Text(
                            "Vous n'avez pas de compte ? Créez-en un.",
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
