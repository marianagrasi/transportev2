import 'package:carousel_slider/carousel_slider.dart';
import 'package:emuladordos/presentation/screens/registrar_transporte.dart';
import 'package:emuladordos/presentation/screens/transporte_ver.dart';
import 'package:flutter/material.dart';
import '../../dominio/models/image_list.dart';
import '../widgets/appbar_menu.dart';
import '../widgets/menu_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuDrawer(),
      appBar: const AppbarMenu(title: 'MVD Drive'),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            
            children: [
              const SizedBox(height: 10),
    
              const Text(
              '¡Bienvenido a MVD Drive!',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2D5972),

              ),
            ),
            const SizedBox(height: 0),
            Container(
              child: const Text(
                'Estamos encantados de tenerte aquí. En MVD Drive, estamos comprometidos a brindarte toda la información que necesitas sobre las rutas y transportes más cercanos a tu ubicación. Ya no tendrás que preocuparte por perder tiempo buscando direcciones o esperando en paradas de transporte. Aquí, encontrarás todo lo que necesitas para moverte de manera eficiente por la ciudad.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
              const SizedBox(height: 20),
              const Text(
                'Transportes',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2D5972),
                ),
              ),
              Column(
                children: [
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxHeight:
                          250, 
                    ),
                    child: CarouselSlider(
                      options: CarouselOptions(
                        autoPlay: true,
                        aspectRatio: 2.0,
                        enlargeCenterPage: true,
                      ),
                      items: imageSliders,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
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
                child: const Text('Registrar',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 255, 255, 255),
                    )),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xDC628395),
                  padding: const EdgeInsets.all(16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TranporteHomeScreen(),
                    ),
                  );
                },
                child: const Icon(
                  Icons.visibility,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
