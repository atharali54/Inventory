import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class SearchCat extends StatefulWidget {
  @override
  _ApiMapEx04State createState() => _ApiMapEx04State();
}

class _ApiMapEx04State extends State<SearchCat> {
  Map mapResponse;
  List listResponse;

  String _selectedItem;
  String _selectedItemcountry;
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
        title: Text('Search Dropdown'),
      ),
      body: Column(
        children: [
          DropdownButton(
            hint: Text('cat1'),
            items: listResponse.map((item) {
              return new DropdownMenuItem(
                child: Text(item['team-full']),
                value: item['team-full'].toString(),
              );
            }).toList(),
            onChanged: (newVal) {
              setState(() {
                _selectedItem = newVal;
              });
            },
            value: _selectedItem,
          ),
          // DropdownButton(
          //   hint: Text('cat2'),
          //   items: listResponse.map((item) {
          //     return new DropdownMenuItem(
          //       child: Text(item['team']),
          //       value: item['team'].toString(),
          //     );
          //   }).toList(),
          //   onChanged: (newVal) {
          //     setState(() {
          //       _selectedItemcountry = newVal;
          //     });
          //   },
          //   value: _selectedItemcountry,
          // ),
          Text(
            'Cat= ' + '$_selectedItem',
            style: TextStyle(fontSize: 16, color: Colors.blue),
            textAlign: TextAlign.center,
          ),
          // Text(
          //   'Full= ' + '$_selectedItemcountry',
          //   style: TextStyle(fontSize: 16, color: Colors.orange),
          //   textAlign: TextAlign.center,
          // ),
        ],
      ),
    );
  }
}
