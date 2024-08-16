#include <iostream>
using namespace std;

class User{
private:
  string Nombre;
  string Direccion;
  string Correo;
public:
  User();
  User(string Nombre, string Direccion, string Correo);
  string getNombre();
  string getDireccion();
  string getCorreo();
  void setNombre(string _Nombre);
  void setDireccion(string _Direccion);
  void setCorreo(string _Correo);
};


User:: User(){
  Nombre = "";
  Direccion = "";
  Correo = "";
}
User:: User(string n, string d, string c){
  Nombre = n;
  Direccion = d;
  Correo = c;
}
string User :: getNombre(){
  return Nombre;
}
string User :: getDireccion(){
  return Direccion;
}
string User :: getCorreo(){
  return Correo;
}
void User :: setNombre(string _Nombre){
  Nombre = _Nombre;
}
void User :: setDireccion(string _Direccion){
  Direccion = _Direccion;
}
void User :: setCorreo(string _Correo){
  Correo = _Correo;
}