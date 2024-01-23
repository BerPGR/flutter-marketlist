import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My List',
          style: TextStyle(color: Color(0xFFFFFFFF)),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.add),
              color: Color(0xFFFFFfff)),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
            color: Color(0xFFFFFfff),
          )
        ],
        backgroundColor: Color(0xFF2196F3),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Minhas listas",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  Text("0/5")
                ]),
          )
        ]),
      ),
    );
  }
}
