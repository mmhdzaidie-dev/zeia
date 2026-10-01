import '../../models/song.dart';

class LocalRepository {
  static const categories = ['Semua','Chill','Focus','Commute','Gaming','Energize','Party','Feel Good','Romance','Workout','Sleep','Sad','Happy','Nostalgia','Acoustic','Pop','Rock'];

  // Temporary catalog. Replace this repository with an API repository when the ZEIA database is ready.
  final List<Song> songs = const [
    Song(id:'demo-1', title:'ZEIA Session', artist:'ZEIA', cover:'assets/banner.png', audioUrl:'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3', category:'Chill'),
    Song(id:'demo-2', title:'Midnight Drive', artist:'ZEIA', cover:'assets/banner.png', audioUrl:'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3', category:'Commute'),
    Song(id:'demo-3', title:'Focus Flow', artist:'ZEIA', cover:'assets/banner.png', audioUrl:'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-3.mp3', category:'Focus'),
    Song(id:'demo-4', title:'Night Energy', artist:'ZEIA', cover:'assets/banner.png', audioUrl:'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-4.mp3', category:'Energize'),
  ];
}
