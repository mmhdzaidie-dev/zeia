import 'package:audio_service/audio_service.dart';
import 'package:audio_session/audio_session.dart';
import 'package:just_audio/just_audio.dart';
import '../models/song.dart';

class ZeiaPlayerHandler extends BaseAudioHandler with QueueHandler, SeekHandler {
  final AudioPlayer player = AudioPlayer();

  ZeiaPlayerHandler() {
    player.playbackEventStream.listen((event) {
      playbackState.add(PlaybackState(
        controls: [
          MediaControl.skipToPrevious,
          player.playing ? MediaControl.pause : MediaControl.play,
          MediaControl.skipToNext,
          MediaControl.stop,
        ],
        systemActions: const {MediaAction.seek, MediaAction.seekForward, MediaAction.seekBackward},
        androidCompactActionIndices: const [0,1,2],
        processingState: {
          ProcessingState.idle: AudioProcessingState.idle,
          ProcessingState.loading: AudioProcessingState.loading,
          ProcessingState.buffering: AudioProcessingState.buffering,
          ProcessingState.ready: AudioProcessingState.ready,
          ProcessingState.completed: AudioProcessingState.completed,
        }[player.processingState]!,
        playing: player.playing,
        updatePosition: player.position,
        bufferedPosition: player.bufferedPosition,
        speed: player.speed,
      ));
    });
    _configureSession();
  }

  Future<void> _configureSession() async {
    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.music());
  }

  Future<void> playSong(Song song) async {
    mediaItem.add(MediaItem(id:song.id, title:song.title, artist:song.artist, album:'ZEIA', artUri:Uri.tryParse(song.cover)));
    await player.setUrl(song.audioUrl);
    await player.play();
  }

  @override Future<void> play() => player.play();
  @override Future<void> pause() => player.pause();
  @override Future<void> stop() async { await player.stop(); await super.stop(); }
  @override Future<void> seek(Duration position) => player.seek(position);
  @override Future<void> fastForward() => player.seek(player.position + const Duration(seconds:10));
  @override Future<void> rewind() => player.seek(player.position - const Duration(seconds:10));
  @override Future<void> onTaskRemoved() async { await super.onTaskRemoved(); }
}

Future<ZeiaPlayerHandler> createAudioHandler() async {
  return AudioService.init(
    builder: () => ZeiaPlayerHandler(),
    config: const AudioServiceConfig(
      androidNotificationChannelId:'id.zdv.zeia.audio',
      androidNotificationChannelName:'ZEIA Music',
      androidNotificationOngoing:true,
      androidStopForegroundOnPause:true,
      androidNotificationIcon:'mipmap/ic_launcher',
      fastForwardInterval:Duration(seconds:10),
      rewindInterval:Duration(seconds:10),
    ),
  );
}
