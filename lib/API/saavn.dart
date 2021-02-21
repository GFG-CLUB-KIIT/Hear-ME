import 'dart:convert';
import '../model/songModel.dart';
import 'package:des_plugin/des_plugin.dart';
import 'package:http/http.dart' as http;

List searchedList = [];
List topSongsList = [];
String kUrl = "",
    checker,
    image = "",
    title = "",
    album = "",
    artist = "",
    lyrics,
    has_320,
    rawkUrl;
String key = "38346591";
String decrypt = "";

Future<List> fetchSongsList(String searchQuery) async {
  String searchUrl =
      "https://www.jiosaavn.com/api.php?app_version=5.18.3&api_version=4&readable_version=5.18.3&v=79&_format=json&query=" +
          searchQuery +
          "&__call=autocomplete.get";
  http.Response res =
      await http.get(searchUrl, headers: {"Accept": "application/json"});
  // print(res.body);
  List<String> resEdited = (res.body).split("-->");

  var getMain = json.decode(resEdited[1]);
  // print(getMain);

  // SearchResult result = resultFromJson(getMain.toString().replaceAll("\\", "&bslash"));
  // print(result);
  searchedList = getMain["songs"]["data"];
  // SongsDatum k = searchedList[0];
  // print(k);
  for (int i = 0; i < searchedList.length; i++) {
    searchedList[i]['title'] = cleanString(searchedList[i]['title'].toString());

    searchedList[i]['more_info']['singers'] =
        cleanString(searchedList[i]['more_info']['singers'].toString());
  }
  return searchedList;
}

Future<List> topSongs() async {
  String topSongsUrl =
      "https://www.jiosaavn.com/api.php?__call=webapi.get&token=8MT-LQlP35c_&type=playlist&p=1&n=20&includeMetaTags=0&ctx=web6dot0&api_version=4&_format=json&_marker=0";
  var songsListJSON =
      await http.get(topSongsUrl, headers: {"Accept": "application/json"});
  var songsList = json.decode(songsListJSON.body);
  topSongsList = songsList["list"];
  for (int i = 0; i < topSongsList.length; i++) {
    topSongsList[i]['title'] = cleanString(topSongsList[i]['title'].toString());
    topSongsList[i]["more_info"]["artistMap"]["primary_artists"][0]["name"] =
        cleanString(topSongsList[i]["more_info"]["artistMap"]["primary_artists"]
                [0]["name"]
            .toString());
    topSongsList[i]['image'] =
        topSongsList[i]['image'].toString().replaceAll("150x150", "500x500");
  }
  return topSongsList;
}

Future fetchSongDetails(songId) async {
  String songUrl =
      "https://www.jiosaavn.com/api.php?app_version=5.18.3&api_version=4&readable_version=5.18.3&v=79&_format=json&__call=song.getDetails&pids=" +
          songId;
  var res = await http.get(songUrl, headers: {"Accept": "application/json"});
  var resEdited = (res.body).split("-->");
  var getMain = json.decode(resEdited[1]);

  title = cleanString((getMain[songId]["title"]).toString());
  image = (getMain[songId]["image"]).replaceAll("150x150", "500x500");
  album = cleanString((getMain[songId]["more_info"]["album"]).toString());

  try {
    artist =
        getMain[songId]['more_info']['artistMap']['primary_artists'][0]['name'];
  } catch (e) {
    artist = "-";
  }
  // print(getMain[songId]["more_info"]["has_lyrics"]);
  if (getMain[songId]["more_info"]["has_lyrics"] == "true") {
    String lyricsUrl =
        "https://www.jiosaavn.com/api.php?__call=lyrics.getLyrics&lyrics_id=" +
            songId +
            "&ctx=web6dot0&api_version=4&_format=json";
    var lyricsRes =
        await http.get(lyricsUrl, headers: {"Accept": "application/json"});
    var lyricsEdited = (lyricsRes.body).split("-->");
    var fetchedLyrics = json.decode(lyricsEdited[1]);
    lyrics = fetchedLyrics["lyrics"].toString().replaceAll("<br>", "\n");
  } else {
    lyrics = "null";
    String lyricsApiUrl =
        "https://musifydev.vercel.app/lyrics/" + artist + "/" + title;
    var lyricsApiRes =
        await http.get(lyricsApiUrl, headers: {"Accept": "application/json"});
    var lyricsResponse = json.decode(lyricsApiRes.body);
    if (lyricsResponse['status'] == true && lyricsResponse['lyrics'] != null) {
      lyrics = lyricsResponse['lyrics'];
    }
  }

  has_320 = getMain[songId]["more_info"]["320kbps"];
  kUrl = await DesPlugin.decrypt(
      key, getMain[songId]["more_info"]["encrypted_media_url"]);

  rawkUrl = kUrl;

  final client = http.Client();
  final request = http.Request('HEAD', Uri.parse(kUrl))
    ..followRedirects = false;
  final response = await client.send(request);
  kUrl = (response.headers['location']);
  artist = cleanString((getMain[songId]["more_info"]["artistMap"]
          ["primary_artists"][0]["name"])
      .toString());
}

String cleanString(String s) {
  return s
      .replaceAll("&bslash", "\\")
      .replaceAll("&quot;", "\"")
      .replaceAll("&#039;", "'")
      .replaceAll("&amp;", "&");
}
