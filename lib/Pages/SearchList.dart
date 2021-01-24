import 'package:flutter/material.dart';

class SearchList extends StatefulWidget {
  @override
  _SearchListState createState() => _SearchListState();
}

class _SearchListState extends State<SearchList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: TextField(
        ),
      ),
      body: Container(
          child: Column(
        children: [
          TextField(),
        ],
      )),
    );
  }
}
