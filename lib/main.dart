import 'package:a_music_player_flutter/models/nav_item.dart';
import 'package:a_music_player_flutter/ui/album/album_screen.dart';
import 'package:a_music_player_flutter/ui/artist/artist_screen.dart';
import 'package:a_music_player_flutter/ui/home/home_screen.dart';
import 'package:a_music_player_flutter/ui/playlist/playlist_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        // Define the default brightness and colors.
        brightness: Brightness.light,
        primaryColor: Colors.lightBlue[800],

        // Define the default font family.
        fontFamily: 'Georgia',

        // Define the default `TextTheme`. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          titleLarge: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyMedium: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          showSelectedLabels: true,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
        ),
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  static const _navItems = [
    NavItem(
      title: "Home",
      icon: CupertinoIcons.home,
      screen: HomeScreen(),
    ),
    NavItem(
      title: "Album",
      icon: CupertinoIcons.music_albums,
      screen: AlbumScreen(),
    ),
    NavItem(
      title: "Artist",
      icon: Icons.music_note,
      screen: ArtistScreen(),
    ),
    NavItem(
      title: "Playlist",
      icon: CupertinoIcons.music_note_list,
      screen: PlaylistScreen(),
    ),
  ];

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        destinations: MainScreen._navItems
            .map(
              (e) => NavigationDestination(
                icon: Icon(e.icon),
                label: e.title,
              ),
            )
            .toList(),
        onDestinationSelected: (index) => setState(() {
          selectedIndex = index;
        }),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          MainScreen._navItems.map((e) => e.screen).elementAt(selectedIndex),
          BottomSheet(
            animationController: BottomSheet.createAnimationController(this),
            onClosing: () {},
            builder: (context) => ListView(
              children: List.generate(
                15,
                (index) => Container(
                  color: Colors.red,
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: Text("Text  $index"),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
