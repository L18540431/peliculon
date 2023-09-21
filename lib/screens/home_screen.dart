import 'package:flutter/material.dart';
import 'package:peliculon/widgets/widgets.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(onPressed: () { }, icon: Icon(Icons.search_outlined),
          )
        ],
        title: const Center(child: const Text ('peliculones en cine')),
        
      ),
      body: Column(children: [CardSwipper(),MovieSlider(),],),
    );
    
  }
}