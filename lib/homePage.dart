import 'package:flutter/material.dart';
import 'dart:convert' show jsonDecode;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Load Json App"),
      ),
      body: new Container(
        child: Center(
          child: FutureBuilder(
            future: DefaultAssetBundle
            .of(context)
            .loadString('load_json/person.json'),
            builder: (context, snapshot) {
              //Decode Json
              var myData = jsonDecode(snapshot.data.toString());

              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return new Card(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text("Name: "+myData[index]['name'],
                        style: TextStyle(color: Colors.black, fontSize: 20.0),
                        ),
                        Text("Age: "+myData[index]['age'],
                        style: TextStyle(color: Colors.black, fontSize: 20.0),
                        ),
                        Text("Height: "+myData[index]['height'],
                        style: TextStyle(color: Colors.black, fontSize: 20.0),
                        ),
                        Text("Gender: "+myData[index]['gender'],
                        style: TextStyle(color: Colors.black, fontSize: 20.0),
                        ),
                        Text("Hair Color: "+myData[index]['hair_color'],
                        style: TextStyle(color: Colors.black, fontSize: 20.0),
                        ),
                      ],
                    ),
                  );
                },
                itemCount: myData == null ? 0 : myData.length,
              );
            },
          ),
        ),
      ),
    );
  }
}
