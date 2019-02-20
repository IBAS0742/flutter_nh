import 'package:flutter/material.dart';
import 'dart:async';

class StreamDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StreamDemo'),
        elevation: 0.0,
      ),
      body: StreamDemoHome(),
    );
  }
}

class StreamDemoHome extends StatefulWidget {
  _StreamDemoHomeState createState() => _StreamDemoHomeState();
}

class _StreamDemoHomeState extends State<StreamDemoHome> {
  StreamSubscription _streamSubscription;
  StreamController<String> _streamDemo;
  StreamSink _skinDemo;
  String _data = '...';

  @override
  void dispose() {
    // TODO: implement dispose
    _streamDemo.close();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print('Create a stream');
    // Stream<String> _streamDemo = Stream.fromFuture(fetchData());
    _streamDemo = StreamController.broadcast();
    _skinDemo =_streamDemo.sink;

    print('start listen');
    _streamSubscription = _streamDemo.stream.listen(onData,onError: onError,onDone: onDone);
  }

  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 2));
    return 'Hello ~';
    // throw 'Something error';
  }

  void onData(String data) {
    print('$data');
    setState(() {
     _data = data; 
    });
  }

  void onError(error) {
    print('Error $error');
  }

  void onDone() {
    print('done');
  }

  void _pauseStream() {
    print('Pause subscription');
    _streamSubscription.pause();
  }

  void _resumeStream() {
    print('Resume subscription');
    _streamSubscription.resume();
  }

  void _cancelStream() {
    print('Cancel subscription');
    _streamSubscription.cancel();
  }

  void addDataToStream() async {
    print('Add data to stream');
    String data = await fetchData();
    // _streamDemo.add(data);
    _skinDemo.add(data);
  }

  @override
  Widget build(BuildContext context) {
    return Container(      
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Text('$_data'),
            StreamBuilder(
              stream: _streamDemo.stream,
              initialData: '...',
              builder: (context,snapshot) {
                return Text('${snapshot.data}');
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  child: Text('Add'),
                  onPressed: addDataToStream,
                ),
                FlatButton(
                  child: Text('Pause'),
                  onPressed: _pauseStream,
                ),
                FlatButton(
                  child: Text('Resume'),
                  onPressed: _resumeStream,
                ),
                FlatButton(
                  child: Text('Cancel'),
                  onPressed: _cancelStream,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}