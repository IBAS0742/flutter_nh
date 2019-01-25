import 'package:flutter/material.dart';
import 'package:test_one/model/post.dart';

class ViewDemo extends StatelessWidget {

  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return GridViewBuilderDemo();
    }
}

class GridViewBuilderDemo extends StatelessWidget {
  Widget _gridItemBuilder(BuildContext context,int index) {
    return Container(
      child: Image.network(
        posts[index].imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }

  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return GridView.builder(
        padding: EdgeInsets.all(8.0),
        itemCount: posts.length,
        itemBuilder: _gridItemBuilder,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0
        ),
      );
    }
}

class GridViewExtentDemo extends StatelessWidget {
  List<Widget> _buildTiles(int length) {
    return List.generate(length, (int index) {
      return Container(
        color: Colors.grey[300],
        alignment: Alignment(0, 0),
        child: Text(
          'item $index',
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.grey
          ),
        ),
      );
    });
  }

  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return GridView.extent(
        maxCrossAxisExtent: 80.0,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
        scrollDirection: Axis.vertical,
        children: _buildTiles(100),
      );
    }
}

class GridViewCountDemo extends StatelessWidget {
  List<Widget> _buildTiles(int length) {
    return List.generate(length, (int index) {
      return Container(
        color: Colors.grey[300],
        alignment: Alignment(0, 0),
        child: Text(
          'item $index',
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.grey
          ),
        ),
      );
    });
  }

  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
        scrollDirection: Axis.vertical,
        children: _buildTiles(100),
      );
    }
}

class PageViewBuilderDemo extends StatelessWidget {
  Widget _pageItemBuilder(BuildContext context,int index) {
    return Stack(
      children: <Widget>[
        SizedBox.expand(
          child: Image.network(
            posts[index].imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 8.0,
          left: 8.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                posts[index].title,
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),
              Text(
                posts[index].author
              )
            ],
          ),
        )
      ],
    );
  }

  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return PageView.builder(
        itemCount: posts.length,
        itemBuilder: _pageItemBuilder,
      );
    }
}

class PageViewDemo extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return PageView(
        pageSnapping: true,
        reverse: false,
        scrollDirection: Axis.horizontal,
        onPageChanged: (currentPage) => 
            debugPrint("page" + currentPage.toString()),
        controller: PageController(
          initialPage: 1,
          keepPage: false,
          viewportFraction: 0.85
        ),
        children: <Widget>[
          Container(
            color: Colors.brown[900],
            alignment: Alignment(0, 0),
            child: Text(
              'One',
              style: TextStyle(
                fontSize: 32.0,
                color: Colors.white
              ),
            ),
          ),
          Container(
            color: Colors.grey[900],
            alignment: Alignment(0, 0),
            child: Text(
              'Two',
              style: TextStyle(
                fontSize: 32.0,
                color: Colors.white
              ),
            ),
          ),
          Container(
            color: Colors.blueGrey[900],
            alignment: Alignment(0, 0),
            child: Text(
              'Three',
              style: TextStyle(
                fontSize: 32.0,
                color: Colors.white
              ),
            ),
          )
        ],
      );
    }
}

