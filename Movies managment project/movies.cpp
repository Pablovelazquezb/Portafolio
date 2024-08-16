//Pablo Velazquez Bremont A01734635
#include <iostream>
#include <vector>
#include <string>

using namespace std;

struct Video {
    string titulo;
    string genero;
    float calificacion;
};

struct Pelicula {
    string titulo;
    string genero;
    float calificacion;
};

struct Serie {
    string titulo;
    float calificacion;
};

vector<Video> videos; 
vector<Pelicula> peliculas;
vector<Serie> series;
float calificacionGeneral = 0.0;

void cargarArchivo() {
    Video video1;
   video1.titulo = "La caida de Edgar";
    video1.genero = "Comedia";
    video1.calificacion = 8.5;
    videos.push_back(video1);

    Video video2;
   video2.titulo = " Me comi una salchipapa";
    video2.genero = "Comedia";
    video2.calificacion = 9;
    videos.push_back(video2);

  
    Pelicula pelicula1;
    pelicula1.titulo = "The Shawshank Redemption";
    pelicula1.genero = "Drama";
    pelicula1.calificacion = 9.3;
    peliculas.push_back(pelicula1);

    Pelicula pelicula2;
    pelicula2.titulo = "The Godfather";
    pelicula2.genero = "Crime";
    pelicula2.calificacion = 9.2;
    peliculas.push_back(pelicula2);

    Pelicula pelicula3;
    pelicula3.titulo = "Pulp Fiction";
    pelicula3.genero = "Crime";
    pelicula3.calificacion = 8.9;
    peliculas.push_back(pelicula3);

    // Agregar series famosas
    Serie serie1;
    serie1.titulo = "Breaking Bad";
    serie1.calificacion = 9.5;
    series.push_back(serie1);

    Serie serie2;
    serie2.titulo = "Game of Thrones";
    serie2.calificacion = 9.3;
    series.push_back(serie2);

    Serie serie3;
    serie3.titulo = "Stranger Things";
    serie3.calificacion = 8.8;
    series.push_back(serie3);

  
  cout << "Archivos cargados exitosamente." << endl;
  
}

void mostrarVideosPorCalificacionOGenero() {
    float calificacionMinima;
    string generoEspecifico;

    cout << "Ingrese la calificación mínima: ";
    cin >> calificacionMinima;

    cout << "Ingrese el género específico: ";
    cin >> generoEspecifico;

    bool encontrado = false;

    for (const auto& video : videos) {
        if (video.calificacion >= calificacionMinima && video.genero == generoEspecifico) {
            cout << "Título: " << video.titulo << endl;
            cout << "Género: " << video.genero << endl;
            cout << "Calificación: " << video.calificacion << endl;
            cout << "----------------------------------" << endl;
            encontrado = true;
        }
    }

    if (!encontrado) {
        cout << "No se encontraron videos con la calificación y género especificados." << endl;
    }
}


void mostrarEpisodiosDeSeriePorCalificacion() {
    string tituloSerie;
    float calificacionEspecifica;

    cout << "Ingrese el título de la serie: ";
    cin.ignore();
    getline(cin, tituloSerie);

    cout << "Ingrese la calificación específica: ";
    cin >> calificacionEspecifica;

    bool encontrado = false;

    for (const auto& serie : series) {
        if (serie.titulo == tituloSerie) {
            cout << "Episodios de la serie \"" << serie.titulo << "\" con calificación " << calificacionEspecifica << ":" << endl;

            bool episodiosEncontrados = false;

             for (const auto& serie : series) {
                if (serie.calificacion == calificacionEspecifica) {
                    cout << "- Episodio con calificación \"" << serie.calificacion << endl;
                    episodiosEncontrados = true;
                }
            }

            if (!episodiosEncontrados) {
                cout << "No se encontraron episodios con la calificación especificada." << endl;
            }

            encontrado = true;
            break;
        }
    }

    if (!encontrado) {
        cout << "No se encontró la serie especificada." << endl;
    }
}



void mostrarPeliculasPorCalificacion() {
    float calificacionEspecifica;

    cout << "Ingrese la calificación específica: ";
    cin >> calificacionEspecifica;

    bool encontrado = false;

    for (const auto& pelicula : peliculas) {
        if (pelicula.calificacion == calificacionEspecifica && pelicula.genero != "Serie") {
            cout << "Título: " << pelicula.titulo << endl;
            cout << "Género: " << pelicula.genero << endl;
            cout << "Calificación: " << pelicula.calificacion << endl;
            cout << "----------------------------------" << endl;
            encontrado = true;
        }
    }

    if (!encontrado) {
        cout << "No se encontraron películas con la calificación especificada." << endl;
    }
}

void calificarVideo() {
    string tituloVideo;
    float calificacion;

    cout << "Ingrese el título del video: ";
    cin.ignore();
    getline(cin, tituloVideo);

    cout << "Ingrese la calificación (0-10): ";
    cin >> calificacion;

    bool encontrado = false;


    
    cout << "Video calificado exitosamente." << endl;
}


int main() {
    int opcion;

    do {
        cout << "======= MENU =======" << endl;
        cout << "1. Cargar archivos " << endl;
        cout << "2. Mostrar videos" << endl;
        cout << "3. Mostrar series" << endl;
        cout << "4. Mostrar peliculas" << endl;
        cout << "5. Calificar un video" << endl;
        cout << "0. Salir" << endl;
        cout << "Ingrese una opción: ";
        cin >> opcion;

        switch (opcion) {
            case 1:
                cargarArchivo();
                break;
            case 2:
                mostrarVideosPorCalificacionOGenero();
                break;
            case 3:
                mostrarEpisodiosDeSeriePorCalificacion();
                break;
            case 4:
                mostrarPeliculasPorCalificacion();
                break;
            case 5:
                calificarVideo();
                break;
            case 0:
                cout << "Saliendo del programa..." << endl;
                break;
            default:
                cout << "Opción inválida. Intente nuevamente." << endl;
        }

        cout << endl;
    } while (opcion != 0);

    return 0;
}
