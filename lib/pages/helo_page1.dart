import 'package:flutter/material.dart';

class HelloPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: Text("Agora Vai - Page 1"),
          centerTitle: true,
      ),
      body: Container (
        color: Colors.yellow,
      ),
      
    );
  }
}