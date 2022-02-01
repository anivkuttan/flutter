import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // theme: ThemeData(brightness: Brightness.dark),
      home:  HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // return is true app will exit
      // return value is false app still last page
      onWillPop: () async {
        final c = await askUser(context);
        return c ?? false;
      },
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Will Pop Scope'),
          ),
          body: Center(
            child: ElevatedButton(
              child: const Text('Press Back Button or this'),
              onPressed: () async {
                await askUser(context);
              },
            ),
          )),
    );
  }

  Future<bool?> askUser(BuildContext context) {
    return showDialog<bool?>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Exit the App ?'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  // navogator pop will return someType or null
                  Navigator.pop(context, false);
                },
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: const Text('Yes'),
              ),
            ],
          );
        });
  }
}
