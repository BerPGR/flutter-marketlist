import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MarketList"),
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
          ),
          StreamBuilder(
              stream: _firestore.collection('groups').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }
                if (!snapshot.hasData) {
                  return Text('Não há grupos');
                } else {
                  var groups = snapshot.data!.docs;

                  return ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: groups.length,
                    itemBuilder: (context, index) {
                      var group = groups[index];
                      var groupData = group.data() as Map<String, dynamic>;

                      return ListTile(
                        title: Text("${groupData['nome']}"),
                        leading: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () => _deleteGroup(group.id),
                        ),
                      );
                    },
                  );
                }
              })
        ]),
      ),
    );
  }

  Future<void> _deleteGroup(String groupId) async {
    try {
      await _firestore.collection('groups').doc(groupId).delete();
      Fluttertoast.showToast(msg: 'Grupo deletado');
    } catch (e) {
      Fluttertoast.showToast(msg: 'Erro ao apagar grupo');
    }
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
                  onPressed: () async {
                    try {
                      if ((_codeController.text.isNotEmpty &&
                              _codeController.text.length == 6) &&
                          _nameController.text.isNotEmpty) {
                        await _firestore.collection('groups').add({
                          'nome': _nameController.text,
                          'code': _codeController.text,
                          'createdAt': Timestamp.now(),
                          'createdBy': user?.uid,
                          'users': [user?.uid]
                        }).then((value) => Fluttertoast.showToast(
                                msg: "Grupo Criado!",
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: Colors.red)
                            .then((value) => Navigator.pop(context)));
                      } else {
                        Fluttertoast.showToast(
                            msg: "Aqui",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.CENTER,
                            backgroundColor: Colors.red);
                      }
                    } catch (e) {
                      Fluttertoast.showToast(
                          msg: "${e.toString()}",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.CENTER,
                          backgroundColor: Colors.red);
                    }
                  },
                  child: Text('OK'),
                ),
              ],
            ));
  }
}
