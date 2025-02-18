import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Widgets',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool showFirstImage = true; // Переключатель для изображений

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter Widgets")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 6. Отображение изображения
          Image.asset(
            showFirstImage ? 'assets/image1.jpg' : 'assets/image2.jpg',
            width: 300,
            height: 200,
            fit: BoxFit.cover, // Попробуй менять на: fill, contain, fitWidth, fitHeight, none, scaleDown
          ),

          SizedBox(height: 20),

          // 9. Stack с фоном, затемнением и текстом
          Stack(
            children: [
              Image.asset(
                'assets/image1.jpg',
                width: 300,
                height: 200,
                fit: BoxFit.cover,
              ),
              Container(
                width: 300,
                height: 200,
                color: Colors.black.withOpacity(0.5), // Затемнение
              ),
              Positioned.fill(
                child: Center(
                  child: Text(
                    "Welcome to Flutter",
                    style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 20),

          // 10. ElevatedButton (SnackBar)
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("SnackBar Shown!")),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              minimumSize: Size(200, 50),
            ),
            child: Text("Show SnackBar", style: TextStyle(fontSize: 16, color: Colors.white)),
          ),

          SizedBox(height: 10),

          // 11. TextButton (Навигация)
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SecondScreen()),
              );
            },
            style: TextButton.styleFrom(
              minimumSize: Size(200, 50),
            ),
            child: Text("Go to Second Screen", style: TextStyle(fontSize: 16, color: Colors.green)),
          ),

          SizedBox(height: 10),

          // 12. OutlinedButton (Переключение изображения)
          OutlinedButton(
            onPressed: () {
              setState(() {
                showFirstImage = !showFirstImage;
              });
            },
            style: OutlinedButton.styleFrom(
              minimumSize: Size(200, 50),
              side: BorderSide(color: Colors.black, width: 2),
            ),
            child: Text("Toggle Image", style: TextStyle(fontSize: 16, color: Colors.black)),
          ),
        ],
      ),
    );
  }
}

// 11. Второй экран
class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Second Screen")),
      body: Center(
        child: Text(
          "This is the second screen",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
