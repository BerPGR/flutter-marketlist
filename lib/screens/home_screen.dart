import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:listamercado/service/FirebaseAuth.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final User? user = AuthService().currentUser;
  final AuthService _auth = AuthService();
  final TextEditingController _codeController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${user?.displayName}',
          style: TextStyle(color: Color(0xFFFFFFFF)),
        ),
        actions: [
          IconButton(
              onPressed: () => _createGroupDialog(context),
              icon: Icon(Icons.add),
              color: Color(0xFFFFFfff)),
          IconButton(
            onPressed: () => _auth.singOut(),
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

  Future<void> _createGroupDialog(context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: Text('Crie seu grupo!'),
              content: Column(
                children: [
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(labelText: "Nome do grupo"),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  TextField(
                    controller: _codeController,
                    decoration: InputDecoration(labelText: "Código do grupo"),
                  )
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('OK'),
                ),
              ],
            ));
  }
}
