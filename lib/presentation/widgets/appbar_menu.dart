import 'package:flutter/material.dart';

class AppbarMenu extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  const AppbarMenu({Key? key, required this.title}) : super(key: key);

  @override
  State<AppbarMenu> createState() => _AppbarMenuState();

  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}

class _AppbarMenuState extends State<AppbarMenu> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
          iconTheme: const IconThemeData(color: Colors.white), // Cambia el color del icono a blanco

      title: Text(widget.title, style: const TextStyle(fontSize: 40, color:  Color.fromARGB(255, 255, 255, 255)),),
      actions: [
        IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Cerrar sesión'),
                  content: const Text('¿Estás seguro de que deseas cerrar la sesión?'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        // Cerrar el diálogo y volver al inicio de sesión
                        Navigator.of(context).pop();
                        Navigator.popUntil(context, (route) => route.isFirst);
                      },
                      child: const Text('Sí'),
                    ),
                    TextButton(
                      onPressed: () {
                        // Cerrar el diálogo
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        'No',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                );
              },
            );
          },
          icon: const Icon(Icons.supervised_user_circle,color: Color.fromARGB(255, 255, 255, 255)), // Icono de cierre de sesión
        ),
      ],
    );
  }
}
