// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:mobileprojet/category/afiichecat.dart';
import 'package:mobileprojet/login_page.dart';
import 'package:mobileprojet/pages/data.dart';
import 'package:mobileprojet/transaction/affichetrans.dart';
import 'package:mobileprojet/utilisateur/afficheutilisateur.dart';
import 'package:mobileprojet/widgets/bottomnav.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NavigationDrawer extends StatefulWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  NavigationDrawerWidget createState() => NavigationDrawerWidget();
}
class NavigationDrawerWidget extends State<NavigationDrawer> {

  @override
  Widget build(BuildContext context) {

    return Drawer(
    
      child: ListView(
        // Remove padding
        padding: EdgeInsets.zero,
        children: [
        SizedBox(height: 60.0),
           Text(
            '  money manager:',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.blueGrey),
            
                    ),
           SizedBox(height: 10.0),
            Divider(),
           ListTile(
            leading: Icon(Icons.attach_money_outlined),
            title: Text('transaction'),
             onTap: ()   {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                     Affichetrans(title: 'transactions',)));
                            }
             
             
             ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('utilisateur'),
             onTap: ()   {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                     AfficheUtili(title: 'utilisateur',)));
                            }
          ),
            ListTile(
            leading: Icon(Icons.list),
            title: Text('category'),
           onTap: ()  {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                     AfficheCat(title: 'category',)));
                            }
                            ),
         
          Divider(),
        
            ListTile(
            leading: Icon(Icons.calendar_today),
            title: Text('calendar'),
            onTap: ()  {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                     date(title: 'date',)));
                            },
          ),
           
          Divider(),
          ListTile(
            title: Text('logout'),
            leading: Icon(Icons.exit_to_app),
            onTap: ()  async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
         prefs.clear(); 
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
    LoginPage()), (Route<dynamic> route) => false);
            },
          ),
        ],
      ),
    );
  }
 
}
