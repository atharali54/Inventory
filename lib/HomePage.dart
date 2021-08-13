import 'package:flutter/material.dart';
import 'package:inventry/Drawer.dart';
import 'package:inventry/ItemCategories.dart';
import 'package:inventry/arun.dart';

class HomePage extends StatelessWidget {
  final gridtitle = TextStyle(fontSize: 14, color: Colors.green);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerMenu(),
      appBar: AppBar(
        title: Text('Home 1 '),
      ),
      body: Container(
        color: Colors.green[100],
        child: Column(children: <Widget>[
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Image.asset(
                    'assets/homeBg.jpg',
                    fit: BoxFit.cover,
                    height: 200,
                    width: double.infinity,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    'Stock Inventry',
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    width: double.infinity,
                    child: SingleChildScrollView(
                      child: GridView.count(
                        childAspectRatio: 2.1,
                        shrinkWrap: true,
                        crossAxisCount: 3,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 30,
                        physics: ScrollPhysics(),
                        children: <Widget>[
                          InkWell(
                            child: MyContainer(
                                myicon: Icons.star_rounded,
                                tittle: 'Dashboard'),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ItemCat(),
                                ),
                              );
                            },
                          ),
                          InkWell(
                            child: MyContainer(
                                myicon: Icons.category, tittle: 'Categories'),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DrawerMenu(),
                                ),
                              );
                            },
                          ),
                          InkWell(
                            child: MyContainer(
                                myicon: Icons.add, tittle: 'add Items'),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BillDetails(),
                                ),
                              );
                            },
                          ),
                          InkWell(
                            child: MyContainer(
                                myicon: Icons.verified_user,
                                tittle: 'Vender List'),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DrawerMenu(),
                                ),
                              );
                            },
                          ),
                          InkWell(
                            child: MyContainer(
                                myicon: Icons.supervised_user_circle,
                                tittle: 'Add Vender'),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DrawerMenu(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        },
        child: Icon(Icons.search),
        backgroundColor: Colors.green,
      ),
    );
  }
}

class MyContainer extends StatelessWidget {
  final String tittle;
  final IconData myicon;
  MyContainer({@required this.myicon, @required this.tittle});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      //padding: EdgeInsets.all(20),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(myicon, size: 25, color: Colors.green),
          Text(tittle, textAlign: TextAlign.center)
        ],
      ),
    );
  }
}
