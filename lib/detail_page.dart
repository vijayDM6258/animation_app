import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  int counter;
  String? imgUrl;
  int? imgIndex;

  DetailPage({super.key, required this.counter, this.imgUrl, this.imgIndex});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            height: 220,
            width: double.infinity,
            child: Hero(
              tag: "morlo${widget.imgIndex}",
              child: Image.network(
                widget.imgUrl ?? "",
              ),
            ),
          ),
          Hero(
            tag: "count",
            child: Text("count is ${widget.counter}"),
          ),
          FloatingActionButton(
            heroTag: "2",
            onPressed: () {},
          ),
        ],
      ),
      floatingActionButton: Row(
        children: [
          FloatingActionButton(
            heroTag: "1",
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
