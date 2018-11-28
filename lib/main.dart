import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_app/HomePage.dart';

void main(){
  runApp(new MaterialApp(
    title: "Planets",
    home: new HomePage(),
  ));
}

//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
////    final wordPair = WordPair.random();
//    return MaterialApp(
//        title: "test",
//        theme: ThemeData(
//          primaryColor: Colors.white
//        ),
//        home: RandomWords());
//  }
//}
//
//class RandomWords extends StatefulWidget {
//  @override
//  RandomWordsState createState() => RandomWordsState();
//}
//
//class RandomWordsState extends State<RandomWords> {
//  final List<WordPair> _suggestion = <WordPair>[];
//  final Set<WordPair> _saved = Set<WordPair>();
//  final TextStyle _biggerFont = TextStyle(fontSize: 18.0);
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: const Text("Hello World"),
//        actions: <Widget>[
//          IconButton(icon: const Icon(Icons.list), onPressed: _pushSaved),
//        ],
//      ),
//      body: _buildSuggestion(),
//    );
//  }
//
//  void _pushSaved() {
//    Navigator.of(context)
//        .push(MaterialPageRoute(builder: (BuildContext context) {
//      final Iterable<ListTile> tiles = _saved.map((WordPair w) {
//        return ListTile(
//          title: Text(w.asPascalCase, style: _biggerFont),
//        );
//      });
//
//      final List<Widget> divided =
//          ListTile.divideTiles(tiles: tiles, context: context).toList();
//
//      return Scaffold(
//        appBar: AppBar(title: const Text("Save")),
//        body: ListView(children: divided),
//      );
//    }));
//  }
//
//  Widget _buildSuggestion() {
//    return ListView.builder(
//        padding: const EdgeInsets.all(16.0),
//        itemBuilder: (BuildContext _contxt, int i) {
//          if (i.isOdd) {
//            //奇数行
//            return Divider(); //奇数项画下划线
//          }
//
//          // 语法 "i ~/ 2" 表示i除以2，但返回值是整形（向下取整）
//          //这里的i为偶数项，除以2刚好对应List的索引值
//          final int index = i ~/ 2;
//          if (index >= _suggestion.length) {
//            _suggestion.addAll(generateWordPairs().take(10));
//          }
//          return _buildRow(_suggestion[index]);
//        });
//  }
//
//  Widget _buildRow(WordPair w) {
//    final bool isSaved = _saved.contains(w);
//    return ListTile(
//      title: Text(w.asPascalCase, style: _biggerFont),
//      trailing: Icon(
//        isSaved ? Icons.favorite : Icons.favorite_border,
//        color: isSaved ? Colors.red : null,
//      ),
//      onTap: () {
//        //item点击时
//        setState(() {
//          if (isSaved)
//            _saved.remove(w);
//          else
//            _saved.add(w);
//        });
//      },
//    );
//  }
//}
//
//class SampleApp extends StatelessWidget {
//  // This widget is the root of your application.
//  @override
//  Widget build(BuildContext context) {
//    return new MaterialApp(
//      title: 'Sample App',
//      theme: new ThemeData(
//        primarySwatch: Colors.blue,
//      ),
//      home: new SampleAppPage(),
//    );
//  }
//}
//
//class SampleAppPage extends StatefulWidget {
//  SampleAppPage({Key key}) : super(key: key);
//
//  @override
//  _SampleAppPageState createState() => new _SampleAppPageState();
//}
//
//class _SampleAppPageState extends State<SampleAppPage> {
//  // Default value for toggle
//  bool toggle = true;
//  void _toggle() {
//    setState(() {
//      toggle = !toggle;
//    });
//  }
//
//  _getToggleChild() {
//    if (toggle) {
//      return new Text('Toggle One');
//    } else {
//      return new MaterialButton(onPressed: () {}, child: new Text('Toggle Two'));
//    }
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//      appBar: new AppBar(
//        title: new Text("Sample App"),
//      ),
//      body: new Center(
//        child: _getToggleChild(),
//      ),
//      floatingActionButton: new FloatingActionButton(
//        onPressed: _toggle,
//        tooltip: 'Update Text',
//        child: new Icon(Icons.update),
//      ),
//    );
//  }
//}