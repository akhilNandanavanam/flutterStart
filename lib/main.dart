import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wordpair = WordPair.random();
    
    return MaterialApp(
      title: 'Hello',
      
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Flutter'),
        ),

        body: Center(

          child: RandomWords(),
        ),
      ),
    );
  }
}
class RandomWordsState extends State<RandomWords> {
  final List<WordPair> _suggestions = <WordPair>[];
  final Set<WordPair> _set = new Set();
    final TextStyle _biggerFont = const TextStyle(fontSize: 18.0);
  @override
  Widget build(BuildContext context){
    return _buildSuggestions();
  }
  Widget _buildSuggestions() {
  return ListView.builder(
      padding: const EdgeInsets.all(10.0),
      itemBuilder: /*1*/ (context, i) {
        if (i.isOdd) return Divider(); /*2*/

        final index = i; /*3*/
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10)); /*4*/
        }
        return _buildRow(_suggestions[index]);
      });
}
Widget _buildRow(WordPair pair) {
  final bool alreadySaved = _set.contains(pair);
  return ListTile(
    title: Text(
      pair.asPascalCase,
      style: _biggerFont,
      
    ),
    trailing: new Icon(   // Add the lines from here... 
      alreadySaved ? Icons.favorite : Icons.favorite_border,
      color: alreadySaved ? Colors.red : null,
    ),
    onTap: (){
      setState(() {
              if(alreadySaved){
                _set.remove(pair);
              }
              else
              {
                _set.add(pair);
              }
            });
    },
  );
}
}
class RandomWords extends StatefulWidget{
  @override
  RandomWordsState createState() => new RandomWordsState();
}