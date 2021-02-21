import 'package:HearMe/model/songModel.dart';
import 'package:just_audio/just_audio.dart';
import 'package:audio_session/audio_session.dart';

AudioPlayer player;

initPlayList(List<SongModel> songs, int i) async {
  await player.setAudioSource(
    ConcatenatingAudioSource(
        useLazyPreparation: true,
        children: songs
            .map((e) => AudioSource.uri(Uri.parse(songs[i].songURL),
                tag: songs[i] 
                ))
            .toList()),
    initialIndex: i,
    initialPosition: Duration.zero,
  );
  await player.play();
}

initAudio() async {
  player = AudioPlayer();
  final session = await AudioSession.instance;
  await session.configure(AudioSessionConfiguration.speech());
}

disposeAudio() {
  player.stop();
  player.dispose();
}
