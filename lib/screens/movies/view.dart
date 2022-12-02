import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:playapi/screens/movies/model.dart';

import 'components/item_movie.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies App'),
      ),
      body: FutureBuilder(
        future: Dio().get(
            'https://api.themoviedb.org/3/discover/movie?api_key=2001486a0f63e9e4ef9c4da157ef37cd&page=9'),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var model = MoviesData.fromJson((snapshot.data as Response).data);
            return GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) => ItemMovie(title: model.results[index].title,imgurl: model.results[index].backdropPath,
              ),
              itemCount: model.results.length,
            );
          } else
            return CircularProgressIndicator();
        },
      ),
    );
  }
}
