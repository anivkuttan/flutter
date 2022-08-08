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
    var style = Theme.of(context);
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: MyThemeDataClass.getCurrentTheme,
      darkTheme: MyThemeDataClass.darkTheme,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Dark and Light Themeing'),
          actions: [
            Switch(
                value: MyThemeDataClass.isDarkMode,
                onChanged: (switchvalue) {
                  setState(() {
                    MyThemeDataClass.isDarkMode = switchvalue;
                  });
                })
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
             const  Text(
                'Hello World',
                // style: style.textTheme.headline3,
              ),
              ElevatedButton(
                child: const Text('Click me'),
                onPressed: () {},
              ),
              const TextField(),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {},
        ),
      ),
    );
  }
}

class MyThemeDataClass {
  static bool isDarkMode = false;
  static get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      colorScheme: const ColorScheme.light(),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(23),
        ),
      ),
      //  buttonTheme: ButtonThemeData(

      //  ),
    );
  }

  static get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      colorScheme: const ColorScheme.dark(),
      scaffoldBackgroundColor: const Color.fromARGB(255, 29, 88, 58),
      inputDecorationTheme: InputDecorationTheme(
        border: InputBorder.none,
        filled: true,
        fillColor: Colors.yellow[200],
      ),
    );
  }

  static get getCurrentTheme => isDarkMode ? darkTheme : lightTheme;
}


