import 'package:flutter/material.dart';
import '../models/song.dart';
import '../services/player_service.dart';

class MiniPlayer extends StatelessWidget {
  final Song? song; final ZeiaPlayerHandler player; final VoidCallback onOpen;
  const MiniPlayer({super.key, required this.song, required this.player, required this.onOpen});
  @override Widget build(BuildContext context) { if(song==null) return const SizedBox.shrink(); return StreamBuilder<bool>(stream:player.player.playingStream, initialData:player.player.playing, builder:(c,s)=>Material(color:const Color(0xff171717), child:InkWell(onTap:onOpen, child:Padding(padding:const EdgeInsets.fromLTRB(12,8,8,8), child:Row(children:[ClipRRect(borderRadius:BorderRadius.circular(7), child:Image.asset(song!.cover,width:46,height:46,fit:BoxFit.cover)), const SizedBox(width:10), Expanded(child:Column(crossAxisAlignment:CrossAxisAlignment.start, children:[Text(song!.title,maxLines:1,overflow:TextOverflow.ellipsis,style:const TextStyle(fontWeight:FontWeight.w600)),Text(song!.artist,maxLines:1,overflow:TextOverflow.ellipsis,style:TextStyle(color:Colors.grey.shade500,fontSize:12))])), IconButton(onPressed:()=>s.data!?player.pause():player.play(), icon:Icon(s.data!?Icons.pause_rounded:Icons.play_arrow_rounded))]))))); }
}
