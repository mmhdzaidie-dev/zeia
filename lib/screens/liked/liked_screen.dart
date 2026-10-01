import 'package:flutter/material.dart';
import '../../data/repositories/local_repository.dart';
import '../../models/song.dart';

class LikedScreen extends StatelessWidget { final LocalRepository repo; final ValueChanged<Song> onPlay; const LikedScreen({super.key,required this.repo,required this.onPlay}); @override Widget build(BuildContext context)=>ListView(padding:const EdgeInsets.fromLTRB(20,24,20,110),children:[const Text('Liked Songs',style:TextStyle(fontSize:28,fontWeight:FontWeight.w800)),const SizedBox(height:22),...repo.songs.map((s)=>ListTile(onTap:()=>onPlay(s),contentPadding:EdgeInsets.zero,leading:ClipRRect(borderRadius:BorderRadius.circular(8),child:Image.asset(s.cover,width:54,height:54,fit:BoxFit.cover)),title:Text(s.title),subtitle:Text(s.artist),trailing:const Icon(Icons.favorite_rounded))) ]); }
