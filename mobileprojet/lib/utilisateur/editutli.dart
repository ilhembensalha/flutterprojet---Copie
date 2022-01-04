import 'package:flutter/material.dart';

import 'package:mobileprojet/models/utilisateur.dart';
import 'package:mobileprojet/services/api_utli.dart';




class Editutili extends StatefulWidget {
  Editutili(this.utilisateur);

  final Utilisateur utilisateur;

  @override
  _EditutiliState createState() => _EditutiliState();
}

class _EditutiliState extends State<Editutili> {
  _EditutiliState();

  final ApiUtli api = ApiUtli();
  final _addFormKey = GlobalKey<FormState>();
  String id = '';
  final _nameController = TextEditingController();
  final _prenomController = TextEditingController();
  final _adresseController = TextEditingController();
  final _telephoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

 
  

  @override
  void initState() {
    id = widget.utilisateur.id;
    _nameController.text = widget.utilisateur.nom;
   _prenomController.text = widget.utilisateur.prenom;
  _adresseController.text = widget.utilisateur.adresse;
  _telephoneController.text = widget.utilisateur.telephone;
  _emailController.text = widget.utilisateur.email;
  _usernameController.text = widget.utilisateur.username;
  _passwordController.text = widget.utilisateur.password;
  
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit utilisateur'),
      ),
      body: Form(
        key: _addFormKey,
        child: SingleChildScrollView(
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
                              Text('nom'),
                              TextFormField(
                                controller: _nameController,
                                decoration: const InputDecoration(
                                  hintText: 'nom',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter nom';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ), Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Text('prenom'),
                              TextFormField(
                                controller: _prenomController,
                                decoration: const InputDecoration(
                                  hintText: 'prenom',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter prenom';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
               Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Text('adresse'),
                              TextFormField(
                                controller: _adresseController,
                                decoration: const InputDecoration(
                                  hintText: 'adresse',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter adresse';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                         Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Text('telephone'),
                              TextFormField(
                                controller: _telephoneController,
                                decoration: const InputDecoration(
                                  hintText: 'telephone',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter telephone';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
               Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Text('email'),
                              TextFormField(
                                controller: _emailController,
                                decoration: const InputDecoration(
                                  hintText: 'email',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter email';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
              
               Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Text('username'),
                              TextFormField(
                                controller: _usernameController,
                                decoration: const InputDecoration(
                                  hintText: 'username',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter username';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
               Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Text('password'),
                              TextFormField(
                                controller: _passwordController,
                                decoration: const InputDecoration(
                                  hintText: 'password',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter password';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
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
                                  if (_addFormKey.currentState!.validate()) {
                                    _addFormKey.currentState!.save();
                                    api.updateCases(id, Utilisateur(nom: _nameController.text,prenom: _prenomController.text,adresse: _adresseController.text,telephone: _telephoneController.text ,email: _emailController.text,username: _usernameController.text ,password: _passwordController.text  ,role: '', id: ''));
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                           content: Text("update successful"),
                           ));
                                    Navigator.pop(context) ;
                                  }
                                },
                                child: Text('Save', style: TextStyle(color: Colors.white)),
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
      ),
    );
  }

}