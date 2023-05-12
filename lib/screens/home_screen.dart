import 'package:flutter/material.dart';
import 'package:formation/providers/meme_provider.dart';
import 'package:formation/services/meme_service.dart';
import 'package:formation/widgets/appbar_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  //instanciation du service API
  MemeService _memeService = MemeService();

  //this is the key to navigate to this screen
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    _memeService.getMeme();
    return Scaffold(
      appBar: const AppBarWidget(),
      body: Container(
        alignment: Alignment.center,

        child: FutureBuilder(
          future: _memeService.getMeme(),
          builder: (context, snapshot) {
            //snapshot: contient les données de la requête envoyés par la future
            if (snapshot.hasData) {
              List data = snapshot.data as List;
              return ListView(
                shrinkWrap: true,
                children: data
                    .map((meme) => ListTile(
                          title: Text(meme.name),
                          leading: Image.network(
                            meme.url,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                          trailing: const Icon(Icons.arrow_forward_ios),
                          onTap: () {
                            //stocker l'objet dans le provider
                            context.read<MemeProvider>().meme = meme;

                            //navigateur vers la page second
                            context.pushNamed('second');
                          },
                        ))
                    .toList(),
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),

        // child: Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     const Text('Home Page'),
        //     ElevatedButton(
        //       onPressed: () {
        //         //context : ecran affiché
        //         context.pushNamed('second');
        //       },
        //       child: const Text('Second screen'),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
