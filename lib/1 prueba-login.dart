import 'dart:convert';

import 'package:best_flutter_ui_templates/2%20prueba-registro%20animal.dart';
import 'package:best_flutter_ui_templates/dataUser.dart';
import 'package:best_flutter_ui_templates/fitness_app/fitness_app_home_screen.dart';
import 'package:best_flutter_ui_templates/navigation_home_screen.dart';
import 'package:best_flutter_ui_templates/registerWhatsApp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'custom_drawer/home_drawer.dart';
import 'package:flutter/material.dart';

class Login2 extends StatefulWidget {
  const Login2({super.key});

  @override
  State<Login2> createState() => _LoginState();
}

class _LoginState extends State<Login2> {

//Login Facebook
  String prettyPrint(Map json) {
    JsonEncoder encoder = const JsonEncoder.withIndent('  ');
    String pretty = encoder.convert(json);
    return pretty;
  }

  Map<String, dynamic>? _userData;
  AccessToken? _accessToken;
  bool _checking = true;

  @override
  void initState() {
    super.initState();
    _checkIfIsLogged();
    /*  mostrar_datos();
    show_data_fb(); */
  }

  Future<void> _checkIfIsLogged() async {
    final accessToken = await FacebookAuth.instance.accessToken;
    setState(() {
      _checking = false;
    });
    if (accessToken != null) {
      print("is Logged:::: ${prettyPrint(accessToken.toJson())}");
      // now you can call to  FacebookAuth.instance.getUserData();
      final userData = await FacebookAuth.instance.getUserData();
      // final userData = await FacebookAuth.instance.getUserData(fields: "email,birthday,friends,gender,link");
      _accessToken = accessToken;
      setState(() {
        _userData = userData;
      });
    }
  }

  void _printCredentials() {
    print(
      prettyPrint(_accessToken!.toJson()),
    );
  }

  Future<void> _loginfacebook() async {
    final LoginResult result = await FacebookAuth.instance.login();

    if (result.status == LoginStatus.success) {
      _accessToken = result.accessToken;
      _printCredentials();

      final userData = await FacebookAuth.instance.getUserData();

      _userData = userData;

      save_data_facebook(
          _userData!['name'], _userData!['picture']['data']['url']);

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Registro()),
      );
    } else {
      print(result.status);
      print(result.message);
    }

    setState(() {
      _checking = false;
    });
  }

  Future<void> save_data_facebook(name, url) async {
    SharedPreferences prefUser = await SharedPreferences.getInstance();

    await prefUser.setString('nameUser', name);
    await prefUser.setString('urlFotoUser', url);

    /* await prefUserFB.setString('nameFB', name);
    await prefUserFB.setString('ulrFB', url); */
  }

  /* String? idUserFB;
  String? urlUserFB;

  Future<void> show_data_fb() async {
    SharedPreferences prefsFB = await SharedPreferences.getInstance();

    idUserFB = await prefsFB.getString('nameFB');
    urlUserFB = await prefsFB.getString('ulrFB');

    print(idUserFB);
    print(urlUserFB);
  } */

  Future<void> logOutFb() async {
    await FacebookAuth.instance.logOut();
    _accessToken = null;
    _userData = null;
    setState(() {});
  }
  //Login Facebook

  //Login Google
  Future<void> _logingoogle() async {
    GoogleSignIn googleLogin = GoogleSignIn(
        scopes: ["email", "https://www.googleapis.com/auth/drive"]);

    try {
      var data = await googleLogin.signIn();
      var authData = await data!.authentication;

      print(data.photoUrl);
      print(data.id);
      print(data.email);
      print(data.displayName);
      print(authData.accessToken); 

      guardar_datos_user(data.id, data.email, data.displayName, data.photoUrl);

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Registro()),
      );
    } catch (e) {}
  }

  //Login google

  Future<void> guardar_datos_user(id, email, nameUser, urlFoto) async {
    SharedPreferences prefUser = await SharedPreferences.getInstance();

    /* await prefUser.setString('id', id);
    await prefUser.setString('email', email); */
    await prefUser.setString('nameUser', nameUser);
    await prefUser.setString('urlFotoUser', urlFoto);
  }

  /* String? idUser;
  String? userEmal;
  String? urlDataUser;

  Future<void> mostrar_datos() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    idUser = await prefs.getString('id');
    userEmal = await prefs.getString('email');
    urlDataUser = await prefs.getString('urlFotoUser');

    print(idUser);
    print(urlDataUser);
  } */

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body:SingleChildScrollView(
          child:Center(
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Text(
                    "(Copia)Bienvenido:",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),

                //inicia logo
                SizedBox(
                  width: 400,
                  height: 200,
                  child: Image.asset('assets/images/Logo.png'),
                ),
                //termina logo
              
                //inicia formulario
                Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Correo electronico'),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: 'Contraseña'),
                  ),
                ),
                new ElevatedButton(
                  onPressed: () {
                    print("Boton presionado");
                  },
                  style: TextButton.styleFrom(
                      foregroundColor: Color.fromARGB(255, 255, 255, 255),
                      backgroundColor: Colors.amber),
                  child: Text("Inicio de sesión"),
                ),
            //termina formulario

            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                "o ingresa con:",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            //inicia iconos google fb
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: () async {
                        _logingoogle();
                      },
                      child: Image.asset(
                        'assets/images/google.png',
                        scale: 30,
                      )),
                  SizedBox(
                    width: 40,
                  ),
                  GestureDetector(
                      onTap: () {
                        _loginfacebook();
                      },
                      child: Image.asset(
                        'assets/images/facebook.png',
                        scale: 30,
                      )),
                  /*
                  SizedBox(
                    width: 40,
                  ),

                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => PhoneLogin()));
                      },
                      child: Image.asset(
                        'assets/images/whatsapp.png',
                        scale: 20,
                      ))*/
                ],
              ),
            ),
            //termina iconos google fb
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '¿No recuerdas tu contraseña?',
                    style: TextStyle(
                      color: Color.fromARGB(255, 217, 146, 15),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '¿Nuevo en esta aplicación? ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                  ),

                  Text(
                    'Registrate',
                    style: TextStyle(
                      color: Color(0xff132137),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                ],
              ),
            ),



              ]

            )
          )

        )


      ),
    );
  } // de context
}
