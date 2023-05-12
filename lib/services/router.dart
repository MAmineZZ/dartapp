import 'package:go_router/go_router.dart';
import '../screens/home_screen.dart';
import 'package:formation/screens/second_screen.dart';
import 'package:formation/screens/auth_screen.dart';

class RouterService {
  static GoRouter getRoutes() {
    //return list des routes
    return GoRouter(
      routes: [
        GoRoute(
          path: '/',
          name: 'auth',
          builder: (context, state) => AuthScreen(),
        ),
        GoRoute(
          path: '/home',
          name: 'home',
          builder: (context, state) => HomeScreen(),
        ),
        GoRoute(
          path: '/second',
          name: 'second',
          builder: (context, state) => const SecondScreen(),
        ),
      ],
    );
  }
}
