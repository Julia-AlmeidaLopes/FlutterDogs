import 'package:CursoProject/drawer_list.dart';
import 'package:CursoProject/utils/nav.dart';
import 'package:flutter/material.dart';
import 'package:CursoProject/pages/hello_listview.dart';
import 'package:CursoProject/pages/helo_page1.dart';
import 'package:CursoProject/pages/helo_page2.dart';
import 'package:CursoProject/pages/helo_page3.dart';
import 'package:CursoProject/widgets/blue_button.dart';
import 'package:fluttertoast/fluttertoast.dart';



class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
          child: Scaffold(
          appBar: AppBar(
            title: Text("Primeiro App em Flutter"),
            centerTitle: true,
            bottom: TabBar(tabs: [
              Tab(text: "comedia",),
              Tab(text: "comediao",),
              Tab(text: "comediante",),
            ]),
          ),
          body: TabBarView(children: [
            _body(context),
            Container(
              color: Colors.green
            ),
            Container(
              color: Colors.orange
            ),
          ]),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: (){
            _onClickFab();
            },
          ),
          drawer: DrawerList(
            
          ),
        ),
    );
  }

    _onClickFab(){
      print("Add");
    }
    _body(context) {
    return Container(
        color: Colors.yellow,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _text(),
            _pageView(),
            _buttons(),
          ],
        )
    );
  }

  _pageView() {
    return Container(
            margin: EdgeInsets.all(20), 
            height: 200,
            child: PageView(
              children: <Widget>[
                _img("assets/images/dog1.png"),
                _img("assets/images/dog2.png"),
                _img("assets/images/dog3.png"),
                _img("assets/images/dog4.png"),
                _img("assets/images/dog5.png")
              ],
            ),
          );
  }

      _buttons() {
        return Builder(builder: (context) {
            return Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    BlueButton("ListView",onPressed: () => _onClickNavigator(context, HelloListView())),
                    BlueButton("Page 2", onPressed:() => _onClickNavigator(context, HelloPage2())),
                    BlueButton("Page 3",onPressed: () => _onClickNavigator(context, HelloPage3())),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    BlueButton("Snack",onPressed: () => _onClickSnack(context)),
                    BlueButton("Dialog", onPressed: () => _onClickDialog(context)),
                    BlueButton("Toast", onPressed: () => _onClickToast())
                  ],
                )
              ],
            );
          },
        );
  }
  
    void _onClickNavigator(context, Widget page) async {
      String s = await push(context, page);
      print(">> $s");
     }

     _onClickToast() {
       Fluttertoast.showToast(
        msg: "Amada???",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
     } 

     _onClickDialog(BuildContext context) {
       showDialog(context: context, 
       barrierDismissible: false,
       builder: (context){
         return WillPopScope(
           onWillPop: () async => false,
            child: AlertDialog(
             title: Text("Você me paga um açaí por favor?"),
             actions: <Widget>[
               FlatButton(
                 child: Text("Ok"),
                 onPressed: (){
                   Navigator.pop(context);
                   print("clicks dialog");
                 },
               ),
                 FlatButton(
                 child: Text("Cancela"),
                 onPressed: (){
                   Navigator.pop(context);
                 },
               )
             ],
           ),
         );
       });
     }

     _onClickSnack(context) {
       Scaffold.of(context).showSnackBar(SnackBar(
         content: Text("Tô com fome!!"),
         action: SnackBarAction(
           textColor: Colors.red,
           label: "Ok", 
           onPressed: (){
           print("clicado");
         }),
       ));
     }

  

  _img(String img){
    return Image.asset(
      img,
      fit: BoxFit.cover,
      );
  }
  Text _text() {
    return Text(
        "Cê é top mesmo hein??",
        style: TextStyle(
        fontSize: 25,
        color: Colors.blue,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        decoration: TextDecoration.underline,            
        decorationColor: Colors.black
        ),
      );
  }
}

