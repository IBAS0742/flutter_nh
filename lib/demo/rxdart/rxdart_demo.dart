import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';

class RxDartDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('rxdart'),
        elevation: 0.0,
      ),
      body: RxDartHome()
    );
  }
}

class RxDartHome extends StatefulWidget {
  _RxDartHomeState createState() => _RxDartHomeState();
}

class _RxDartHomeState extends State<RxDartHome> {
  PublishSubject<String> _textFieldSubject;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _textFieldSubject =PublishSubject<String>();

    _textFieldSubject
      .debounce(Duration(milliseconds: 500))
      .where((item) => item.length > 8)
      .map((item) => 'item: $item')
      .listen((data) => print('$data'));

    // Observable<String> _observable =
    //   // Observable(Stream.fromIterable(['hello','你好']));
    //   // Observable(Stream.fromFuture(Future.value('hello ~')));
    //   // Observable.fromIterable(['hello']);
    //   // Observable.just('hello');
    //   Observable.periodic(Duration(seconds: 3),(x) => x.toString());

    // _observable.listen(print);

    // ReplaySubject<String> _subject =ReplaySubject<String>(maxSize: 2);

    // _subject.add('hi');
    // _subject.listen((data) => print('listen 1: $data'));
    // _subject.add('hello');
    // _subject.listen((data) => print('listen 2: ${data.toUpperCase()}'));
    // _subject.add('hello ibas');

    // _subject.close();
  }

  @override
  void dispose() {
    _textFieldSubject.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Theme(
      data: Theme.of(context).copyWith(
        primaryColor: Colors.black
      ),
      child: TextField(
        onChanged: (value) {
          _textFieldSubject.add('input $value');
        },
        onSubmitted: (value) {
          _textFieldSubject.add('submit $value');
        },
        decoration: InputDecoration(
          labelText: 'Title',
          filled: true
        ),
      ),
    );
  }
}