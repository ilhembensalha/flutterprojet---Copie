import 'package:flutter/material.dart';

import 'package:mobileprojet/models/utilisateur.dart';
import 'package:mobileprojet/utilisateur/detailsutilisateur.dart';



class UtilisateurList extends StatelessWidget {

  final List<Utilisateur> utilisateur ;
  UtilisateurList({Key? key, required this.utilisateur}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      ListView.builder(
          itemCount: utilisateur == null ? 0 : utilisateur.length,
          itemBuilder: (BuildContext context, int index) {
            return
              Card(
                 clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Detailsutli(utilisateur[index])),
                      );
                    },
                    child: ListTile(
                      leading: Icon(Icons.person),
                      title: Text(utilisateur[index].nom+'  '+utilisateur[index].prenom),
                      subtitle:Text(utilisateur[index].email) ,
                    ),
                  )
              );
          });
  }

}