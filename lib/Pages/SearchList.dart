import 'package:HearMe/API/saavn.dart';
import 'package:HearMe/Utils/audio_serviec.dart';
import 'package:HearMe/Widgets/searchCard.dart';
import 'package:HearMe/model/songModel.dart';
import 'package:flutter/material.dart';

class SearchList extends StatefulWidget {
  @override
  _SearchListState createState() => _SearchListState();
}

class _SearchListState extends State<SearchList> {
  TextEditingController searchController = new TextEditingController();
  ValueNotifier<List<SongModel>> songs = ValueNotifier<List<SongModel>>([]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(8, 10, 54, 10),
      appBar: AppBar(
        toolbarHeight: 80,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.3),
            borderRadius: BorderRadius.circular(32),
          ),
          child: TextField(
            controller: searchController,
            maxLines: 1,
            onChanged: (value) async {
              if (value != "") {
                songs.value = await fetchSongsList(value);
              }
            },
            decoration: InputDecoration(
              hintStyle: TextStyle(fontSize: 17),
              hintText: 'Search songs...',
              suffixIcon: IconButton(
                icon: Icon(Icons.cancel),
                onPressed: () {
                  searchController.text = '';
                },
              ),
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(20),
            ),
          ),
        ),
      ),
      body: ValueListenableBuilder<List<SongModel>>(
        valueListenable: songs,
        builder: (context, snapshot, child) {
          return ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: songs.value.length,
            itemBuilder: (context, index) {
              return SearchCard(songs.value, index);
            },
          );
        },
      ),
    );
  }
}
