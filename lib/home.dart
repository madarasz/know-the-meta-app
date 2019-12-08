import 'package:flutter/material.dart';
import 'placeholder_widget.dart';
import 'meta.dart';

class Home extends StatefulWidget {
    @override
    State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
    int _currentIndex = 0;
    final List<Widget> _children = [
        MetaWidget(),
        PlaceholderWidget(Colors.deepOrange),
        PlaceholderWidget(Colors.blue)
    ];

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: _children[_currentIndex],
            bottomNavigationBar: BottomNavigationBar(
                backgroundColor: const Color(0xFFbf360c),
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.white30,
                onTap: onTabTapped,
                currentIndex: _currentIndex,
                items: [
                    BottomNavigationBarItem(
                        icon: new Icon(Icons.trending_up),
                        title: new Text('Meta'),
                    ),
                    BottomNavigationBarItem(
                        icon: new Icon(Icons.bug_report),
                        title: new Text('Cards'),
                        backgroundColor: const Color(0xFFf9683a)
                    ),
                    BottomNavigationBarItem(
                        icon: new Icon(Icons.settings),
                        title: new Text('Settings')
                    ),
                ]
            ),
            // body: TabBarView(
            //     children: [
            //         Icon(Icons.directions_car),
            //         Icon(Icons.directions_transit),
            //         Icon(Icons.directions_bike),
            //     ],
            // ),
        );
    }

    void onTabTapped(int index) {
        setState(() {
            print("changing tab");
            _currentIndex = index;
        });
    }
}
