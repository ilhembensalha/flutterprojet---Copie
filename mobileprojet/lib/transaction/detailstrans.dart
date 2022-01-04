import 'package:flutter/material.dart';
import 'package:mobileprojet/models/transaction.dart';
import 'package:mobileprojet/models/utilisateur.dart';
import 'package:mobileprojet/services/api_trans.dart';

import 'package:mobileprojet/services/api_utli.dart';
import 'package:mobileprojet/transaction/affichetrans.dart';
import 'package:mobileprojet/transaction/edittrans.dart';
import 'package:mobileprojet/utilisateur/editutli.dart';



class Detailstrans extends StatefulWidget {
  Detailstrans(this.transaction);

  final Transaction transaction;

  @override
  _DetailstransState createState() => _DetailstransState();
}

class _DetailstransState extends State<Detailstrans> {
  _DetailstransState();

  final ApiTrans api = ApiTrans();

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
                            Text('type:', style: TextStyle(color: Colors.black.withOpacity(0.8))),
                            Text(widget.transaction.type, style: Theme.of(context).textTheme.headline6)
                          ],
                        ),
                      ),
                       Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Column(
                          children: <Widget>[
                            Text('montant:', style: TextStyle(color: Colors.black.withOpacity(0.8))),
                            Text(widget.transaction.montant, style: Theme.of(context).textTheme.headline6)
                          ],
                        ),
                      ),
                       Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Column(
                          children: <Widget>[
                            Text('day:', style: TextStyle(color: Colors.black.withOpacity(0.8))),
                            Text(widget.transaction.day, style: Theme.of(context).textTheme.headline6)
                          ],
                        ),
                      ),
                       Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Column(
                          children: <Widget>[
                            Text('descriptions:', style: TextStyle(color: Colors.black.withOpacity(0.8))),
                            Text(widget.transaction.descriptions, style: Theme.of(context).textTheme.headline6)
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
                                _navigateToEditScreen(context, widget.transaction);
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

  _navigateToEditScreen (BuildContext context, Transaction transaction) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Edittrans(transaction)),
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
                api.deleteCase(widget.transaction.id);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                 content: Text("delete successful"),
                       ));
                  Navigator.pop(context) ;
                /* Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                     Affichetrans(title: 'trans',))); 
                                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                                     Affichetrans(title: 'trans',)), (Route<dynamic> route) => true);*/
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