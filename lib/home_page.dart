import 'package:flutter/material.dart';

import "screens/main_screen.dart";
import "screens/about_screen.dart";

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget screen;
    switch (selectedIndex) {
      case 0:
        screen = MainScreen();
        break;
      case 1:
        screen = const AboutScreen();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        body: screen,
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        bottomNavigationBar: NavigationBar(
          selectedIndex: selectedIndex,
          onDestinationSelected: (value) => {
            setState(() {
              selectedIndex = value;
            })
          },
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.movie),
              label: 'Movies',
            ),
            NavigationDestination(
              icon: Icon(Icons.info),
              label: 'About',
            )
          ],
        ),
      );
    });
  }
}
