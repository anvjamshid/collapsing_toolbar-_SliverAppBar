import 'package:collapsingtoolbar/pages/menu.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Адрес:',
          style: TextStyle(color: Colors.black),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.tune,
                color: Colors.black,
              ),
              onPressed: () {})
        ],
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 15.0, top:15.0,bottom: 10.0),
              child: Text(
                'Barcha restoranlar',
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ),
            ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (_, __) => Divider(height: 5),
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.all(10),
              itemCount: 15,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              Collapsing(nomi: 'Restoran[$index]'),
                        ),
                      );
                    },
                    child: Stack(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              color: Colors.grey,
                              height: 150,
                            ),
                            Padding(
                              padding: EdgeInsets.all(15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Restoran[$index]',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Text(
                                    'Qisqa ma\'lumot[$index]',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  Divider(
                                    thickness: 1,
                                    color: Colors.grey,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Row(children: <Widget>[
                                        Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                        ),
                                        Text(
                                          '0.0(0)',
                                          style:
                                              TextStyle(color: Colors.black54),
                                        ),
                                      ]),
                                      Row(
                                        children: <Widget>[
                                          Icon(Icons.access_time,
                                              color: Colors.black54),
                                          Text('60 min',
                                              style: TextStyle(
                                                  color: Colors.black54)),
                                        ],
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Icon(Icons.airport_shuttle,
                                              color: Colors.black54),
                                          Text('700 000 sum',
                                              style: TextStyle(
                                                  color: Colors.black54)),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          right: 20,
                          top: 125,
                          child: Container(
                            color: Colors.blueGrey,
                            height: 50,
                            width: 50,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
