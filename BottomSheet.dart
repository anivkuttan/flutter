import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.orange),
      home: MyWidget(),
    );
  }
}

class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  String _text = "Please Click";
  TextEditingController textController = TextEditingController() ;
  _bottomSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        builder: (context) {
          return Padding(
              padding: EdgeInsets.only(top: 30, left: 30, right: 30),
              child: Column(children: [
                TextField(
                  controller :textController, 
                 
                  
                  decoration: InputDecoration(
                    hintText: "Enter Email",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)), //border
                  ), //deco
                ),
                SizedBox(height: 20),
                ElevatedButton(onPressed: () {

                setState(() {

                _text = textController.text;} ) ;
                  // to close the sheet
                Navigator. pop(context) ;}, child: Text('Sumit')),
              ]) //column
              ); //padding
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AppBar"),
      ), //appba
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(_text,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          ElevatedButton(
            onPressed: () {
              _bottomSheet(context);
            },
            child: Text("Open Bottom Sheet"),
          ),
        ]), //column
      ), //center
    );
  }
}
