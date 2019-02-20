import 'package:flutter/material.dart';
import 'demo/listview_demo.dart';
import 'demo/drawer_demo.dart';
import 'demo/bottom_navigation_bar_demo.dart';
import 'demo/basic_demo.dart';
import 'demo/layout_demo.dart';
import 'demo/view_demo.dart';
import 'demo/navigator_demo.dart';
import 'demo/form_demo.dart';
import 'demo/material_component.dart';
import 'demo/state/state_management_demo.dart';
import 'demo/stream/stream_demo.dart';
import 'demo/rxdart/rxdart_demo.dart';

void main() {
  runApp(
    App()
  );
}

class App extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
      return MaterialApp(
        // home: NavigatorDemo(),
        initialRoute: '/rxdart',
        routes: {
          '/': (context) => Home(),
          '/about': (context) => Page(title: 'About'),
          '/form': (context) => FormDemo(),
          '/mdc': (context) => MaterialComponent(),
          '/state-management': (context) => StateManagementDemo(),
          '/Stream': (context) => StreamDemo(),
          '/rxdart': (context) => RxDartDemo(),
        },
        theme: ThemeData(
          primarySwatch: Colors.blue,
          highlightColor: Colors.green,
          splashColor: Colors.red,
          accentColor: Color.fromRGBO(3, 54, 255, 1.0)
        ),
      );
    }
}

class Home extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
      return DefaultTabController(
        length: 4,
        child: Scaffold(
          backgroundColor: Colors.grey[100],
          appBar: AppBar(
            title: Text('haha'),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search),
                tooltip: 'Search',
                onPressed: () => debugPrint('点击了搜索按钮'),
              )
            ],
            elevation: 0.0,
            bottom: TabBar(
              unselectedLabelColor: Colors.black38,
              indicatorColor: Colors.black54,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 1.0,
              tabs: <Widget>[
                Tab(icon: Icon(Icons.local_florist)),
                Tab(icon: Icon(Icons.change_history)),
                Tab(icon: Icon(Icons.directions_bike)),
                Tab(icon: Icon(Icons.view_quilt))
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              ListViewDemo(),
              // Icon(Icons.change_history,size: 128.0,color: Colors.black12),
              BasicDemo(),
              LayoutDemo(),
              ViewDemo()
            ],
          ),
          drawer: drawerDemo(),
          bottomNavigationBar: BottomNavigationBarDemo()
        ),
      );
    }
}

class HomeView extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.menu),
            tooltip: 'Navigation',
            onPressed: () => debugPrint('点击了菜单按钮'),
          ),
          title: Text('haha'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              tooltip: 'Search',
              onPressed: () => debugPrint('点击了搜索按钮'),
            )
          ],
          elevation: 0.0,
        ),
        body: ListViewDemo(),
      );
    }
}

