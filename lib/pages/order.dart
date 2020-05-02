import 'package:flutter/material.dart';

class Order extends StatefulWidget {
  final String ovqatnomi;
  Order({Key key, this.ovqatnomi}) : super(key: key);
  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  int _soni = 0;
  void _qushish() {
    setState(() {
      _soni++;
    });
  }
  void _ayrish() {
    setState(() {
      _soni--;
    });
  }
  void _incrementovqat() {
    Navigator.pushNamed(context, widget.ovqatnomi);
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: new Text("Savatchaga olindi"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: Colors.white,
              expandedHeight: 200.0,
              floating: true,
              pinned: true,
              leading: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 20,
                child: IconButton(
                  icon: Icon(Icons.keyboard_arrow_left, color: Colors.black),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              flexibleSpace: FlexibleSpaceBar(
                title: Text("${widget.ovqatnomi}",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                    )),
                centerTitle: true,
                background: Image.network(
                  "https://images.pexels.com/photos/62389/pexels-photo-62389.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ];
        },
        body: SafeArea(
          top: true,
          bottom: true,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 60.0, left: 20, right: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text("Ingredienti", style: TextStyle(fontSize: 30,color: Colors.black),),
                    SizedBox( height: 10,),
                    Text("Ovqat haqida", style: TextStyle(fontSize: 15,color: Colors.grey),),
                    SizedBox( height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                            children:<Widget>[
                              Icon(Icons.check_circle,color: Colors.green,),
                              Text('${widget.ovqatnomi}',style: TextStyle(fontSize: 20, color: Colors.black87),),
                            ]),
                        Text('Narx sum',style: TextStyle(fontSize: 20,color: Colors.black87),),
                      ],
                    ),
                    Divider(thickness: 2,),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0, right: 30),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                        ClipOval(
                            child: Container(
                                color: Colors.grey,
                                child: IconButton(
                                    icon: Icon(Icons.remove),
                                    onPressed: (_soni == 0) ? null : _ayrish,
                                    color: Colors.black,
                                    splashColor: Colors.red))),
                        Text('$_soni'),
                          ClipOval(
                              child: Container(
                                  color: Colors.grey,
                                  child: IconButton(
                                      icon: Icon(Icons.add),
                                      onPressed: _qushish,
                                      color: Colors.black,
                                      splashColor: Colors.blue))),
                      ],),
                    )
                  ]
              ),
            ),
          ),
        )

      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: (_soni == 0) ? null : _showDialog,
        backgroundColor: Colors.green,
        tooltip: 'Increment',
        child: new Icon(Icons.shopping_basket),
      ),
    );
  }
}
