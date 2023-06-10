import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Card Index',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CardList(),
    );
  }
}

class CardList extends StatefulWidget {
  @override
  _CardListState createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  List<int> cardIndices = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card Index'),
      ),
      body: ListView.builder(
        itemCount: cardIndices.length,
        itemBuilder: (context, index) {
          return CardItem(index + 1);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            cardIndices.add(cardIndices.length + 1);
          });
        },
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  final int index;

  CardItem(this.index);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'Card $index',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}