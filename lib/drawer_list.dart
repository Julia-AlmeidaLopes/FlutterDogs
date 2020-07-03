import 'package:flutter/material.dart';

class DrawerList extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    return SafeArea(
          child: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Julia Lopes"),
              accountEmail: Text("Julinha@juju"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("assets/images/dog4.png"),
              ),
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text("Catiorinhos Favoritos"),
              subtitle: Text("acessar os auau fav"),
              trailing: Icon(Icons.arrow_forward),
              onTap: (){
                print("fav");
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text("Ajuda"),
              subtitle: Text("Mais info"),
              trailing: Icon(Icons.arrow_forward),
              onTap: (){
                print("ajuda");
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("Sair"),
              onTap: (){
                print("Logout");
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}