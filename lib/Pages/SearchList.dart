import 'package:HearMe/API/saavn.dart';
import 'package:flutter/material.dart';

class SearchList extends StatefulWidget {
  @override
  _SearchListState createState() => _SearchListState();
}

class _SearchListState extends State<SearchList> {
  TextEditingController searchController = new TextEditingController();
  List<dynamic> songList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(9, 18, 39, 1),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: TextField(
            onChanged: (value) async {
              List<dynamic> songLists = await fetchSongsList(value);
              setState(() {
                songList = songLists;
                print(songList);
              });
            },
            controller: searchController,
            decoration: InputDecoration(
              hintText: "Search",
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () async {
                var songLists = await fetchSongsList(searchController.text);
                setState(() {
                  songList = songLists;
                  print(songList);
                });
              },
            )
          ],
        ),
        body: ListView.builder(
            itemCount: songList.length,
            itemBuilder: (context, index) {
              return Card(
                  color: Colors.indigo[900],
                  child: ListTile(
                    title: Text(songList[index]["title"].toString()),
                    subtitle: Text(songList[index]["more_info"]
                            ["primary_artists"]
                        .toString()),
                    leading: Image.network(songList[index]["image"]),
                    onTap: () {
                      print(songList[index]);
                    },
                  ));
            }));
  }
}
