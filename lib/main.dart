
import 'package:flutter/material.dart';
import 'package:peliculon/providers/movies_provider.dart';
import 'package:peliculon/screens/screens.dart';
import 'package:provider/provider.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => MoviesProvider(),
      lazy: false,
       )
    ],
    child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Peliculon',
      initialRoute: 'home',
      routes: {
        'home': (_) => HomeScreen(),
        'details':(_) => DetailsScreen()
      },
    );
  }
}