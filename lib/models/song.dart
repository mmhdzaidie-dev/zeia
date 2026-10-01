class Song {
  final String id;
  final String title;
  final String artist;
  final String cover;
  final String audioUrl;
  final String category;
  final Duration duration;

  const Song({required this.id, required this.title, required this.artist, required this.cover, required this.audioUrl, required this.category, this.duration = Duration.zero});
}
