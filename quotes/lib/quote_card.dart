import 'package:flutter/material.dart';
import 'quote.dart';

class QuoteCard extends StatelessWidget {
  final Quote quote;          // hmmm
  final Function delete;
  QuoteCard({ this.quote, this.delete });  // dont get this

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                    quote.text,
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.bold,
                    )
                ),
                SizedBox(
                  height: 6.0,
                ),
                Text (
                    quote.author,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey[800],
                    )
                ),
                SizedBox(
                  height: 8.0,
                ),
                FlatButton.icon (
                  onPressed: delete,
                  label: Text('Delete Quote'),
                  icon: Icon(Icons.delete),
                ),
              ]
          ),
        )
    );
  }
}