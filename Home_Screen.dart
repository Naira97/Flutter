import 'dart:ui';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        leading: Icon(
            Icons.menu
        ),
        title: Text(
            'First App'
        ),
        actions: [
          IconButton(
              onPressed: (){
                print('notification clicked');
                },
              icon: Icon(
            Icons.notification_important,
              )
          ),

          IconButton(
              onPressed: (){
                print('Search');
                },
              icon: Icon(
            Icons.search,
              )
          ),
        ],
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.red,
              child: Text(
                'First Text'
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.blue,
              child: Text(
                  'Second Text'
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.pinkAccent,
              child: Text(
                  'Third Text'
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.green,
              child: Text(
                  'Forth Text'
              ),
            ),
          ),
        ],
      ),
    );
  }
}