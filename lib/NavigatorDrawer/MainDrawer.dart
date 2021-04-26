import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          new UserAccountsDrawerHeader(
            accountName:  Text("Tanvir islam"),
            accountEmail:  Text("tanvir1664@gmail.com"),
            decoration:  BoxDecoration(
              image:  DecorationImage(
                image:  AssetImage('ImageAsset/workout.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('ImageAsset/body.jpg')),
          ),
          new ListTile(
              leading: Icon(Icons.library_music),
              title: new Text("Music"),
              onTap: () {
                Navigator.pop(context);
              }),

          new ListTile(
              leading: Icon(Icons.settings),
              title: new Text("Settings"),
              onTap: () {
                Navigator.pop(context);
              }),
          new Divider(),
          new ListTile(
              leading: Icon(Icons.info),
              title: new Text("About"),
              onTap: () {
                Navigator.pop(context);
              }),
          new ListTile(
              leading: Icon(Icons.power_settings_new),
              title: new Text("Logout"),
              onTap: () {
                Navigator.pop(context);
              }),
        ],
      ),

    );
  }
}
