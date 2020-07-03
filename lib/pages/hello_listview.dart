import 'package:CursoProject/pages/dog_page.dart';
import 'package:CursoProject/utils/nav.dart';

import 'package:flutter/material.dart';

class Dog{
  String nome;
  String foto;
  Dog(this.nome, this.foto);
}

class HelloListView extends StatefulWidget{

  @override
  _HelloListViewState createState() => _HelloListViewState();
}

class _HelloListViewState extends State<HelloListView> {
  bool _gridView = true;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
      title: Text("ListView"),
      actions: <Widget>[
        IconButton(icon: Icon(Icons.list), onPressed: (){
          print("lista ta ok");
          setState(() {
            _gridView = false;
          });
        },),
        IconButton(icon: Icon(Icons.grid_on), onPressed: (){
          print("grid ta ok");
          setState(() {
            _gridView = true;
          });
        },)
      ],
      ),
      body: _body(),
    );
  }

  _body(){
    List<Dog> dogs = [
      Dog("catiorinho Boss", "assets/images/dog1.png"),
      Dog("catiorinho Slinky", "assets/images/dog2.png"),
      Dog("catiorinho Otto", "assets/images/dog3.png"),
      Dog("catiorão Rex", "assets/images/dog4.png"),
      Dog("catiorinho Zeus", "assets/images/dog5.png"),
      Dog("catiorinho Zeus II", "assets/images/dog5.png")   
    ];

    if(_gridView){
      return GridView.builder(
      itemCount: dogs.length,
      //itemExtent: 300, - só possui no listView
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index){
        return _itemView(dogs, index);
        },
      );
    } else{
      return ListView.builder(
      itemCount: dogs.length,
      itemExtent: 300,
      //gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), só tem no gridView
      itemBuilder: (context, index){
        return _itemView(dogs, index);
        },
      );
    }
  }

  _itemView(List<Dog> dogs, int index) {
    Dog dog = dogs[index];
    
    return GestureDetector(
      onTap: (){
        push(context, DogPage(dog));
      },
          child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          _img(dog.foto),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(7),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black45
              ),
              child: Text(
                dog.nome,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white
                ),
              ),
            ),//Text
          ),//Container
        ]
      ),
    );
  }

  _img(String img){
    return Image.asset(
      img,
      fit: BoxFit.cover,
      );
  }
}


