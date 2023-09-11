import 'package:flutter/material.dart';

class Transporte{
  // Cada vehículo registrado debe tener nombre, descripción, capacidad de 
//asientos, imagen, estado y ruta.
int id = UniqueKey().hashCode;
String nombre;
String descripcion;
int capacidadAsientos;
String imagen;
bool estado = true;
String ruta;

Transporte({
  required this.nombre,
  required this.descripcion,
  required this.capacidadAsientos,
  required this.imagen,
  required this.ruta,
});



}