import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobileprojet/models/utilisateur.dart';

import 'dart:async';
import 'package:mobileprojet/services/api_utli.dart';
import 'package:mobileprojet/utilisateur/addutli.dart';
import 'package:mobileprojet/utilisateur/utilisateurlist.dart';





class AfficheUtili extends StatefulWidget {
  AfficheUtili({Key? key, required this.title}) : super(key: key);

 

  final String title;

  @override
  _AfficheUtiliState createState() => _AfficheUtiliState();
}

class _AfficheUtiliState extends State<AfficheUtili> {
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
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _navigateToAddScreen(context);
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
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

  _navigateToAddScreen (BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Addutili()),
    );
  }
}
