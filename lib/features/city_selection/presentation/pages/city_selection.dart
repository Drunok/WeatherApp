import 'package:flutter/material.dart';
import 'package:weather_app/config/routes/app_routes.dart';
import 'package:weather_app/core/utilities.dart';

class CitySelection extends StatelessWidget {
  CitySelection({super.key});

  final List<Map<String, String>> departments = [
    {'name': 'La Paz', 'image': 'assets/images/lapaz.jpg'},
    {'name': 'Santa Cruz', 'image': 'assets/images/santacruz.jpg'},
    {'name': 'Cochabamba', 'image': 'assets/images/cochabamba.jpg'},
    {'name': 'Oruro', 'image': 'assets/images/oruro.jpg'},
    {'name': 'Potosí', 'image': 'assets/images/potosi.jpg'},
    {'name': 'Sucre', 'image': 'assets/images/chuquisaca.jpg'},
    {'name': 'Tarija', 'image': 'assets/images/tarija.jpg'},
    {'name': 'Beni', 'image': 'assets/images/beni.jpg'},
    {'name': 'Pando', 'image': 'assets/images/pando.jpg'},
  ];

  // Función para mostrar el cuadro de diálogo de confirmación
  Future<void> _showConfirmationDialog(BuildContext context, String departmentName) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // El usuario no puede cerrar el diálogo tocando fuera
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Selection'),
          content: Text(
            '¿Estás seguro de que quieres seleccionar $departmentName?',
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancelar', style: TextStyle(color: Colors.black),),
              onPressed: () {
                Navigator.of(context).pop(); // Cierra el diálogo
              },
            ),
            FilledButton(
              onPressed: () {
                Utilities utilities = Utilities();
                utilities.saveCityName(departmentName); // Guardar el nombre de la ciudad
                Navigator.popAndPushNamed(
                context, 
                AppRoutes.cityWeather,// Pasamos el nombre de la ciudad como parámetro
              );
              },
              style: FilledButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
              ),
              child: Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Selecciona tu ciudad')),
      body: ListView.separated(
        itemCount: departments.length,
        itemBuilder: (context, index) {
          final department = departments[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            elevation: 5,
            child: ListTile(
              contentPadding: const EdgeInsets.all(10),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  department['image']!,
                  width: 50, // Tamaño de la imagen de la bandera
                  height: 30,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                department['name']!,
                style: const TextStyle(fontSize: 18),
              ),
              onTap: () {
                // Mostrar el cuadro de confirmación al presionar la tarjeta
                _showConfirmationDialog(context, department['name']!);
              },
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const Divider(
            height: 1,
            color: Colors.grey,
            indent: 16,
            endIndent: 16,
          );
        },
      ),
    );
  }
}
