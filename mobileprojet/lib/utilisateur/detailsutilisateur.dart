import 'package:flutter/material.dart';
import 'package:mobileprojet/models/utilisateur.dart';

import 'package:mobileprojet/services/api_utli.dart';
import 'package:mobileprojet/utilisateur/afficheutilisateur.dart';
import 'package:mobileprojet/utilisateur/editutli.dart';



class Detailsutli extends StatefulWidget {
  Detailsutli(this.utilisateur);

  final Utilisateur utilisateur;

  @override
  _DetailsutliState createState() => _DetailsutliState();
}

class _DetailsutliState extends State<Detailsutli> {
  _DetailsutliState();

  final ApiUtli api = ApiUtli();

  @override
  Widget build(BuildContext context) {
    var title;
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Card(
              child: Container(
                  padding: EdgeInsets.all(10.0),
                  width: 440,
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Column(
                          children: <Widget>[
                            Text('Name:', style: TextStyle(color: Colors.black.withOpacity(0.8))),
                            Text(widget.utilisateur.nom, style: Theme.of(context).textTheme.headline6)
                          ],
                        ),
                      ),
                       Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Column(
                          children: <Widget>[
                            Text('prenom:', style: TextStyle(color: Colors.black.withOpacity(0.8))),
                            Text(widget.utilisateur.prenom, style: Theme.of(context).textTheme.headline6)
                          ],
                        ),
                      ),
                       Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Column(
                          children: <Widget>[
                            Text('adresse:', style: TextStyle(color: Colors.black.withOpacity(0.8))),
                            Text(widget.utilisateur.adresse, style: Theme.of(context).textTheme.headline6)
                          ],
                        ),
                      ),
                       Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Column(
                          children: <Widget>[
                            Text('email:', style: TextStyle(color: Colors.black.withOpacity(0.8))),
                            Text(widget.utilisateur.email, style: Theme.of(context).textTheme.headline6)
                          ],
                        ),
                      ),
                       Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Column(
                          children: <Widget>[
                            Text('username:', style: TextStyle(color: Colors.black.withOpacity(0.8))),
                            Text(widget.utilisateur.username, style: Theme.of(context).textTheme.headline6)
                          ],
                        ),
                      ),
                       Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Column(
                          children: <Widget>[
                            Text('role:', style: TextStyle(color: Colors.black.withOpacity(0.8))),
                            Text(widget.utilisateur.role, style: Theme.of(context).textTheme.headline6)
                          ],
                        ),
                      ),
                      
                      
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Column(
                          children: <Widget>[
                            Text('Update Date:', style: TextStyle(color: Colors.black.withOpacity(0.8))),
      
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Column(
                          children: <Widget>[
                            RaisedButton(
                              splashColor: Colors.red,
                              onPressed: () {
                                _navigateToEditScreen(context, widget.utilisateur);
                              },
                              child: Text('Edit', style: TextStyle(color: Colors.white)),
                              color: Colors.blue,
                            ),
                            RaisedButton(
                              splashColor: Colors.red,
                              onPressed: () {
                                _confirmDialog();
                              },
                              child: Text('Delete', style: TextStyle(color: Colors.white)),
                              color: Colors.blue,
                            )
                          ],
                        ),
                      ),
                    ],
                  )
              )
          ),
        ),
      ),
    );
  }

  _navigateToEditScreen (BuildContext context, Utilisateur utilisateur) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Editutili(utilisateur)),
    );
  }

  Future<void> _confirmDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Warning!'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Are you sure want delete this item?'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Yes'),
              onPressed: () {
                api.deleteCase(widget.utilisateur.id);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                 content: Text("delete successful"),
    ));
                  Navigator.pop(context) ;
              //  Navigator.popUntil(context, ModalRoute.withName(Navigator.defaultRouteName));
                                 /*  Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                     AfficheUtili(title: 'utilisateur',)));*/
                                      // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                                      //AfficheUtili(title: 'utilisateur',)), (Route<dynamic> route) => true);
                                    /*  Navigator.pushAndRemoveUntil(
    context,   
    MaterialPageRoute(builder: (BuildContext context) => AfficheUtili(title: 'utilisateur',)), 
    ModalRoute.withName('/')
);*/
              },
            ),
            FlatButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

}