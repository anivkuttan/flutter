/*
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppWidget createState() => _MyAppWidget();
}

class _MyAppWidget extends State<MyApp> {
  bool _switchOn = false;

  ThemeData _modeDark = ThemeData(brightness: Brightness.dark,primaryColor:Colors.yellow,);

  ThemeData _modeLight = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.red,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _switchOn ? _modeDark : _modeLight,
      //themedata
      home: Scaffold(
          appBar: AppBar(
            title: Text("Theme change"),
          ), //appbar
          body: Center(
              child: Switch(
                  value: _switchOn,
                  onChanged: (value) {
                    setState(() {
                      _switchOn = value;
                    });
                  }) //switch
              ) //center
          ), //scaffold
    ); //material app
  }
}
*/
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: MyThemeDataClass.getCurrentTheme,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Dark and Light Themeing'),
          actions: [
            Switch(
                value:MyThemeDataClass.isDarkMode,
                onChanged: (switchvalue) {
                  setState(() {
                   MyThemeDataClass.isDarkMode = switchvalue;
                  });
                })
          ],
        ),
        body: const Center(
          child: Text(
            'Hello World',
            style: TextStyle(fontSize: 30),
          ),
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {},),
      ),
    );
  }
}

class MyThemeDataClass {
  static bool isDarkMode = false;
  static get lightTheme {
    return ThemeData(
      colorScheme: const ColorScheme.light(),
    );
  }

  static get darkTheme {
    return ThemeData(
      colorScheme: const ColorScheme.dark(),
    );
  }

  static  get getCurrentTheme => isDarkMode ?darkTheme:lightTheme ;

}

