import 'package:flutter/material.dart';
import 'dart:async';

enum Actions {
  Ok,Cancel
}

class AlertDialogDemo extends StatefulWidget {
  _AlertDialogDemoState createState() => _AlertDialogDemoState();
}

class _AlertDialogDemoState extends State<AlertDialogDemo> {
  String _choice = 'Nothing';

  Future _openAlertDialog() async {
    final action = await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('AlertDialog'),
          content: Text('Are you sure about this?'),
          actions: <Widget>[
            FlatButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.pop(context,Actions.Cancel);
              },
            ),
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.pop(context,Actions.Ok);
              },
            ),
          ],
        );
      }
    );
  
    switch (action) {
      case Actions.Ok:
        setState(() {
         _choice = 'OK'; 
        });
        break;
      case Actions.Cancel:
        setState(() {
         _choice = 'Cancel'; 
        });
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AlertDialogDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Your choice is : $_choice'),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      child: Text('Open AlertDialog'),
                      onPressed: _openAlertDialog,
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}