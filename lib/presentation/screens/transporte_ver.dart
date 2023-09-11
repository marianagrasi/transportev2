import 'package:emuladordos/presentation/screens/registrar_transporte.dart';
import 'package:flutter/material.dart';

import '../../datos/transporte_list.dart';
import '../../dominio/models/transporte.dart';
import '../widgets/appbar_menu.dart';
import '../widgets/menu_drawer.dart';

class TranporteHomeScreen extends StatefulWidget {
  const TranporteHomeScreen({super.key});

  @override
  State<TranporteHomeScreen> createState() => _TranporteHomeScreenState();
}

class _TranporteHomeScreenState extends State<TranporteHomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Transporte> filterItems = transportes;

  void searchItem(String text) {
    setState(() {
      filterItems = transportes
          .where((i) => i.nombre.toLowerCase().contains(text.toLowerCase()))
          .toList();
    });
  }

  void deleteTransporte(int index) {
    setState(() {
      filterItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuDrawer(),
      appBar: const AppbarMenu(title: 'MVD Drive'),
      body: Column(children: [
        const SizedBox(
          height: 30,
        ),
        const Text(
          'Transportes \nRegistrados',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2D5972),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
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
                builder: (context) => const RegistationTrans(),
              ),
            );
          },
          child: const Text("Registrar transportes",
              style: TextStyle(
                  fontSize: 16, color: Color.fromARGB(255, 255, 255, 255))),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            onChanged: searchItem,
            controller: _searchController,
            decoration: const InputDecoration(
              labelText: 'Buscar',
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemCount: filterItems.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: const BorderSide(
                              color: Color(0xFF2D5972), width: 3.0),
                        ),
                        title: Text(
                          '${filterItems[index].nombre} ${filterItems[index].ruta}',
                        ),
                        content: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: 50,
                              child: Image.network(filterItems[index].imagen),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text('Nombre: ${filterItems[index].nombre}'),
                            Text(
                                'Descripcion: ${filterItems[index].descripcion}'),
                            Text(
                                'Capacidad de Asientos: ${filterItems[index].capacidadAsientos}'),
                            Text('Ruta: ${filterItems[index].ruta}'),
                            Text(
                              'Estado: ${filterItems[index].estado ? 'Activo' : 'Inactivo'}',
                            ),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Cerrar'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Card(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.network(
                          filterItems[index].imagen,
                          height: 80,
                          width: double.infinity,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Text(
                        '${filterItems[index].nombre} ${filterItems[index].ruta} ${filterItems[index].capacidadAsientos}',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 12),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          deleteTransporte(index);
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ]),
    );
  }
}
