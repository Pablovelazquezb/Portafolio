#include <iostream>
using namespace std;

class Fecha {
    private:
        int anio, mes;
    public:
        Fecha();
        int getAnio();
        int getMes();
        void setAnio(int An);
        void setMes(int Me);
};
Fecha:: Fecha(){
    mes = 12;
    anio = 31;
}
int Fecha::getAnio(){
    return anio;
}
int Fecha::getMes(){
    return mes;
}
void Fecha:: setAnio(int An){
    anio = An;
}
void Fecha:: setMes(int Me){
    mes = Me;
}