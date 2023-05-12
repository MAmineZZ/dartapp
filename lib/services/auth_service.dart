import 'dart:convert';
import 'dart:developer';
import 'package:formation/models/user.dart';
import 'package:http/http.dart' as http;

class AuthService {
  Future<User> getAuth(Map formType) async {
    Uri url = Uri.parse('https://dummyjson.com/auth/login');

    http.Response response = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(formType));

    //inspect(response);

    if (response.statusCode == 200) {
      //response.body: corps de la réponse
      Map data = jsonDecode(response.body);
      //inspect(data);

      //retourner une liste d'objet Meme
      return User(
        id: data['id'],
        username: data['username'],
        email: data['email'],
      );
    } else {
      throw Error();
    }
  }
}
