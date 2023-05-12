import 'package:flutter/material.dart';
import 'package:formation/providers/meme_provider.dart';
//import 'package:formation/screens/home_screen.dart';
import 'package:formation/services/router.dart';
//import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MemeProvider(),
        ),
      ],
      child: const MyApp(),
    ));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'My App',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      routeInformationParser: RouterService.getRoutes().routeInformationParser,
      routeInformationProvider:
          RouterService.getRoutes().routeInformationProvider,
      routerDelegate: RouterService.getRoutes().routerDelegate,

      //home: const HomeScreen(),
    );
  }
}



























































// import 'package:flutter/material.dart';
// import 'package:formation/widgets/password_widget.dart';

// //initialisation
// void main() => runApp(MyApp());

// //Widget de l'application
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'My App',
//       theme: ThemeData.dark(),
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         body: PasswordWidget(),
//       ),
//     );
//   }
// }