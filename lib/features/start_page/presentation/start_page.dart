import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        // title: Text('Weather App'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: buildBody(),
        ),
      ),
    );
  }

  Widget buildBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,

      children: [
        
        // Titulo
        Text(
          'Descubre el clima en tu ciudad',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),

        // Icono de nube con rayo
        Image.asset(
          'assets/images/imagen_start_page.jpg',
          width: 350,
          height: 350,
          fit: BoxFit.cover,
        ),
        // Icon(
        //   Icons.cloud_queue,
        //   size: 100,
        //   color: Colors.white,
        // ),

        SizedBox(height: 20),

        // SizedBox(height: 10),

        // Descripcion
        Text(
          'Consulta el clima actual y pronostica los próximos días',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: Colors.white70,
          ),
        ),

        SizedBox(height: 20),

        // Boton de empezar
        ElevatedButton(
          onPressed: () {
            
          }, 
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange,
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),

          child: Text(
            'Empezar ahora',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),
          ),
        )
      ]
    );
  }
}