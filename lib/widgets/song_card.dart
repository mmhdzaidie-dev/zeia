import 'package:flutter/material.dart';
import '../models/song.dart';

class SongCard extends StatelessWidget {
  final Song song;
  final VoidCallback onTap;
  const SongCard({super.key, required this.song, required this.onTap});
  @override Widget build(BuildContext context) => SizedBox(width:150, child: InkWell(onTap:onTap, borderRadius:BorderRadius.circular(12), child:Column(crossAxisAlignment:CrossAxisAlignment.start, children:[
    Expanded(child:ClipRRect(borderRadius:BorderRadius.circular(12), child:Image.asset(song.cover, fit:BoxFit.cover, width:150))),
    const SizedBox(height:8), Text(song.title, maxLines:1, overflow:TextOverflow.ellipsis, style:const TextStyle(fontWeight:FontWeight.w600)),
    const SizedBox(height:3), Text(song.artist, maxLines:1, overflow:TextOverflow.ellipsis, style:TextStyle(color:Colors.grey.shade500, fontSize:12)),
  ])));
}
