import 'dart:math';

class User {
  String _id;
  String _email;
  String _password;
  String _name;
  //img _fotoPerfil;
  bool _Fornecedor = false;
  //Curriculo _curriculo;
  double _classificacao = 3;

  User(name, email, password){
    _password = password;
    _name = name;
    _email = email;
    Random idGen = new Random();
    var idT = idGen.nextInt(999999);
    if (idT < 100000) idT = idGen.nextInt(999999);
    _id = idT.toString();
  }
}
