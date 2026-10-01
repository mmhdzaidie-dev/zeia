import 'package:flutter/material.dart';
import 'data/repositories/local_repository.dart';
import 'models/song.dart';
import 'services/player_service.dart';
import 'screens/home/home_screen.dart';
import 'screens/search/search_screen.dart';
import 'screens/library/library_screen.dart';
import 'screens/liked/liked_screen.dart';
import 'screens/player/player_screen.dart';
import 'widgets/mini_player.dart';
import 'core/theme/zeia_theme.dart';

class ZeiaApp extends StatefulWidget { final ZeiaPlayerHandler player; const ZeiaApp({super.key,required this.player}); @override State<ZeiaApp> createState()=>_ZeiaAppState(); }
class _ZeiaAppState extends State<ZeiaApp>{ final repo=LocalRepository(); int tab=0; Song? current; @override Widget build(BuildContext context){ final pages=[HomeScreen(repo:repo,player:widget.player,onPlay:_play),SearchScreen(repo:repo,onPlay:_play),LibraryScreen(repo:repo,onPlay:_play),LikedScreen(repo:repo,onPlay:_play)]; return MaterialApp(debugShowCheckedModeBanner:false,title:'ZEIA',theme:ZeiaTheme.dark,home:Scaffold(body:pages[tab],bottomNavigationBar:Column(mainAxisSize:MainAxisSize.min,children:[MiniPlayer(song:current,player:widget.player,onOpen:(){if(current!=null)Navigator.push(context,MaterialPageRoute(builder:(_)=>PlayerScreen(song:current!,player:widget.player)));}),NavigationBar(selectedIndex:tab,onDestinationSelected:(i)=>setState(()=>tab=i),destinations:const[NavigationDestination(icon:Icon(Icons.home_outlined),selectedIcon:Icon(Icons.home_rounded),label:'Home'),NavigationDestination(icon:Icon(Icons.search_rounded),label:'Search'),NavigationDestination(icon:Icon(Icons.library_music_outlined),selectedIcon:Icon(Icons.library_music_rounded),label:'Library'),NavigationDestination(icon:Icon(Icons.favorite_border_rounded),selectedIcon:Icon(Icons.favorite_rounded),label:'Liked')])]))); }
void _play(Song s) async {setState(()=>current=s); await widget.player.playSong(s);}
}
