import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobileprojet/models/utilisateur.dart';
import 'dart:async';
import 'package:mobileprojet/services/api_utli.dart';
import 'package:mobileprojet/utilisateur/utilisateurlist.dart';




class utilisateur extends StatefulWidget {
utilisateur({Key? key, required this.title}) : super(key: key);

  // This widget is the utilisateur page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _utilisateurState createState() => _utilisateurState();
}

class _utilisateurState extends State<utilisateur> {
     final ApiUtli api = ApiUtli();
  List<Utilisateur> utilisateurList=[];

  @override
  Widget build(BuildContext context) {
    if(utilisateurList == null) {
      utilisateurList = <Utilisateur>[];
    }
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: new Container(
        child: new Center(
            child: new FutureBuilder(
              future: loadList(),
              builder: (context, snapshot) {
                return utilisateurList.length > 0? new UtilisateurList(utilisateur: utilisateurList):
                new Center(child:
                new Text('No data found, tap plus button to add!', style: Theme.of(context).textTheme.headline6));
              },
            )
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
 
  Future loadList() {
    Future<List<Utilisateur>> futureCases = api.getCat();
    futureCases.then((utilisateurList) {
      setState(() {
        this.utilisateurList = utilisateurList;
      });
    });
    return futureCases;
  }


}
