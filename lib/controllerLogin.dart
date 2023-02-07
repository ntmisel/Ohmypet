import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ControllerLogin {
  /* String? idUser;
  String? userEmal; */
  String? nameUserData;

  Future<String> getNombreUsuario() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    /* idUser = await prefs.getString('id');
    userEmal = await prefs.getString('email'); */
    nameUserData = await prefs.getString('nameUser');

    return nameUserData!;
  }

  Future<String> getFotoUsuario() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? urlFoto;

    urlFoto = await prefs.getString('urlFotoUser');

    return urlFoto!;
  }

  Future<String> getNombreusuarioFB() async {
    SharedPreferences prefsfb = await SharedPreferences.getInstance();
    String? nameUserDataFB;

    nameUserDataFB = await prefsfb.getString('nameFB');
    return nameUserDataFB!;
  }

  eliminarSesion() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    /* prefs.remove('id');
    prefs.remove('email'); */
    prefs.remove('nameUser');

    /* prefs.remove('urlFotoUser'); */
  }
}
