import 'package:flutter/material.dart';
import 'quote.dart';
import 'quote_card.dart';

// Controller component of the MVC design pattern.
void main() {
  runApp(MaterialApp(home: QuoteList()));
}

class QuoteList extends StatefulWidget {
  @override
  _QuoteListState createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {
  final List<Quote> original_quotes = [
    Quote(text: "Listen, I don’t want to add to your misery, but the coffee maker is broken.", author: "Cameron Howe"),
    Quote(text: "Computers aren’t the thing. They’re the thing that gets us to the thing.", author: "Joe MacMillan"),
    Quote(text: "Software comes and goes. Hardware is forever.", author: "Donna Clark"),
  ];
  List<Quote> quotes = [
    Quote(text: "Listen, I don’t want to add to your misery, but the coffee maker is broken.", author: "Cameron Howe"),
    Quote(text: "Computers aren’t the thing. They’re the thing that gets us to the thing.", author: "Joe MacMillan"),
    Quote(text: "Software comes and goes. Hardware is forever.", author: "Donna Clark"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Awesome Quotes"),
        elevation: 0.0,
        backgroundColor: Colors.redAccent[200],
        centerTitle: true,
      ),
      body: Column(
          children: quotes
              .map((quote) => QuoteCard(
                  quote: quote,
                  delete: () {
                    setState(() {
                      quotes.remove(quote);
                    });
                  }))
              .toList()),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.auto_fix_high),
        backgroundColor: Colors.redAccent[200],
        onPressed: () {
          setState(() {
            quotes.clear();
            quotes.addAll(original_quotes);
          });
        },
      ),
    );
  }
}
