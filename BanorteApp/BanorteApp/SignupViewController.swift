import UIKit

class SignupViewController: UIViewController {
    
    let usernameTextField = UITextField()
    let emailTextField = UITextField()
    let passwordTextField = UITextField()
    let nombreCompletoTextField = UITextField()
    let telefonoTextField = UITextField()
    let fechaNacimientoTextField = UITextField()
    let paisResidenciaTextField = UITextField()
    let ingresosMensualesTextField = UITextField()
    let ocupacionTextField = UITextField()
    let signupButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        // Configurar los campos de texto
        usernameTextField.placeholder = "Nombre de usuario"
        usernameTextField.borderStyle = .roundedRect
        usernameTextField.autocapitalizationType = .none
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(usernameTextField)
        
        emailTextField.placeholder = "Correo electrónico"
        emailTextField.borderStyle = .roundedRect
        emailTextField.keyboardType = .emailAddress
        emailTextField.autocapitalizationType = .none
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(emailTextField)
        
        passwordTextField.placeholder = "Contraseña"
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.isSecureTextEntry = true
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(passwordTextField)
        
        nombreCompletoTextField.placeholder = "Nombre completo"
        nombreCompletoTextField.borderStyle = .roundedRect
        nombreCompletoTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nombreCompletoTextField)
        
        telefonoTextField.placeholder = "Teléfono"
        telefonoTextField.borderStyle = .roundedRect
        telefonoTextField.keyboardType = .phonePad
        telefonoTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(telefonoTextField)
        
        fechaNacimientoTextField.placeholder = "Fecha de nacimiento (YYYY-MM-DD)"
        fechaNacimientoTextField.borderStyle = .roundedRect
        fechaNacimientoTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(fechaNacimientoTextField)
        
        paisResidenciaTextField.placeholder = "País de residencia"
        paisResidenciaTextField.borderStyle = .roundedRect
        paisResidenciaTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(paisResidenciaTextField)
        
        ingresosMensualesTextField.placeholder = "Ingresos mensuales"
        ingresosMensualesTextField.borderStyle = .roundedRect
        ingresosMensualesTextField.keyboardType = .decimalPad
        ingresosMensualesTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(ingresosMensualesTextField)
        
        ocupacionTextField.placeholder = "Ocupación"
        ocupacionTextField.borderStyle = .roundedRect
        ocupacionTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(ocupacionTextField)
        
        // Configurar el botón de registro
        signupButton.setTitle("Registrar", for: .normal)
        signupButton.addTarget(self, action: #selector(signupTapped), for: .touchUpInside)
        signupButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(signupButton)
        
        // Configurar las restricciones de los elementos
        NSLayoutConstraint.activate([
            usernameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            usernameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            usernameTextField.widthAnchor.constraint(equalToConstant: 300),
            usernameTextField.heightAnchor.constraint(equalToConstant: 50),
            
            emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 20),
            emailTextField.widthAnchor.constraint(equalToConstant: 300),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passwordTextField.widthAnchor.constraint(equalToConstant: 300),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            nombreCompletoTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nombreCompletoTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            nombreCompletoTextField.widthAnchor.constraint(equalToConstant: 300),
            nombreCompletoTextField.heightAnchor.constraint(equalToConstant: 50),
            
            telefonoTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            telefonoTextField.topAnchor.constraint(equalTo: nombreCompletoTextField.bottomAnchor, constant: 20),
            telefonoTextField.widthAnchor.constraint(equalToConstant: 300),
            telefonoTextField.heightAnchor.constraint(equalToConstant: 50),
            
            fechaNacimientoTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            fechaNacimientoTextField.topAnchor.constraint(equalTo: telefonoTextField.bottomAnchor, constant: 20),
            fechaNacimientoTextField.widthAnchor.constraint(equalToConstant: 300),
            fechaNacimientoTextField.heightAnchor.constraint(equalToConstant: 50),
            
            paisResidenciaTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            paisResidenciaTextField.topAnchor.constraint(equalTo: fechaNacimientoTextField.bottomAnchor, constant: 20),
            paisResidenciaTextField.widthAnchor.constraint(equalToConstant: 300),
            paisResidenciaTextField.heightAnchor.constraint(equalToConstant: 50),
            
            ingresosMensualesTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ingresosMensualesTextField.topAnchor.constraint(equalTo: paisResidenciaTextField.bottomAnchor, constant: 20),
            ingresosMensualesTextField.widthAnchor.constraint(equalToConstant: 300),
            ingresosMensualesTextField.heightAnchor.constraint(equalToConstant: 50),
            
            ocupacionTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ocupacionTextField.topAnchor.constraint(equalTo: ingresosMensualesTextField.bottomAnchor, constant: 20),
            ocupacionTextField.widthAnchor.constraint(equalToConstant: 300),
            ocupacionTextField.heightAnchor.constraint(equalToConstant: 50),
            
            signupButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signupButton.topAnchor.constraint(equalTo: ocupacionTextField.bottomAnchor, constant: 30),
            signupButton.widthAnchor.constraint(equalToConstant: 200),
            signupButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    // Acción del botón para hacer la solicitud de signup a la API
    @objc func signupTapped() {
        guard let username = usernameTextField.text, !username.isEmpty,
              let email = emailTextField.text, !email.isEmpty,
              let password = passwordTextField.text, !password.isEmpty,
              let nombreCompleto = nombreCompletoTextField.text, !nombreCompleto.isEmpty,
              let telefono = telefonoTextField.text, !telefono.isEmpty,
              let fechaNacimiento = fechaNacimientoTextField.text, !fechaNacimiento.isEmpty,
              let paisResidencia = paisResidenciaTextField.text, !paisResidencia.isEmpty,
              let ingresosMensuales = ingresosMensualesTextField.text, !ingresosMensuales.isEmpty,
              let ocupacion = ocupacionTextField.text, !ocupacion.isEmpty else {
            print("Todos los campos son obligatorios")
            return
        }
        
        // Preparar el URL de la API
        let url = URL(string: "http://localhost:3000/api/auth/signup")! // Cambia este URL por el de tu API
        
        // Crear el request
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        // Definir el cuerpo (payload) de la solicitud con los datos del signup
        let body: [String: Any] = [
            "username": username,
            "password": password,
            "email": email,
            "nombreCompleto": nombreCompleto,
            "telefono": telefono,
            "fechaNacimiento": fechaNacimiento,
            "paisResidencia": paisResidencia,
            "ingresosMensuales": ingresosMensuales,
            "ocupacion": ocupacion
        ]
        
        // Convertir el diccionario a JSON
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: body)
        } catch {
            print("Error al convertir los datos a JSON: \(error.localizedDescription)")
            return
        }
        
        // Configurar los headers
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // Crear la sesión
        let session = URLSession(configuration: .default)
        
        // Hacer la solicitud
        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error en la solicitud: \(error.localizedDescription)")
                return
            }
            
            // Verificar si hay respuesta válida
            if let httpResponse = response as? HTTPURLResponse {
                print("Código de respuesta HTTP: \(httpResponse.statusCode)")
                
                if httpResponse.statusCode == 201 { // Suponiendo que el código de éxito es 201
                    print("Registro exitoso")
                    
                    // Manejar la respuesta (opcionalmente, navegar a otra vista)
                    DispatchQueue.main.async {
                        // Por ejemplo, navegar al login o la pantalla principal
                        let loginVC = HomeViewController()
                        self.navigationController?.pushViewController(loginVC, animated: true)
                    }
                } else {
                    print("Error en el registro: \(httpResponse.statusCode)")
                    if let data = data {
                        let responseString = String(data: data, encoding: .utf8)
                        print("Mensaje del servidor: \(responseString ?? "Sin mensaje de error")")
                    }
                }
            }
        }
        
        task.resume() // Ejecutar la solicitud
    }
}

