import 'package:flutter/material.dart';

import '../screens/geo_screens.dart';
import '../screens/home_screens.dart';
import '../screens/registrar_transporte.dart';
import '../screens/transporte_ver.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView( 
        children: [
          const DrawerHeader(
            decoration:
                BoxDecoration(color: Color.fromARGB(255, 252, 252, 252)),
            child: Text(
              'Menú',
              style: TextStyle(fontSize: 60, color: Colors.black),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home,
                color: Color.fromARGB(255, 252, 252, 252)),
            title: const Text('Home',  style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 255, 255, 255)),
),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
              );
            },
          ),
          const SizedBox(
          height: 30,
        ),
          ListTile(
            leading: const Icon(Icons.emoji_transportation,
                color: Color.fromARGB(255, 252, 252, 252)),
            title: const Text('Registro de transporte', style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 255, 255, 255))),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RegistationTrans(),
                ),
              );
            },
          ),
          const SizedBox(
          height: 30,
        ),
          ListTile(
            leading: const Icon(Icons.app_registration,
                color: Color.fromARGB(255, 252, 252, 252)),
            title: const Text('Transportes registrados', style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 255, 255, 255))),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const TranporteHomeScreen(),
                ),
              );
            },
          ),const SizedBox(
          height: 30,
        ),
          ListTile(
            leading: const Icon(Icons.map,
                color: Color.fromARGB(255, 252, 252, 252)),
            title: const Text('Geolocalización', style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 255, 255, 255))),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const GeoScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
