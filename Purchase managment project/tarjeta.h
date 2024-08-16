#include "fecha.h"
#include <iostream>
using namespace std;

class DatosPago {
private:
  string numeroTarjeta;
  string nombrePago;
  Fecha fechaVenci;

public:
  DatosPago();
  DatosPago(string numeroTarjeta, Fecha fechaVenci, string nombrePago);
  string getnumeroTarjeta();
  int getfechaVencimientoAnio();
  int getfechaVencimientoMes();
  string getnombrePago();
  void setnumeroTarjeta(string);
  void setfechaVencimientoAnio(int);
  void setfechaVencimientoMes(int);
  void setnombrePago(string);
};

DatosPago::DatosPago() {
  numeroTarjeta = "895362147";
  fechaVenci;
  nombrePago = " ";
}
DatosPago::DatosPago(string numeroTarjeta, Fecha fechaVenci,
                     string nombrePago) {
  numeroTarjeta = numeroTarjeta;
  fechaVenci = fechaVenci;
  nombrePago = nombrePago;
}
string DatosPago::getnumeroTarjeta() { return numeroTarjeta; }
int DatosPago::getfechaVencimientoAnio() { return fechaVenci.getAnio(); }
int DatosPago::getfechaVencimientoMes() { return fechaVenci.getMes(); }
string DatosPago::getnombrePago() { return nombrePago; }
void DatosPago::setnumeroTarjeta(string numT) { numeroTarjeta = numT; }
void DatosPago::setfechaVencimientoAnio(int An) { fechaVenci.setAnio(An); }
void DatosPago::setfechaVencimientoMes(int Mes) { fechaVenci.setMes(Mes); }
void DatosPago::setnombrePago(string nomP) { nombrePago = nomP; }