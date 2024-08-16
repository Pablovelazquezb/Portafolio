#include <iostream>
using namespace std;

class Producto{
private:
  double precio;
  string nomProducto;
public:
  Producto();
  Producto(string nomProducto1, double precio);
  string getNomProducto();
  double getPrecio();
  void setNomProducto(string nomP);
  void setPrecio(double pre);
};

Producto :: Producto(){
nomProducto = " ";
precio = 1;
}
Producto ::Producto(string nomProducto1, double precio){
nomProducto1=nomProducto1;
precio=precio;
}
string Producto ::getNomProducto(){
return nomProducto;
}
double Producto ::getPrecio(){
return precio;
}
void Producto :: setNomProducto(string nomP){
nomProducto = nomP;
}
void Producto ::setPrecio(double pre){
precio = pre;
}