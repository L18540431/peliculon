import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String movie =
        ModalRoute.of(context)?.settings.toString() ?? 'Sin nombre';
    return const Scaffold(
        body: CustomScrollView(
      //widget con comportamientos predefinidos
      slivers: [
        _CustomAppBar(),
        SliverList(
            delegate: SliverChildListDelegate.fixed(
                [_PosterAndTitle(), _PosterAndTitle(), _PosterAndTitle()]))
      ],
    ));
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      floating: false,
      pinned: true,

      //WINGET PARA QUE SE AJUSTE EL TAMAÑO
      //Que todo desaparezca
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        //eliminar padding
        titlePadding: EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          color: Colors.black12,
          child: const Text(
            'movie.title',
            style: TextStyle(fontSize: 18),
          ),
        ),
        background: FadeInImage(
            placeholder: AssetImage('assets/loading.gif'),
            image: AssetImage('assets/foto.jpeg')),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  const _PosterAndTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: FadeInImage(
            placeholder: AssetImage('assets/foto.jpeg'),
            image: AssetImage('assets/foto.jpg'),
            height: 250,
          ),
        ),
        SizedBox(width: 20),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'movie.title',
              style: TextStyle(fontSize: 30),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            Text(
              'movie.titleOriginal',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            Row(
              children: [
                Icon(
                  Icons.start_outlined,
                  size: 20,
                  color: Colors.blueAccent,
                ),
                SizedBox(width: 5),
                Text(
                  'movie.voteAverage',
                  style: TextStyle(fontSize: 15),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                )
              ],
            )
          ],
        ))
      ]),
    );
  }
}