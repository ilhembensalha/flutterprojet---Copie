import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobileprojet/pages/options.dart';
import 'package:mobileprojet/pages/stat.dart';
import 'package:mobileprojet/pages/utilisateur.dart';
import 'package:mobileprojet/transaction/affichetrans.dart';
import 'package:mobileprojet/widgets/navigation_drawer_widget.dart';
import 'package:mobileprojet/widgets/profile_page.dart';

class Nav extends StatefulWidget {
  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
   
      home(title: '',), 
      HomePage(), 
      utilisateur(title: '',),  
      MyApp(), 
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      drawer: const NavigationDrawer(),
      appBar: AppBar(
        title: Text('manager money'),
      ),
      

      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.attach_money_outlined ,
               color:Colors.black,
            ),
            title: Text(
              'trans',
               style: TextStyle(color: Colors.black),
              
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.analytics_outlined ,
               color:Colors.black,
            ),
            title: Text(
              'stat',
                style: TextStyle(color: Colors.black),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
               color:Colors.black,
            ),
            title: Text(
              'comptes',
                style: TextStyle(color: Colors.black),
            ),
          ),
           BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              color:Colors.black,
            ),
            title: Text(
              'options',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
        selectedFontSize: 13.0,
        unselectedFontSize: 13.0,
      ),
    );
  }
}