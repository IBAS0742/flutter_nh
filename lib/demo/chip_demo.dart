import 'package:flutter/material.dart';

class ChipDemo extends StatefulWidget {
  _ChipDemoState createState() => _ChipDemoState();
}

class _ChipDemoState extends State<ChipDemo> {
  List<String> _tags = [
    'Apple',
    'Banana',
    'Lemon'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChipDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Wrap(
              spacing: 8.0,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Chip(
                  label: Text('Life'),
                ),
                SizedBox(width: 8.0,),
                Chip(
                  label: Text('Sunset'),
                  backgroundColor: Colors.orange,
                ),
                SizedBox(width: 8.0,),
                Chip(
                  label: Text('Wanghao'),
                  avatar: CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Text('裕'),
                  ),
                ),
                SizedBox(width: 8.0,),
                Chip(
                  label: Text('Wanghao'),
                  avatar: CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://avatars3.githubusercontent.com/u/19849088',
                    ),
                    child: Text('裕'),
                  ),
                ),
                Chip(
                  label:Text('City'),
                  onDeleted: () {},
                  deleteIcon: Icon(Icons.delete),
                  deleteIconColor: Colors.redAccent,
                  deleteButtonTooltipMessage: 'Remove this tag',
                ),
                Divider(
                  color: Colors.grey,
                  height: 32.0,
                ),
                Wrap(
                  spacing: 8.0,
                  children: _tags.map((tag) {
                    return Chip(
                      label: Text(tag),
                      onDeleted: () {
                        setState(() {
                         _tags.remove(tag); 
                        });
                      },
                    );
                  }).toList(),
                )
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.restore),
        onPressed: () {
          setState(() {
            _tags = [
              'Apple',
              'Banana',
              'Lemon'
            ]; 
          });
        },
      ),
    );
  }
}