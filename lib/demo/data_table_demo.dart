import 'package:flutter/material.dart';
import '../model/post.dart';

class DataTableDemo extends StatefulWidget {
  _DataTableDemoState createState() => _DataTableDemoState();
}

class _DataTableDemoState extends State<DataTableDemo> {
  int _sortColumnIndex = 0;
  bool _sortAscending = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DataTableDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            DataTable(
              // onSelectAll: (bool value) {},
              sortColumnIndex: _sortColumnIndex,
              sortAscending: _sortAscending,
              columns: [
                DataColumn(
                  // label: Container(
                  //   width: 150.0,
                  //   child: Text('Title')
                  // )
                  label:Text('Title'),
                  onSort: (int index,bool ascending) {
                    setState(() {
                     _sortAscending = ascending;
                     _sortColumnIndex = index; 

                     posts.sort((a,b) {
                       if (!ascending) {
                         final c = a;
                         a = b;
                         b = c;
                       }
                       return a.title.length.compareTo(b.title.length);
                     });
                    });
                  },
                ),
                DataColumn(
                  label: Text('Author')
                ),
                DataColumn(
                  label: Text('Image')
                ),
              ],
              rows: posts.map((post) {
                return DataRow(
                  selected: post.selected,
                  onSelectChanged: (bool value) {
                    setState(() {
                     if (post.selected != value) {
                       post.selected = value;
                     } 
                    });
                  },
                  cells: [
                    DataCell(Text(post.title)),
                    DataCell(Text(post.author)),
                    DataCell(Image.network(post.imageUrl)),
                  ]
                );
              }).toList(),
            )
          ],
        ),
      ),
    );
  }
}