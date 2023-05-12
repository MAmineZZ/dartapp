import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:formation/models/user.dart';
import 'package:formation/services/auth_service.dart';

import 'package:formation/widgets/appbar_widget.dart';
import 'package:go_router/go_router.dart';

class AuthScreen extends StatefulWidget {
  final _formkey = GlobalKey<FormState>();

  //map pour stocker les données saisies
  final Map<String, String> _formtype = {
    'username': 'kminchelle',
    'password': '0lelplR',
  };

  //instance de la classe AuthService
  AuthService _authService = AuthService();

  AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      body: Container(
        padding: const EdgeInsets.all(25),
        alignment: Alignment.center,
        child: Form(
          key: widget._formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                initialValue: 'kminchelle',
                decoration: const InputDecoration(
                  label: Text('Username'),
                ),
                onChanged: (String value) {
                  widget._formtype['username'] = value;
                },
                validator: (String? value) =>
                    value == null || value.isEmpty ? 'Login Err' : null,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                initialValue: '0lelplR',
                decoration: const InputDecoration(
                  label: Text('Password'),
                ),
                onChanged: (String value) {
                  widget._formtype['password'] = value;
                },
                validator: (String? value) =>
                    value == null || value.isEmpty ? 'Password Err' : null,
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  if (widget._formkey.currentState!.validate()) {
                    //sauvegarder les données saisies
                    widget._formkey.currentState!.save();

                    //afficher les données saisies
                    //inspect(widget._formtype);

                    //onError recupérer l'erreur de la future
                    widget._authService
                        .getAuth(widget._formtype)
                        .then((User user) => context.replaceNamed('home'))
                        .onError((error, stackTrace) => {
                              //ScaffoldMessenger permet d'afficher un message en bas de l'écran scaffold
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Erreur de connexion')))
                            });

                    //appel de l'api authentification
                    widget._authService.getAuth(widget._formtype);

                    //naviguer vers la page home
                    //GoRouter.of(context).go('/home');
                  }
                },
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
