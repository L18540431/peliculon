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
                [_PosterAndTitle(), 
                _Overview(),
                MovieSlider2(),
                ],
                ),
                )
      ],
    )
    );
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
            image: AssetImage('assets/foto.jpeg'),
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

class _Overview extends StatelessWidget {
  const _Overview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10,
      ),
      child: Text('Voluptate irure consequat est tempor anim esse culpa do cupidatat.Nostrud laborum ullamco aute fugiat cupidatat laboris culpa consectetur deserunt. Id qui excepteur pariatur magna nulla excepteur cillum nulla cupidatat occaecat et. Deserunt esse velit laboris aliquip quis mollit est anim cillum. Irure laboris tempor ex pariatur. Non aliquip dolor dolore irure eiusmod duis. Qui sunt dolore exercitation nostrud tempor Lorem aliqua. Pariatur aliqua ut adipisicing proident esse elit aute commodo velit mollit laborum.', textAlign: TextAlign.justify,
      style: TextStyle(fontSize: 15),
      ),
    );
  }
}

class MovieSlider2 extends StatelessWidget {
  const MovieSlider2({super.key});

 @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * .30,
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Populares',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color:  Colors.white,
                ),
              )),
              Expanded(child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 20,
                itemBuilder: (_, index) =>const _MoviePoster2(),
              ),
              ),
        ],
      ),
    );
  }
}

class _MoviePoster2 extends StatelessWidget {
  const _MoviePoster2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 250,
      color: Color.fromARGB(255, 62, 207, 135),
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details',arguments: ''),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: const FadeInImage(
                placeholder: AssetImage('assets/foto.jpeg'),
                image: AssetImage('assets/foto.jpeg'),
                width: 180,
                height: 100,
              ),
            ),
          ),
          const SizedBox(height: 8,),
          const Text('Quiero mover el bote, me gusta.. mueve! ',
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}