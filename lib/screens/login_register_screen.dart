import 'package:flutter/material.dart';
import 'package:listamercado/service/FirebaseAuth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthService _auth = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Bem-vindo a sua lista de mercado!',
            textAlign: TextAlign.center,
          ),
          TextField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: 'E-mail',
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                  borderSide: BorderSide(width: 2, color: Color(0xFF1565C0))),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                  borderSide: BorderSide(width: 2, color: Color(0xFF1565C0))),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: _passwordController,
            decoration: InputDecoration(
              labelText: 'Senha',
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                  borderSide: BorderSide(width: 2, color: Color(0xFF1565C0))),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                  borderSide: BorderSide(width: 2, color: Color(0xFF1565C0))),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () => _auth.signInWithEmailAndPassword(
                    _emailController.text, _passwordController.text),
                child: Text('Login')),
          ),
          Container(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RegisterScreen())),
                child: Text('Register')),
          )
        ],
      ),
    )));
  }
}

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final AuthService _auth = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Registre-se para começar!',
            textAlign: TextAlign.center,
          ),
          TextField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: 'E-mail',
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                  borderSide: BorderSide(width: 2, color: Color(0xFF1565C0))),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                  borderSide: BorderSide(width: 2, color: Color(0xFF1565C0))),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: _passwordController,
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Senha',
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                  borderSide: BorderSide(width: 2, color: Color(0xFF1565C0))),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                  borderSide: BorderSide(width: 2, color: Color(0xFF1565C0))),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          TextField(
            controller: _nameController,
            decoration: InputDecoration(
              labelText: 'Nome',
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                  borderSide: BorderSide(width: 2, color: Color(0xFF1565C0))),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                  borderSide: BorderSide(width: 2, color: Color(0xFF1565C0))),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () => _auth.registerWithEmailAndPassword(
                    _emailController.text,
                    _passwordController.text,
                    _nameController.text),
                child: Text('Registrar')),
          ),
          Text('Ou faça login'),
          Container(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () => Navigator.pop(context), child: Text('Login')),
          )
        ],
      ),
    )));
  }
}
