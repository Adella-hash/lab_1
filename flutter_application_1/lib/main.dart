import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Flutter App"),
          bottom: TabBar(
            tabs: [
              Tab(text: "List View"),
              Tab(text: "Grid View"),
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                child: Text("Menu", style: TextStyle(color: Colors.white, fontSize: 24)),
              ),
              ListTile(title: Text("Home"), onTap: () {}),
              ListTile(title: Text("Profile"), onTap: () {}),
              ListTile(title: Text("Settings"), onTap: () {}),
              ListTile(title: Text("Logout"), onTap: () {}),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // ListView
            ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("Item ${index + 1}"),
                  subtitle: Text("Subtitle ${index + 1}"),
                );
              },
            ),
            // GridView
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: 6,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(8),
                  color: Colors.primaries[index % Colors.primaries.length],
                  child: Center(
                    child: Text(
                      "${index + 1}",
                      style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Fluttertoast.showToast(
              msg: "Hello, Flutter!",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
            );
          },
          child: Icon(Icons.message),
        ),
      ),
    );
  }
}