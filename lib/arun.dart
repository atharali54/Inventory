import 'package:flutter/material.dart';
import 'package:inventry/HomePage.dart';

class BillDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Add Items")),
        body: Center(child: HomeScreen()));
  }
}

class HomeScreen extends StatefulWidget {
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  // final name = TextEditingController();
  // final phoneNumber = TextEditingController();
  // final studentClass = TextEditingController();

  final prodName = TextEditingController();
  final prodId = TextEditingController();
  final rfNo = TextEditingController();
  final warrentyPeriod = TextEditingController();
  final amcPeriod = TextEditingController();
  final purFrom = TextEditingController();
  final price = TextEditingController();
  final epcification = TextEditingController();

  getItemAndNavigate(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SecondScreen(
                // nameHolder: name.text,
                // classHolder: studentClass.text,
                // numberHolder: phoneNumber.text
                prodName: prodName.text,
                prodId: prodId.text,
                rfNo: rfNo.text,
                warrentyPeriod: warrentyPeriod.text,
                amcPeriod: amcPeriod.text,
                purFrom: purFrom.text,
                price: price.text,
                epcification: epcification.text)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        //  mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: prodName,
                  autocorrect: true,
                  decoration: InputDecoration(hintText: 'Product Name'),
                ),
              ),
              Expanded(
                child: TextField(
                  controller: prodId,
                  autocorrect: true,
                  decoration: InputDecoration(hintText: 'Product id'),
                ),
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                  child: TextField(
                controller: rfNo,
                autocorrect: true,
                decoration:
                    InputDecoration(hintText: 'Ref. No. in Stock Register'),
              )),
              Expanded(
                  child: TextField(
                controller: warrentyPeriod,
                autocorrect: true,
                decoration: InputDecoration(hintText: 'Warranty Period'),
              ))
            ],
          ),
          Row(
            children: [
              Expanded(
                  child: TextField(
                controller: amcPeriod,
                autocorrect: true,
                decoration: InputDecoration(hintText: 'AMC Period'),
              )),
              Expanded(
                  child: TextField(
                controller: purFrom,
                autocorrect: true,
                decoration: InputDecoration(hintText: 'Purchased From'),
              ))
            ],
          ),
          Row(
            children: [
              Expanded(
                  child: TextField(
                controller: price,
                autocorrect: true,
                decoration: InputDecoration(hintText: 'Price'),
              )),
              Expanded(
                  child: TextField(
                controller: epcification,
                autocorrect: true,
                decoration: InputDecoration(hintText: 'Specification'),
              ))
            ],
          ),
          ElevatedButton(
            onPressed: () => getItemAndNavigate(context),
            child: Text('Generate Bill'),
          ),
        ],
      ),
    ));
  }
}

class SecondScreen extends StatelessWidget {
  // final nameHolder;
  // final classHolder;
  // final numberHolder;

  final prodName;
  final prodId;
  final rfNo;
  final warrentyPeriod;
  final amcPeriod;
  final purFrom;
  final price;
  final epcification;

  SecondScreen(
      {
      //   @required this.nameHolder,
      // this.classHolder,
      // this.numberHolder,
      this.amcPeriod,
      this.epcification,
      this.price,
      this.prodId,
      this.prodName,
      this.purFrom,
      this.rfNo,
      this.warrentyPeriod});

  goBack(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Details"),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                  child: Text(
                'Product Name = ' + prodName,
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              )),
              Center(
                  child: Text(
                'Product id = ' + prodId,
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              )),
              Center(
                  child: Text(
                'rfNo = ' + rfNo,
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              )),

              Center(
                  child: Text(
                'Warrenty Period = ' + warrentyPeriod,
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              )),
              Center(
                  child: Text(
                'AMC Period = ' + amcPeriod,
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              )),

              Center(
                  child: Text(
                'Product id = ' + purFrom,
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              )),
              Center(
                  child: Text(
                'Product id = ' + price,
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              )),

              Center(
                  child: Text(
                'Product id = ' + epcification,
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              )),
              // Center(
              //     child: Text(
              //   'Student Phone Number = ' + numberHolder,
              //   style: TextStyle(fontSize: 22),
              //   textAlign: TextAlign.center,
              // )),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                child: Text('Log Out'),
              )
            ]));
  }
}
