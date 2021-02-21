class TopSongs {
  TopSongs({
    this.id,
    this.title,
    this.subtitle,
    this.headerDesc,
    this.type,
    this.permaUrl,
    this.image,
    this.language,
    this.year,
    this.playCount,
    this.explicitContent,
    this.listCount,
    this.listType,
    this.list,
    this.moreInfo,
    this.modules,
  });

  String id;
  String title;
  String subtitle;
  String headerDesc;
  OriginEnum type;
  String permaUrl;
  String image;
  String language;
  String year;
  String playCount;
  String explicitContent;
  String listCount;
  String listType;
  List<ListElement> list;
  TopSongsMoreInfo moreInfo;
  Modules modules;
}

class ListElement {
  ListElement({
    this.id,
    this.title,
    this.subtitle,
    this.headerDesc,
    this.type,
    this.permaUrl,
    this.image,
    this.language,
    this.year,
    this.playCount,
    this.explicitContent,
    this.listCount,
    this.listType,
    this.list,
    this.moreInfo,
  });

  String id;
  String title;
  String subtitle;
  String headerDesc;
  ListType type;
  String permaUrl;
  String image;
  Language language;
  String year;
  String playCount;
  String explicitContent;
  String listCount;
  String listType;
  String list;
  ListMoreInfo moreInfo;
}

enum Language { HINDI }

final languageValues = EnumValues({"hindi": Language.HINDI});

class ListMoreInfo {
  ListMoreInfo({
    this.music,
    this.albumId,
    this.album,
    this.label,
    this.origin,
    this.the320Kbps,
    this.encryptedMediaUrl,
    this.encryptedCacheUrl,
    this.albumUrl,
    this.duration,
    this.rights,
    this.cacheState,
    this.hasLyrics,
    this.lyricsSnippet,
    this.starred,
    this.copyrightText,
    this.artistMap,
    this.releaseDate,
    this.labelUrl,
    this.vcode,
    this.vlink,
    this.trillerAvailable,
    this.lyricsId,
  });

  String music;
  String albumId;
  String album;
  String label;
  OriginEnum origin;
  String the320Kbps;
  String encryptedMediaUrl;
  String encryptedCacheUrl;
  String albumUrl;
  String duration;
  Rights rights;
  String cacheState;
  String hasLyrics;
  String lyricsSnippet;
  String starred;
  String copyrightText;
  ArtistMap artistMap;
  DateTime releaseDate;
  String labelUrl;
  String vcode;
  String vlink;
  bool trillerAvailable;
  String lyricsId;
}

class ArtistMap {
  ArtistMap({
    this.primaryArtists,
    this.featuredArtists,
    this.artists,
  });

  List<Artist> primaryArtists;
  List<Artist> featuredArtists;
  List<Artist> artists;
}

class Artist {
  Artist({
    this.id,
    this.name,
    this.role,
    this.image,
    this.type,
    this.permaUrl,
  });

  String id;
  String name;
  Role role;
  String image;
  ArtistType type;
  String permaUrl;
}

enum Role {
  SINGER,
  LYRICIST,
  MUSIC,
  STARRING,
  FEATURED_ARTISTS,
  PRIMARY_ARTISTS
}

final roleValues = EnumValues({
  "featured_artists": Role.FEATURED_ARTISTS,
  "lyricist": Role.LYRICIST,
  "music": Role.MUSIC,
  "primary_artists": Role.PRIMARY_ARTISTS,
  "singer": Role.SINGER,
  "starring": Role.STARRING
});

enum ArtistType { ARTIST }

final artistTypeValues = EnumValues({"artist": ArtistType.ARTIST});

enum OriginEnum { PLAYLIST }

final originEnumValues = EnumValues({"playlist": OriginEnum.PLAYLIST});

class Rights {
  Rights({
    this.code,
    this.cacheable,
    this.deleteCachedObject,
    this.reason,
  });

  String code;
  String cacheable;
  String deleteCachedObject;
  String reason;
}

enum ListType { SONG }

final listTypeValues = EnumValues({"song": ListType.SONG});

class Modules {
  Modules({
    this.list,
  });

  ModulesList list;
}

class ModulesList {
  ModulesList({
    this.source,
    this.position,
    this.scrollType,
    this.title,
    this.subtitle,
    this.highlight,
    this.simpleHeader,
    this.noHeader,
    this.viewMore,
  });

  String source;
  int position;
  String scrollType;
  String title;
  String subtitle;
  String highlight;
  bool simpleHeader;
  bool noHeader;
  List<dynamic> viewMore;
}

class TopSongsMoreInfo {
  TopSongsMoreInfo({
    this.uid,
    this.lastUpdated,
    this.username,
    this.firstname,
    this.lastname,
    this.isFollowed,
    this.isFy,
    this.followerCount,
    this.fanCount,
    this.playlistType,
    this.share,
  });

  String uid;
  String lastUpdated;
  String username;
  String firstname;
  String lastname;
  String isFollowed;
  bool isFy;
  String followerCount;
  String fanCount;
  String playlistType;
  String share;
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
