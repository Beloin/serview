import 'dart:math';

class User {
  String _id;
  String _email;
  String _password;
  String _name;
  //img _fotoPerfil;
  bool _fornecedor = false;
  //Curriculo _curriculo;
  double _classification = 3;

  User(name, email, password){
    _password = password;
    _name = name;
    _email = email;
    Random idGen = new Random();
    var idT = idGen.nextInt(999999);
    if (idT < 100000) idT = idGen.nextInt(999999);
    _id = idT.toString();
  }
  void msg(){}
  void editPerfil(){}
  void editClassification(){}
}

class Curriculum {
  //Profession _prof;
  String _description;
  //List<img> _imgs;
  Curriculum(description, /*prof,*/){
    _description = description;
    //_prof = prof;
  }
  void editProf(){}
  void editDesc(){}
}

class Profession{
  List<String> _prof;
  String _currentProf;
  
  void editCurrentProf(){}
  void addProf(){}
  void rmvProf(){}
  void searchProf(){}
  void getCurrentProf(){}
}
