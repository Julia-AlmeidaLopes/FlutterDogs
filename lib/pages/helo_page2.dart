import 'package:CursoProject/widgets/blue_button.dart';
import 'package:flutter/material.dart';

class HelloPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: Text("Talvez Vai - Page 2"),
          centerTitle: true,
      ),
      body: _body(context),
    );
  }

  _body(context) {
    return Center(
      child: BlueButton(
          "volta aí",
          onPressed: () => _onClickVoltar(context)
          ),
    );
  }

  _onClickVoltar(context) {
    Navigator.pop(context, "Tela 2");
  }
}