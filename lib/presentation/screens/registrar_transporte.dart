
import 'package:emuladordos/presentation/screens/transporte_ver.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


import '../../datos/transporte_list.dart';
import '../../dominio/models/transporte.dart';
import '../widgets/appbar_menu.dart';
import '../widgets/menu_drawer.dart';
import 'home_screens.dart';

class RegistationTrans extends StatefulWidget {
  const RegistationTrans({super.key});

  @override
  State<RegistationTrans> createState() => _RegistationTransState();
}

class _RegistationTransState extends State<RegistationTrans> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _descripcionController = TextEditingController();
  final TextEditingController _capacidadAsientosController =
      TextEditingController();
  final TextEditingController _rutaController = TextEditingController();
  String image = '';

  Future<void> _pickImage() async {
    final pickImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickImage != null) {
      setState(() {
        image = pickImage.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuDrawer(),
      appBar: const AppbarMenu(title: 'MVD Drive'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formkey,
          child: ListView(
            children: [
              const SizedBox(height: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Registro de \ntransporte',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2D5972),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text('Nombre:',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF2D5972),
                      )),
                  const SizedBox(height: 8),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Ingrese un nombre',
                    ),
                    controller: _nombreController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese su Nombre';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  const Text('Descripción:',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF2D5972),
                      )),
                  const SizedBox(height: 8),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Ingrese una descripción',
                    ),
                    controller: _descripcionController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese su descripción';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  const Text('Capacidad de asientos:',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF2D5972),
                      )),
                  const SizedBox(height: 8),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Ingrese una cantidad',
                    ),
                    controller: _capacidadAsientosController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese una cantidad';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  const Text('Ruta:',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF2D5972),
                      )),
                  const SizedBox(height: 8),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Ingrese la ruta',
                    ),
                    controller: _rutaController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese la Ruta';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: FractionallySizedBox(
                      widthFactor: 0.4,
                      child: ElevatedButton(
                        onPressed: () {
                          _pickImage();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF2D5972),
                          padding: const EdgeInsets.all(16.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                        ),
                        child: const Text('Ingresar imagen',
                            style: TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(255, 255, 255, 255))),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  if (image.isNotEmpty) Image.network(image),
                  const SizedBox(height: 10),
                  ButtonBar(
                    alignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(220, 71, 110, 132),
                            padding: const EdgeInsets.all(16.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                          ),
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              var newTranspor = Transporte(
                                nombre: _nombreController.text,
                                descripcion: _descripcionController.text,
                                capacidadAsientos: int.parse(
                                    _capacidadAsientosController.text),
                                ruta: _rutaController.text,
                                imagen: image,
                              );
                              transportes.add(newTranspor);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const TranporteHomeScreen(),
                                ),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Registro Exitoso')),
                              );
                            }
                          },
                          child: const Text('Registrar',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 255, 255, 255))),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  ButtonBar(
                    alignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 255, 0, 0),
                            padding: const EdgeInsets.all(16.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomeScreen(),
                              ),
                            );
                          },
                          child: const Text('Cancelar',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 255, 255, 255))),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
