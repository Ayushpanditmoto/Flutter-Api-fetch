import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:futurebuilder_example/page/user_local_page.dart';
import 'package:futurebuilder_example/page/user_network_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'Rashumi';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
        ),
        home: MainPage(title: title),
      );
}

class MainPage extends StatefulWidget {
  final String title;

  const MainPage({
    @required this.title,
  });

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          selectedItemColor: Colors.teal,
          items: [
            BottomNavigationBarItem(
              icon: Text('Locally Stored'),
              label: Text('Database').toString(),
            ),
            BottomNavigationBarItem(
              icon: Text('From Internet'),
            ),
          ],
          onTap: (int index) => setState(() => this.index = index),
        ),
        body: buildPages(),
      );

  Widget buildPages() {
    switch (index) {
      case 0:
        return UserLocalPage();
      case 1:
        return UserNetworkPage();
      default:
        return Container();
    }
  }
}
