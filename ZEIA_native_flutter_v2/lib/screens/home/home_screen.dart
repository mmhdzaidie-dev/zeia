import 'package:flutter/material.dart';
import '../../data/repositories/local_repository.dart';
import '../../models/song.dart';
import '../../widgets/category_row.dart';
import '../../widgets/song_card.dart';
import '../../services/player_service.dart';

class HomeScreen extends StatelessWidget {
  final LocalRepository repo; final ZeiaPlayerHandler player; final ValueChanged<Song> onPlay;
  const HomeScreen({super.key, required this.repo, required this.player, required this.onPlay});
  @override Widget build(BuildContext context) => CustomScrollView(slivers:[
    SliverToBoxAdapter(child:Padding(padding:const EdgeInsets.fromLTRB(20,22,20,8), child:ClipRRect(borderRadius:BorderRadius.circular(18), child:AspectRatio(aspectRatio:2.35, child:Image.asset('assets/banner.png',fit:BoxFit.cover))))),
    SliverToBoxAdapter(child:Padding(padding:const EdgeInsets.fromLTRB(20,18,20,0), child:Text('Quick Picks',style:const TextStyle(fontSize:22,fontWeight:FontWeight.w700)))),
    SliverToBoxAdapter(child:SizedBox(height:205,child:ListView.separated(padding:const EdgeInsets.all(20),scrollDirection:Axis.horizontal,itemCount:repo.songs.length,separatorBuilder:(_,__)=>const SizedBox(width:14),itemBuilder:(_,i)=>SongCard(song:repo.songs[i],onTap:()=>onPlay(repo.songs[i]))))),
    ...LocalRepository.categories.skip(1).map((c)=>SliverToBoxAdapter(child:CategoryRow(title:c,songs:repo.songs.where((s)=>s.category==c).isEmpty?repo.songs:repo.songs.where((s)=>s.category==c).toList(),onPlay:onPlay))),
    const SliverToBoxAdapter(child:SizedBox(height:100)),
  ]);
}
