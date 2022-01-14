import 'package:flutter/material.dart';
import 'package:get/get.dart';

class selectcontroll extends GetxController{
  var selectedlist = List<String>.empty(growable: true).obs;
 
}

class selectcolor extends GetxController{
  var selectedcolors =List<String>.empty(growable: true).obs;
}


class selectclarity extends GetxController{
  var selectedclarity =List<String>.empty(growable: true).obs;
}

class selectcertificate extends GetxController{
  var selectedcert =List<String>.empty(growable: true).obs;
}


class SelectSize extends GetxController{
  var selectedsize =List<String>.empty(growable: true).obs;
}


class selectcut extends GetxController{
  var selectedcut =List<String>.empty(growable: true).obs;
}

class selectpolish extends GetxController{
  var selectedpol =List<String>.empty(growable: true).obs;
}

class selectsymmetry extends GetxController{
  var selectedsymm =List<String>.empty(growable: true).obs;
}