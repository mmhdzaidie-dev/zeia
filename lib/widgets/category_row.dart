import 'package:flutter/material.dart';
import '../models/song.dart';
import 'song_card.dart';

class CategoryRow extends StatelessWidget {
  final String title; final List<Song> songs; final ValueChanged<Song> onPlay;
  const CategoryRow({super.key, required this.title, required this.songs, required this.onPlay});
  @override Widget build(BuildContext context) => Column(crossAxisAlignment:CrossAxisAlignment.start, children:[
    Padding(padding:const EdgeInsets.fromLTRB(20,20,20,12), child:Text(title, style:const TextStyle(fontSize:20,fontWeight:FontWeight.w700))),
    SizedBox(height:205, child:ListView.separated(padding:const EdgeInsets.symmetric(horizontal:20), scrollDirection:Axis.horizontal, itemCount:songs.length, separatorBuilder:(_,__)=>const SizedBox(width:14), itemBuilder:(_,i)=>SongCard(song:songs[i], onTap:()=>onPlay(songs[i])))),
  ]);
}
