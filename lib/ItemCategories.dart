import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

import 'package:inventry/HomePage.dart';

class ItemCat extends StatefulWidget {
  @override
  _ApiMapEx04State createState() => _ApiMapEx04State();
}

class _ApiMapEx04State extends State<ItemCat> {
  Map mapResponse;
  List listResponse;

  Future getData() async {
    var myFuture = await http.get(Uri.parse(
        'https://api.first.org/data/v1/teams?country=br&pretty=true'));
    debugPrint(myFuture.body);

    setState(() {
      mapResponse = jsonDecode(myFuture.body);
      listResponse = mapResponse['data'];
      //debugPrint('mapResponse');
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Api Ex04'),
      ),
      body: GridView.builder(
        itemCount: listResponse == null ? 0 : listResponse.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
        ),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              // print(yy[1]);
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => HomePage()
                    //Cart(_cartList),
                    ),
              );
            },
            child: Card(
              child: Column(
                children: [
                  Text(
                      "Nazme: " + listResponse[index]["team"].toString() + "\n")
                ],
              ),
            ),
          );
        },
      ),
      //----------------

      // GridView.builder(gridDelegate:SliverGridDelegate() ,
      //   itemBuilder: (BuildContext context, int index) {
      //     return Column(
      //       children: [
      //         Text("Nazme: " + listResponse[1]["team"].toString() + "\n")
      //       ],
      //     );
      //   },
      //   itemCount: listResponse == null ? 0 : listResponse.length,
      // )
      //\\===============
      // ListView.builder(
      //   itemCount: listResponse == null ? 0 : listResponse.length,
      //   itemBuilder: (BuildContext context, int index) {
      //     return
      // Card(
      //       child: Column(
      //         children: [
      //           Text("Nazme: " + listResponse[1]["team"].toString() + "\n")
      //         ],
      //       ),
      //     );
      //   },
      // ),
      //==============
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
