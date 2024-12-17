import 'package:flutter/material.dart';
import 'package:movie_app/data/models/movie_model.dart';

class DetailedViewScreen extends StatelessWidget {
  final MovieModel model;
  const DetailedViewScreen({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(model.title??"", style: TextStyle(color: Colors.white),),
      ),
      body: Column(
        children: [
          Image.network(model.poster ?? ""),
          Text(
            model.plot ?? "",
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
