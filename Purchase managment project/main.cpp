#include "producto.h"
#include "tarjeta.h"
#include "user.h"
#include <algorithm>
#include <fstream>
#include <iostream>
#include <stdlib.h>
#include <string>
using namespace std;

void Carrito() {
  int opcion;
  double totalCompra = 0;
  ofstream listaCompra;
  Producto listaPoducto[10];
  listaPoducto[0].setNomProducto("1. Sabritas adobadas");
  listaPoducto[1].setNomProducto("2. Coca sin Azucar");
  listaPoducto[2].setNomProducto("3. Powerade");
  listaPoducto[3].setNomProducto("4. Kinder bueno");
  listaPoducto[4].setNomProducto("5. Pinguinos ");
  listaPoducto[5].setNomProducto("6. Cereal");
  listaPoducto[6].setNomProducto("7. Avena");
  listaPoducto[7].setNomProducto("8. Leche");
  listaPoducto[8].setNomProducto("9. Crema");
  listaPoducto[9].setNomProducto("10. Carne de res");
  listaPoducto[0].setPrecio(24.50);
  listaPoducto[1].setPrecio(18.50);
  listaPoducto[2].setPrecio(30.50);
  listaPoducto[3].setPrecio(34);
  listaPoducto[4].setPrecio(27.75);
  listaPoducto[5].setPrecio(40);
  listaPoducto[6].setPrecio(27.50);
  listaPoducto[7].setPrecio(45);
  listaPoducto[8].setPrecio(14);
  listaPoducto[9].setPrecio(107.75);
  cout << "Bienvenido a la tienda Barrio24h" << endl
       << "Escoge tus productos" << endl;
  cout << "Lista de productos: " << endl;
  for (int i = 0; i < 10; i++)
    cout << listaPoducto[i].getNomProducto() << " $"
         << listaPoducto[i].getPrecio() << endl;

  cout << "Ingrese el numero de producto que quiere comprar, para finalizar "
          "presione 0"
       << endl;
  listaCompra.open("listacompra.txt", ios::out);
  while (true) {
    cin >> opcion;
    if (opcion > 0 && opcion < 11) {
      opcion = opcion - 1;
      totalCompra = listaPoducto[opcion].getPrecio() + totalCompra;
      listaCompra << listaPoducto[opcion].getNomProducto() << " $"
                  << listaPoducto[opcion].getPrecio() << endl;
    } else if (opcion == 0) {
      cout << "El monto total es de: $" << totalCompra << endl;
      listaCompra << "El total de la compra es de: $" << totalCompra;
      listaCompra.close();
      break;
    }

    else
      cout << "Ingrese un valor valido" << endl;
  }
  if (totalCompra == 0) {
    cout << "Gracias por su visita, compre con nosotros de nuevo";
    exit(0);
  }
}

void Pago() {
  string procederPago, nombre, direccion, correo, fechaVenci, numTarjeta;
  int mes, anio;
  User cliente;
  DatosPago tarjetaCliente;
  ofstream DatosCliente;
  Fecha fecha1;
  cout << "Para proceder con el pago presione s, para cancelar y terminar "
          "presione n: ";

  while (procederPago != "n" && procederPago != "s") {
    cin >> procederPago;
    transform(procederPago.begin(), procederPago.end(), procederPago.begin(),
              ::tolower);
    if (procederPago != "n" && procederPago != "s")
      cout << "Ingrese una respuesta valida: ";
  }
  if (procederPago == "n") {
    cout << "Gracias por su visita, compre con nosotros de nuevo";
    exit(0);
  } else {
    DatosCliente.open("DatosCliente.txt", ios::out);
    cout << "Ingrese sus datos personales: " << endl << "Ingrese el nombre: ";
    cin >> nombre;
    cout << "Ingrese la direccion: ";
    cin >> direccion;
    cout << "Ingrese su correo electronico: ";
    cin >> correo;
    cliente.setNombre(nombre);
    cliente.setDireccion(direccion);
    cliente.setCorreo(correo);
    tarjetaCliente.setnombrePago(cliente.getNombre());
    cout << "Ingrese sus datos de pago: " << endl
         << "Ingrese el numero de tarjeta: ";
    cin >> numTarjeta;
    while (numTarjeta.length() > 16 || numTarjeta.length() < 16) {
      cout << "Ingrese un numero de tarjeta valido (16 digitos): ";
      cin >> numTarjeta;
    }
    cout << "Ingrese la fecha de vencimiento de la tarjeta, escriba el numero "
            "de mes y los ultimos dos digitos del anio"
         << endl;
    cin >> mes;
    while ((mes > 12) || (mes < 1)) {
      cout << "Ingrese un mes valido: ";
      cin >> mes;
    }
    cin >> anio;
    while (anio <= 22) {
      cout << "Ingrese un anio valido: ";
      cin >> anio;
    }
    fecha1.setMes(mes);
    fecha1.setAnio(anio);
    tarjetaCliente.setnumeroTarjeta(numTarjeta);
    tarjetaCliente.setfechaVencimientoMes(fecha1.getMes());
    tarjetaCliente.setfechaVencimientoAnio(fecha1.getAnio());
    DatosCliente << "Nombre: " << cliente.getNombre() << endl
                 << "Direccion: " << cliente.getDireccion() << endl
                 << "Correo: " << cliente.getCorreo() << endl
                 << "Numeroo de tarjeta: " << tarjetaCliente.getnumeroTarjeta()
                 << endl
                 << "Fecha de vencimiento: "
                 << tarjetaCliente.getfechaVencimientoMes() << "/"
                 << tarjetaCliente.getfechaVencimientoAnio();
    DatosCliente.close();
  }
}

void FinalizarTransaccion() {
  string texto, procederPago;
  ifstream listaCompras, datosC;
  listaCompras.open("listacompra.txt", ios::in);
  cout << "Articulos a pagar: " << endl;
  while (!listaCompras.eof()) {
    getline(listaCompras, texto);
    cout << texto << endl;
  }
  listaCompras.close();
  datosC.open("DatosCliente.txt", ios::in);
  cout << "Datos de pago: " << endl;
  while (!datosC.eof()) {
    getline(datosC, texto);
    cout << texto << endl;
  }
  datosC.close();
  cout << "Para proceder con el pago presione s, para cancelar presione n"
       << endl;
  while (procederPago != "n" && procederPago != "s") {
    cin >> procederPago;
    transform(procederPago.begin(), procederPago.end(), procederPago.begin(),
              ::tolower);
    if (procederPago != "n" && procederPago != "s")
      cout << "Ingrese una respuesta valida: ";
  }
  if (procederPago == "n") {
    cout << "Gracias por su visita, compre con nosotros de nuevo" << endl;
  } else {

    cout << "Gracias por su compra" << endl
         << "El recibo le llegara a su correo junto con una liga de ratreo del "
            "producto"
         << endl;
  }
}

int main() {
  string otraCompra;
  while (true) {
    Carrito();
    Pago();
    FinalizarTransaccion();
    cout << "Si desea hacer otra compra presione s, de lo contrario presione "
            "n: ";
    while (otraCompra != "n" && otraCompra != "s") {
      cin >> otraCompra;
      transform(otraCompra.begin(), otraCompra.end(), otraCompra.begin(),
                ::tolower);
      if (otraCompra != "n" && otraCompra != "s")
        cout << "Ingrese una respuesta valida: ";
    }
    if (otraCompra == "n") {
      cout << "Gracias por su visita, compre con nosotros de nuevo";
      break;
    } else {
      continue;
    }
  }

  return 0;
}