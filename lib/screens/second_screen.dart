import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:formation/widgets/appbar_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:formation/providers/meme_provider.dart';

import '../models/meme.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //recuperation de l'objet stocké dans le provider
    Meme? meme = context.read<MemeProvider>().meme;
    inspect(meme);

    return Scaffold(
      appBar: const AppBarWidget(),
      body: Container(
        padding: const EdgeInsets.all(25),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(meme!.url!),
            Text(meme.name!),
            ElevatedButton(
              onPressed: () {
                //pop pour supprimer l'ecran actuel
                context.pop();
              },
              child: const Text('Home screen'),
            ),
          ],
        ),
      ),
    );
  }
}
