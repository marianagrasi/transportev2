import 'package:flutter/material.dart';

import '../../datos/user_list.dart';
import '../../dominio/models/user.dart';
import 'login.dart';

class UsuarioRegistrationScreen extends StatefulWidget {
  const UsuarioRegistrationScreen({super.key});

  @override
  State<UsuarioRegistrationScreen> createState() =>
      _UsuarioRegistrationScreenState();
}

class _UsuarioRegistrationScreenState extends State<UsuarioRegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmedPasswordController =
      TextEditingController();

  bool _obscureText = true;
  bool _obscureTextConfirmed = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            const SizedBox(height: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Registro de usuario',
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2D5972))),
                const SizedBox(height: 20),
                const Text('Nombre:', style: TextStyle(fontSize: 16)),
                const SizedBox(height: 8),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Ingrese su nombre',
                  ),
                  controller: _nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa un nombre';
                    }

                    final nameRegex = RegExp(r'^[a-zA-Z ]+$');

                    if (!nameRegex.hasMatch(value)) {
                      return 'Por favor, ingresa solo letras';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                const Text('Correo Electrónico:',
                    style: TextStyle(fontSize: 16)),
                const SizedBox(height: 8),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Ingrese su correo electrónico',
                  ),
                  controller: _emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor un correo electrónico';
                    }

                    final emailRegex =
                        RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');

                    if (!emailRegex.hasMatch(value)) {
                      return 'Por favor, ingrese un correo electrónico válido';
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 15),
                const Text('Contraseña:', style: TextStyle(fontSize: 16)),
                const SizedBox(height: 8),
                TextFormField(
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Ingrese su contraseña',
                    suffixIcon: Builder(builder: (context) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        child: Icon(
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.grey,
                        ),
                      );
                    }),
                  ),
                  controller: _passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese una contraseña';
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 15),
                const Text(
                  'Confirmar Contraseña:',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  obscureText: _obscureTextConfirmed,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Confirme su contraseña',
                    suffixIcon: Builder(
                      builder: (BuildContext context) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _obscureTextConfirmed = !_obscureTextConfirmed;
                            });
                          },
                          child: Icon(
                            _obscureTextConfirmed
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.grey,
                          ),
                        );
                      },
                    ),
                  ),
                  controller: _confirmedPasswordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, confirme la contraseña';
                    }
                    if (value != _passwordController.text) {
                      return 'Las contraseñas no coinciden';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
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
                      if (_formKey.currentState!.validate()) {
                        if (_passwordController.text ==
                            _confirmedPasswordController.text) {
                          var newUser = User(
                              name: _nameController.text,
                              email: _emailController.text,
                              password: _passwordController.text,
                              confirmedPassword:
                                  _confirmedPasswordController.text);
                          users.add(newUser);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginApp()));
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Registro exitoso')));
                        }
                      }
                    },
                    child: const Text('Registrarse',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 255, 255, 255),
                        )),
                  ),
                ),
                const SizedBox(height: 10),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 255, 0, 0),
                      padding: const EdgeInsets.all(16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginApp()));
                    },
                    child: const Text('Cancelar',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 255, 255, 255),
                        )),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
