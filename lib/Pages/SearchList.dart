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
        appBar: AppBar(
          title: TextField(
            controller: searchController,
            decoration: InputDecoration(
              hintText: "Search",
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () async {
                //searchController.text = "";
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
                  child: ListTile(
                title: Text(songList.toString()),
              ));
            })
        // body:FutureBuilder(
        //   future: fetchSongsList(searchController.text) ,
        //   builder: (context, snapshot) {
        //         if (snapshot.hasData) {
        //           return Text("Found");
        //         } else if (snapshot.hasError) {
        //           return Text("{snapshot.error}");
        //         }
        //         return CircularProgressIndicator();
        //   // builder:(context,snapshots){
        //   //   if(snapshots.hasData){
        //   //     return Container(color:Colors.red);
        //   //   }
        //   //   else{
        //   //     return Container(color:Colors.green);
        //   //   }
        //   // },
        //   },
        // ),
        );
  }
}
