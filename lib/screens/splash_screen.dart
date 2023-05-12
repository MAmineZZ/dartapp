import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //délai avant la redirection vers la page auth
    Timer(const Duration(seconds: 5), () {
      //navigateur vers la page auth et animer la transition
      context.replaceNamed('auth');
    });

    return Scaffold(
      //appBar: const AppBarWidget(),
      body: Container(
        padding: const EdgeInsets.all(25),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //ici on va mettre notre logo
            Image.asset('assets/images/meme.png'),
          ],
        ),
      ),
    );
  }
}
