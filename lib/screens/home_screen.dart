import 'package:flutter/material.dart';
import 'package:peliculon/providers/movies_provider.dart';
import 'package:peliculon/widgets/widgets.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);
    return  Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(onPressed: () { }, icon: Icon(Icons.search_outlined),
          )
        ],
        title: const Center(child: const Text ('peliculones en cine')),
      
      ),
      body: Column(
        children: [CardSwipper(movies : moviesProvider.OnDisplayMovies,), MovieSlider()],),
    );
    
  }
} 