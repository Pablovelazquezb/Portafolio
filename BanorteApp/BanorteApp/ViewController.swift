import UIKit

class ViewController: UIViewController, URLSessionDelegate {
    
    let logoImageView = UIImageView()
    let usernameTextField = UITextField()
    let passwordTextField = UITextField()
    let loginButton = UIButton(type: .system)
    let signupButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        // Configuración del logo
        logoImageView.image = UIImage(named: "banorte") // Asegúrate de tener el archivo "banorte_logo.png" en tu proyecto
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(logoImageView)
        
        // Configuración del campo de texto para el nombre de usuario
        usernameTextField.placeholder = "Nombre de usuario"
        usernameTextField.borderStyle = .roundedRect
        usernameTextField.autocapitalizationType = .none
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(usernameTextField)
        
        // Configuración del campo de texto para la contraseña
        passwordTextField.placeholder = "Contraseña"
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.isSecureTextEntry = true
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(passwordTextField)
        
        // Configuración del botón de inicio de sesión
        loginButton.setTitle("Iniciar Sesión", for: .normal)
        loginButton.backgroundColor = .systemRed
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.layer.cornerRadius = 10
        loginButton.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loginButton)
        
        // Configuración del botón de crear cuenta
        signupButton.setTitle("Crear Cuenta", for: .normal)
        signupButton.backgroundColor = .systemGray
        signupButton.setTitleColor(.white, for: .normal)
        signupButton.layer.cornerRadius = 10
        signupButton.addTarget(self, action: #selector(signupTapped), for: .touchUpInside)
        signupButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(signupButton)
        
        // Aplicar las restricciones de diseño
        NSLayoutConstraint.activate([
            // Logo
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            logoImageView.widthAnchor.constraint(equalToConstant: 150),
            logoImageView.heightAnchor.constraint(equalToConstant: 100),
            
            // Campo de nombre de usuario
            usernameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            usernameTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 40),
            usernameTextField.widthAnchor.constraint(equalToConstant: 300),
            usernameTextField.heightAnchor.constraint(equalToConstant: 50),
            
            // Campo de contraseña
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 20),
            passwordTextField.widthAnchor.constraint(equalToConstant: 300),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            // Botón de inicio de sesión
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30),
            loginButton.widthAnchor.constraint(equalToConstant: 200),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            
            // Botón de crear cuenta
            signupButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signupButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20),
            signupButton.widthAnchor.constraint(equalToConstant: 200),
            signupButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc func loginTapped() {
        guard let username = usernameTextField.text, !username.isEmpty,
              let passwordHash = passwordTextField.text, !passwordHash.isEmpty else {
            print("Nombre de usuario y contraseña son obligatorios")
            return
        }
        
        let url = URL(string: "http://localhost:3000/api/auth/signin")! // Cambia este URL por el de tu API
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let body: [String: Any] = [
            "username": username,
            "password": passwordHash
        ]
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: body)
        } catch {
            print("Error al convertir los datos a JSON: \(error.localizedDescription)")
            return
        }
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession(configuration: .default, delegate: self, delegateQueue: nil)
        
        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error en la solicitud: \(error.localizedDescription)")
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                print("Código de respuesta HTTP: \(httpResponse.statusCode)")
                
                if httpResponse.statusCode == 200 {
                    print("Inicio de sesión exitoso")
                    
                    if let data = data {
                        do {
                            if let jsonResponse = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                                print("Respuesta del servidor: \(jsonResponse)")
                            }
                        } catch {
                            print("Error al analizar la respuesta JSON: \(error.localizedDescription)")
                        }
                    }
                    
                    // Navegar a la pantalla de inicio si el login es exitoso
                    DispatchQueue.main.async {
                        let homeVC = HomeViewController()
                        self.navigationController?.pushViewController(homeVC, animated: true)
                    }
                    
                } else {
                    print("Error: \(httpResponse.statusCode) - Inicio de sesión fallido")
                    
                    if let data = data {
                        let responseString = String(data: data, encoding: .utf8)
                        print("Mensaje del servidor: \(responseString ?? "Sin mensaje de error")")
                    }
                }
            }
        }
        
        task.resume()
    }
    
    @objc func signupTapped() {
        let signupVC = SignupViewController() // Nueva pantalla de crear cuenta
        self.navigationController?.pushViewController(signupVC, animated: true)
    }
    
    func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        let protectionSpace = challenge.protectionSpace
        if protectionSpace.authenticationMethod == NSURLAuthenticationMethodServerTrust && protectionSpace.host == "localhost" {
            let credential = URLCredential(trust: protectionSpace.serverTrust!)
            completionHandler(.useCredential, credential)
        } else {
            completionHandler(.performDefaultHandling, nil)
        }
    }
}
