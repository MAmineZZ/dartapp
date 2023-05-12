import 'package:flutter/material.dart';
import 'package:formation/models/meme.dart';
import 'package:provider/provider.dart';

class MemeProvider extends ChangeNotifier {
  //propriété
  Meme? _meme;

  //getters et setters
  Meme? get meme => _meme;
  set meme(Meme? value) {
    _meme = value;
    //notifier les listeners : déclancher la mise à jour des données dans les écouteurs
    notifyListeners();
  }
}
