import 'package:flutter/material.dart';

void main() => runApp(Registro());

class Registro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      home: Scaffold(
        /*
        appBar: AppBar(
          title: Text('Formulario de registro'),
        ),*/ 
        body: SingleChildScrollView(
          child: Center(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
              color: Colors.amber,
              child:Center(
                child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                   SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: 200,
                    height: 100,
                    child: Image.asset('assets/images/Logo.png'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      "Bienvenido Usuario:",
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),

                  Center(
                    child: Container(
                      margin: const EdgeInsets.all(0.0),
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                      child: Text(
                        'Ingresa los datos correspondientes para comenzar el registro de tu mascota.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),

                ],
              ),

              ),
            ),

/*
              //inicia logo
              SizedBox(
                width: 200,
                height: 100,
                child: Image.asset('assets/images/Logo.png'),
              ),
              //termina logo
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  "Bienvenido @Usuario:",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),

              Center(
                child: Container(
                  margin: const EdgeInsets.all(0.0),
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                  child: Text(
                    'Ingresa los datos correspondientes para comenzar el registro de tu mascota.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
              */
              /*

                        Text(
                          'Ingresa los datos correspondientes para comenzar el registro de tu mascota',
                                                  style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),*/
              Center(
                child: Container(
                  margin: const EdgeInsets.all(0.0),
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Especie',
                    ),
                  ),
                ),
              ),

              Center(
                child: Container(
                  margin: const EdgeInsets.all(0.0),
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Raza',
                    ),
                  ),
                ),
              ),

              Center(
                child: Container(
                  margin: const EdgeInsets.all(0.0),
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Nombre de la mascota',
                    ),
                  ),
                ),
              ),

              Center(
                child: Container(
                  margin: const EdgeInsets.all(0.0),
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Fecha de nacimiento',
                    ),
                  ),
                ),
              ),

              Center(
                child: Container(
                  margin: const EdgeInsets.all(0.0),
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Nombre del padre',
                    ),
                  ),
                ),
              ),

              Center(
                child: Container(
                  margin: const EdgeInsets.all(0.0),
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Nombre de la madre',
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    new ElevatedButton(
                      onPressed: () {
                        print("Boton presionado");
                      },
                      style: TextButton.styleFrom(
                          foregroundColor: Colors.amber,
                          backgroundColor: Color.fromARGB(255, 255, 255, 255)),
                      child: Text("Tomar foto"),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                      child: Text(
                        "o",
                        style:
                            TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                    new ElevatedButton(
                      onPressed: () {
                        print("Boton presionado");
                      },
                      style: TextButton.styleFrom(
                          foregroundColor: Colors.amber,
                          backgroundColor: Color.fromARGB(255, 255, 255, 255)),
                      child: Text("Elegir foto"),
                    ),
                  ],
                ),
              ),

              new ElevatedButton(
                onPressed: () {
                  print("Boton presionado");
                },
                style: TextButton.styleFrom(
                    foregroundColor: Color.fromARGB(255, 255, 255, 255),
                    backgroundColor: Colors.amber),
                child: Text("Guardar"),
              ),
            ],
        ))),
      ),
    );
  }
}
