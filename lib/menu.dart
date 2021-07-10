import 'package:flutter/material.dart';

class Menu extends StatefulWidget {


  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Align(
        alignment: Alignment.centerLeft,
              child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/person1.jpg'),
            ),
            SizedBox(height: 22),
            Text(
              'Mark Claws',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.black
              ),
            ),
            Text(
              'Cupertino, CA',
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey
              ),
            ),
            SizedBox(height: 40),
            Row(
              children: [
                Icon(Icons.wallet_membership, color: Colors.black),
                SizedBox(width: 10),
                Text(
                  'Dashboard',
                  style:
                      TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 20),
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              children: [
                Icon(Icons.message, color: Colors.grey),
                SizedBox(width: 10),
                Text(
                  'Messages',
                  style:
                      TextStyle(color: Colors.grey, fontWeight: FontWeight.w600, fontSize: 20),
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              children: [
                Icon(Icons.bus_alert,  color: Colors.grey),
                SizedBox(width: 10),
                Text(
                  'Utility Bils',
                  style:
                      TextStyle(color: Colors.grey, fontWeight: FontWeight.w600, fontSize: 20),
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              children: [
                Icon(Icons.money_off_csred_outlined, color: Colors.grey),
                SizedBox(width: 10),
                Text(
                  'Funds Transfer',
                  style:
                      TextStyle(color: Colors.grey, fontWeight: FontWeight.w600, fontSize: 20),
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              children: [
                Icon(Icons.model_training, color: Colors.grey),
                SizedBox(width: 10),
                Text(
                  'Branch',
                  style:
                      TextStyle(color: Colors.grey, fontWeight: FontWeight.w600, fontSize: 20),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
