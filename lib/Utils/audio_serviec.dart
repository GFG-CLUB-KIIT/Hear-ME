import 'package:just_audio/just_audio.dart';
import 'package:audio_session/audio_session.dart';

AudioPlayer player;

initPlaylist() async {}

initAudio() async {
  player = AudioPlayer();
  final session = await AudioSession.instance;
  await session.configure(AudioSessionConfiguration.speech());
}

disposeAudio() {
  player.stop();
  player.dispose();
}
