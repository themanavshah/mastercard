import 'package:flutter/material.dart';

import './models/trans_model.dart';

class Dashboard extends StatefulWidget {
  //var widget._isCollapsed;
  final screenWidth;
  final screenHeight;

  Dashboard(this.screenWidth, this.screenHeight);
  var _isCollapsed = false;

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>
    with SingleTickerProviderStateMixin {
  //TransactionModel transaction = transactions[0];
  AnimationController _controller;
  Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _scaleAnimation = Tween<double>(begin: 1, end: 0.75).animate(_controller);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  Widget transactionCard(String name, String company, double price, logo) {
    return Container(
      height: 50,
      child: Row(
        children: [
          SizedBox(width: 10),
          CircleAvatar(
            radius: 15,
            backgroundColor: Colors.grey.withOpacity(0.6),
          ),
          SizedBox(width: 25),
          Align(
            alignment: Alignment.center,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(height: 8),
              Text(
                '$name',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                '$company',
                style: TextStyle(color: Colors.grey),
              )
            ]),
          ),
          SizedBox(width: 80),
          Text(
            '$price\$',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: price < 0 ? Colors.red : Colors.green,
            ),
            softWrap: true,
          ),
        ],
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black26.withOpacity(0.3),
            offset: Offset(0.0, 0.0),
            blurRadius: 0.0,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      top: 0,
      bottom: 0,
      right: widget._isCollapsed ? 0 : -0.6 * widget.screenWidth,
      left: widget._isCollapsed ? 0 : 0.45 * widget.screenWidth,
      duration: Duration(milliseconds: 300),
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Material(
          color: Colors.white,
          elevation: 0,
          borderRadius: widget._isCollapsed
              ? BorderRadius.all(Radius.circular(0))
              : BorderRadius.all(Radius.circular(20)),
          animationDuration: Duration(milliseconds: 300),
          child: Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 35),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (widget._isCollapsed) {
                            _controller.forward();
                          } else {
                            _controller.reverse();
                          }
                          widget._isCollapsed = !widget._isCollapsed;
                        });
                      },
                      child: Icon(Icons.menu),
                    ),
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('MasterCard',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 28)),
                        SizedBox(width: 18),
                        CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/mastercard.png'),
                          backgroundColor: Colors.black.withOpacity(0),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(height: 50),
                Container(
                  //color: Colors.yellow,
                  height: 160,
                  child: PageView(
                    controller: PageController(viewportFraction: 0.8),
                    scrollDirection: Axis.horizontal,
                    pageSnapping: true,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.red,
                              offset: Offset(0.0, 5.0),
                              blurRadius: 10.0,
                            ),
                          ],
                          color: Colors.red,
                        ),
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        width: 100,
                        height: 100,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blue,
                              offset: Offset(0.0, 8.0),
                              blurRadius: 10.0,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blue,
                        ),
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        width: 100,
                        height: 150,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.green,
                              offset: Offset(0.0, 8.0),
                              blurRadius: 10.0,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.green,
                        ),
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        width: 100,
                        height: 150,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(children: [
                      SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Transactions',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                          Icon(Icons.menu),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            'Today',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      transactionCard(
                          transactions[0].name,
                          transactions[0].company,
                          transactions[0].amount,
                          null),
                      SizedBox(height: 10),
                      transactionCard(
                          transactions[1].name,
                          transactions[1].company,
                          transactions[1].amount,
                          null),
                      SizedBox(height: 10),
                      transactionCard(
                          transactions[5].name,
                          transactions[5].company,
                          transactions[5].amount,
                          null),    
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Text(
                            'Yesterday',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      transactionCard(
                          transactions[2].name,
                          transactions[2].company,
                          transactions[2].amount,
                          null),
                      SizedBox(height: 10),
                      transactionCard(
                          transactions[4].name,
                          transactions[4].company,
                          transactions[4].amount,
                          null),
                      SizedBox(height: 10),
                      transactionCard(
                          transactions[3].name,
                          transactions[3].company,
                          transactions[3].amount,
                          null),    
                    ]),
                  ),
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
