import 'dart:convert';
import 'dart:developer';

import 'package:formation/models/meme.dart';
import 'package:http/http.dart' as http;

class MemeService {
  /*
    Future: équivalent de Promise en JS
  */

  Future getMeme() async {
    // await: attendre la réponse de la requête
    Uri url = Uri.parse('https://api.imgflip.com/get_memes');

    //récuperation de la réponse http en get
    http.Response response = await http.get(url);

    //inspect(response);

    if (response.statusCode == 200) {
      //response.body: corps de la réponse
      List data = jsonDecode(response.body)['data']['memes'];

      //retourner une liste d'objet Meme
      return data
          .map((value) => Meme(name: value['name'], url: value['url']))
          .toList();
    } else {
      throw Error();
    }
  }
}
