import 'package:flutter/material.dart';
import '../model/post.dart';

class PostDataSource extends DataTableSource {
  final List<Post> _posts = posts;
  int _selectedCount = 0;

  @override
  DataRow getRow(int index) {
    final Post post = _posts[index];
    // TODO: implement getRow
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(Text(post.title)),
        DataCell(Text(post.author)),
        DataCell(Image.network(post.imageUrl)),
      ]
    );
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => _posts.length;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => _selectedCount;
  
  void _sort(getField(post),bool ascending) {
    _posts.sort((a,b) {
      if (!ascending) {
        final c = a;
        a = b;
        b = c;
      }
      return Comparable.compare(getField(a),getField(b));
    });

    notifyListeners();
  }
}

class PaginatedDataTableDemo extends StatefulWidget {
  _PaginatedDataTableDemoState createState() => _PaginatedDataTableDemoState();
}

class _PaginatedDataTableDemoState extends State<PaginatedDataTableDemo> {
  int _sortColumnIndex = 0;
  bool _sortAscending = false;

  final PostDataSource _postDataSource = PostDataSource();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PaginatedDataTableDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            PaginatedDataTable(
              header: Text('Posts'),
              source: _postDataSource,
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
                    _postDataSource._sort((post) => post.title.length,ascending);
                    setState(() {
                     _sortAscending = ascending;
                     _sortColumnIndex = index; 
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
            )
          ],
        ),
      ),
    );
  }
}