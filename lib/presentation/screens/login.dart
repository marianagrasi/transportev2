import 'package:emuladordos/presentation/screens/user_registration.dart';
import 'package:flutter/material.dart';
import '../../datos/user_list.dart';
import '../../dominio/models/user.dart';
import 'home_screens.dart';

class LoginApp extends StatefulWidget {
  const LoginApp({super.key});

  @override
  State<LoginApp> createState() => _LoginAppState();
}

class _LoginAppState extends State<LoginApp> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    final email = _emailController.text;
    final password = _passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Por favor, complete todos los campos'),
      ));
      return;
    }

    final user = users.firstWhere(
      (user) => user.email == email && user.password == password,
      orElse: () =>
          User(name: '', email: '', password: '', confirmedPassword: ''),
    );

    if (user.name.isNotEmpty) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Correo electrónico o contraseña incorrectos'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const SizedBox(height: 50),
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.directions_bus,
                  size: 100,
                  color: Color(0xFF2D5972),
                ),
                Text(
                  'Bienvenidos a\n   MVD Drive',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2D5972)),
                ),
                SizedBox(width: 8),
              ],
            ),
            const SizedBox(height: 20),
            const SizedBox(height: 20),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Correo electrónico:',
                      style: TextStyle(fontSize: 16)),
                  const SizedBox(height: 8),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Ingrese su correo',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 6.0),
                      ),
                    ),
                    controller: _emailController,
                    validator: (email) {
                      if (email == null || email.isEmpty) {
                        return 'Ingrese el correo electrónico';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  const Text('Contraseña:', style: TextStyle(fontSize: 16)),
                  const SizedBox(height: 8),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: 'Ingrese su contraseña',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 6.0),
                      ),
                    ),
                    controller: _passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Ingrese la contraseña';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                ),
                onPressed: _login,
                child: const Text('Iniciar Sesión',
                    style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 255, 255, 255))),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(220, 71, 110, 132),
                  padding: const EdgeInsets.all(16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const UsuarioRegistrationScreen()));
                },
                child: const Text('Registrarse',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 255, 255, 255),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
