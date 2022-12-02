import 'package:flutter/material.dart';

class ItemMovie extends StatelessWidget {
   ItemMovie({Key? key, required this.title, required this.imgurl}) : super(key: key);
      final String title,imgurl;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network("https://image.tmdb.org/t/p/original/"+imgurl, fit: BoxFit.fill ),
        Align(alignment: AlignmentDirectional.bottomCenter,
          child: Container(
            width: double.infinity,
            height: 40,color: Colors.red.withOpacity(.7),
            child: Align(alignment: AlignmentDirectional.bottomCenter,child: Text(title)),
          ),
        ),
      ],

    );
  }
}
