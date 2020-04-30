import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:quick_actions/quick_actions.dart';

import '../../providers/index.dart';
import '../../repositories/index.dart';
import 'package:flutter_icons/flutter_icons.dart';
import '../tabs/index.dart';

/// This view holds all tabs & its models: home, vehicles, upcoming & latest launches, & company tabs.
class StartScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();

    // Reading app shortcuts input
    final QuickActions quickActions = QuickActions();
    quickActions.initialize((type) {
      switch (type) {
        case 'villagers':
          setState(() => _currentIndex = 1);
          break;
        case 'critters':
          setState(() => _currentIndex = 2);
          break;
        case 'fossils':
          setState(() => _currentIndex = 3);
          break;
        case 'flowers':
          setState(() => _currentIndex = 4);
          break;
        default:
          setState(() => _currentIndex = 0);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: [
        HomeTab(),
        VillagerTab(),
        CritterTab(),
        FossilTab(),
        FlowerTab(),
      ]),
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: TextStyle(fontFamily: 'ProductSans'),
        unselectedLabelStyle: TextStyle(fontFamily: 'ProductSans'),
        type: BottomNavigationBarType.fixed,
        onTap: (index) => setState(() => _currentIndex = index),
        currentIndex: _currentIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            title: Text(FlutterI18n.translate(
              context,
              'ac.home.title',
            )),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            title: Text(FlutterI18n.translate(
              context,
              'ac.villagers.title',
            )), 
            icon: Icon(Icons.portrait)),
          BottomNavigationBarItem(
            title: Text(FlutterI18n.translate(
              context,
              'ac.critters.title',
            )),
            icon: Icon(Octicons.bug),
          ),
          BottomNavigationBarItem(
            title: Text(FlutterI18n.translate(
              context,
              'ac.fossils.title',
            )),
            icon: Icon(Octicons.bug),
          ),
          BottomNavigationBarItem(
            title: Text(FlutterI18n.translate(
              context,
              'ac.fossils.title',
            )),
            icon: Icon(Octicons.bug),
          ),
          /*BottomNavigationBarItem(
            title: Text('Flowers'),
            icon: Icon(Icons.home),
          )*/
        ],
      ),
    );
  }
}
