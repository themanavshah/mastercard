import 'package:flutter/material.dart';

import 'menu.dart';
import 'dashboard.dart';

class MenuController extends StatefulWidget {
  @override
  _MenuControllerState createState() => _MenuControllerState();
}

class _MenuControllerState extends State<MenuController> {
  var isCollapsed = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final screenWidth = size.width;
    final screenHeight = size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
              top: -120,
              left: -120,
              child: CircleAvatar(
                radius: 220,
                backgroundColor: Colors.amber[100],
              )),
          Positioned(
              bottom: -120,
              left: -120,
              child: CircleAvatar(
                radius: 220,
                backgroundColor: Colors.red[100],
              )),
          Positioned(
            left: 25,
            top: 40,
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/mastercard.png'),
                  backgroundColor: Colors.black.withOpacity(0),
                ),
                SizedBox(width: 14),
                Opacity(
                  opacity: 0.6,
                  child: Text('MasterCard',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 28)),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 50,
            left: 25,
            child: Opacity(
              opacity: 0.6,
              child: Row(
                children: [
                  Icon(Icons.logout),
                  SizedBox(width: 12),
                  Text('logout'),
                ],
              ),
            ),
          ),
          Positioned(
            top: 120,
            //left: 15,
            child: Menu()),
          Dashboard(screenWidth, screenHeight),
        ],
      ),
    );
  }
}
