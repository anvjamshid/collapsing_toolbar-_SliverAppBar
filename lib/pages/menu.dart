import 'package:collapsingtoolbar/pages/order.dart';
import 'package:flutter/material.dart';

class Collapsing extends StatefulWidget {
  final String nomi;
  Collapsing({Key key, this.nomi}) : super(key: key);

  @override
  _CollapsingState createState() => _CollapsingState();
}

class _CollapsingState extends State<Collapsing> {

  void _incrementCounter() {
    Navigator.pushNamed(context, widget.nomi);
  }

  @override
  Widget build(BuildContext context) {
//    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(children: <Widget>[
        DefaultTabController(
            length: 6,
            child: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScroll) {
                return <Widget>[
                  SliverAppBar(
                    leading: CircleAvatar(backgroundColor: Colors.white,radius:20,
                        child: IconButton(icon: Icon(Icons.keyboard_arrow_left, color: Colors.black), onPressed: () {
                          Navigator.pop(context);
                        },),),
                    backgroundColor: Colors.white,
                    actions: <Widget>[
                      CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 20,
                          child: IconButton(
                              icon: Icon(Icons.search, color: Colors.black),
                              onPressed: null)),
                      CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 20,
                          child: IconButton(
                              icon: Icon(
                                Icons.favorite_border,
                                color: Colors.black,
                              ),
                              onPressed: null)),
                    ],
                    expandedHeight: 250,
                    floating: true,
                    pinned: true,
                    flexibleSpace: FlexibleSpaceBar(
                      title: Text('${widget.nomi}', style: TextStyle(color: Colors.black, fontSize:20)),
                      centerTitle: true,
                      background: Image.network(
                        "https://images.pexels.com/photos/62389/pexels-photo-62389.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
                        fit: BoxFit.cover,
                      ),
                    ),
                      forceElevated: innerBoxIsScroll,
                  ),
                  SliverPersistentHeader(
                    delegate: _SliverAppBarDelegate(
                      TabBar(
                          isScrollable: true,
                          labelColor: Colors.black87,
                          unselectedLabelColor: Colors.grey,
                          tabs: [
                            Tab(text: 'Menu1'),
                            Tab(text: 'Menu2'),
                            Tab(text: 'Menu3'),
                            Tab(text: 'Menu4'),
                            Tab(text: 'Menu5'),
                            Tab(text: 'Menu6'),
                          ]),
                    ),
                    pinned: true,
                  ),
                ];
              },
              body: TabBarView(
                children: <Widget>[
                  _buildList(),
                  _buildList(),
                  _buildList(),
                  _buildList(),
                  _buildList(),
                  _buildList(),
                ],
              ),
            )),
      ]),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;
  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}

Widget _buildList() {
  return ListView.separated(
    separatorBuilder: (_, __) => Divider(height: 5),
    itemCount: 20,
    itemBuilder: (BuildContext context, int index) {
      return ListTile(
        isThreeLine: true,
        title: Text("Ovqat [$index]",
            style: TextStyle(fontSize: 18.0, color: Colors.black)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Ovqat haqida [$index]',
              style: TextStyle(fontSize: 10.0, color: Colors.black54),
            ),
            Padding(padding: EdgeInsets.only(top: 10.0)),
            Text(
              'Narxi [$index] so\'m',
              style: TextStyle(fontSize: 13.0, color: Colors.black),
            ),
          ],
        ),
        trailing: Container(
          child: Center(child: Text('Rasm')),
          height: 60.0,
          width: 60.0,
          color: Colors.grey,
        ),
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  Order(ovqatnomi: 'Ovqat[$index]'),
            ),
          );
        },
      );
    },
  );
}
