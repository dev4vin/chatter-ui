import 'package:chatr_flutter/widgets/category_selector.dart';
import 'package:chatr_flutter/widgets/favorite_contacts.dart';
import 'package:chatr_flutter/widgets/recent_chats.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme_provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          iconSize: 30.0,
          color: Colors.white,
          onPressed: () {},
        ),
        title: Text(
          "Chatr",
          style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () {},
          ),
          Switch(
            value: themeProvider.isLightTheme,
            onChanged: (val) {
              themeProvider.setThemeData = val;
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          CategorySelector(),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0))),
              child: Column(
                children: <Widget>[
                  FavoriteContacts(),
                  RecentCharts(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
