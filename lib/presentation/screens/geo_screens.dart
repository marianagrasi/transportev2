import 'package:flutter/material.dart';
import '../../datos/transporte_list.dart';
import '../../dominio/models/transporte.dart';
import '../widgets/appbar_menu.dart';
import '../widgets/menu_drawer.dart';

class GeoScreen extends StatefulWidget {
  const GeoScreen({Key? key}) : super(key: key);

  @override
  GeoScreenState createState() => GeoScreenState();
}

class GeoScreenState extends State<GeoScreen> {
  bool estado = true;
  List<Transporte> rutasCercanas = [];

  @override
  void initState() {
    super.initState();
    rutasCercanas = transportes
        .where((transporte) => _esRutaCercana(transporte.ruta.toLowerCase()))
        .toList();
  }

  bool _esRutaCercana(String ruta) {
    return ruta.contains('medellin') ||
        ruta.contains('envigado') ||
        ruta.contains('sabaneta') ||
        ruta.contains('caldas') ||
        ruta.contains('bello') ||
        ruta.contains('itagui');
  }

  List<Transporte> rutasLejanas() {
    return transportes
        .where((transporte) => !_esRutaCercana(transporte.ruta.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final List<Transporte> transportesAMostrar =
        estado ? rutasCercanas : rutasLejanas();

    return Scaffold(
      drawer: const MenuDrawer(),
      appBar: const AppbarMenu(title: 'MVD Drive'),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
          height: 30,
        ),
            const Text('Geolocalización de rutas',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2D5972))),
            Image.asset('assets/img/imgtransporte.jpg',
                width: 100, height: 100),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xDC628395),
                    padding: const EdgeInsets.all(16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      estado = true;
                    });
                  },
                  child: const Text('Rutas cercanas',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 255, 255, 255),
                      )),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xDC628395),
                    padding: const EdgeInsets.all(16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      estado = false;
                    });
                  },
                  child: const Text('Quieres ver las rutas lejanas?',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 255, 255, 255),
                      )),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: transportesAMostrar.length,
                itemBuilder: (BuildContext context, int index) {
                  final transporte = transportesAMostrar[index];
                  return Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 16.0),
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFF2D5972)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${index + 1}- Transporte: ${transporte.nombre} \nRuta: ${transporte.ruta}',
                          style: const TextStyle(fontSize: 15),
                        ),
                        Text(
                          estado ? 'Rutas cercanas' : 'Rutas lejanas',
                          style: TextStyle(
                            fontSize: 15,
                            color: estado ? Colors.green : Colors.red,
                          ),
                        ),
                        Text(
                            'Sillas disponibles: ${transporte.capacidadAsientos}'),
                        const SizedBox(height: 10),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
