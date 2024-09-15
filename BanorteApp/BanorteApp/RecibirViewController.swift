import UIKit

class RecibirViewController: UIViewController {

    // Información relevante
    var nombre: String = "Jose Antonio"
    var cuentaDebito: String = "1234 5678 9012 3456"
    var cuentaCredito: String = "1344 1834 9012 3446"
    var clabeInterbancaria: String = "012345678901234567"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Configurar la vista
        view.backgroundColor = .white
        title = "Recibir Dinero"

        // Contenedor para la información del nombre
        let nombreContainer = UIView()
        nombreContainer.backgroundColor = UIColor(white: 0.95, alpha: 1) // Fondo gris claro
        nombreContainer.layer.cornerRadius = 12
        nombreContainer.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nombreContainer)

        // Etiqueta para el nombre
        let nombreLabel = UILabel()
        nombreLabel.text = "Nombre: \(nombre)"
        nombreLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        nombreLabel.textColor = UIColor(white: 0.1, alpha: 1) // Un gris oscuro elegante
        nombreLabel.translatesAutoresizingMaskIntoConstraints = false
        nombreContainer.addSubview(nombreLabel)

        // Contenedor para la cuenta de débito
        let cuentaDebitoContainer = UIView()
        cuentaDebitoContainer.backgroundColor = UIColor(white: 0.95, alpha: 1)
        cuentaDebitoContainer.layer.cornerRadius = 12
        cuentaDebitoContainer.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cuentaDebitoContainer)

        let cuentaDebitoLabel = UILabel()
        cuentaDebitoLabel.text = "Cuenta de Débito: \(cuentaDebito)"
        cuentaDebitoLabel.font = UIFont.systemFont(ofSize: 16)
        cuentaDebitoLabel.textColor = UIColor(white: 0.4, alpha: 1)
        cuentaDebitoLabel.translatesAutoresizingMaskIntoConstraints = false
        cuentaDebitoContainer.addSubview(cuentaDebitoLabel)

        // Contenedor para la cuenta de crédito
        let cuentaCreditoContainer = UIView()
        cuentaCreditoContainer.backgroundColor = UIColor(white: 0.95, alpha: 1)
        cuentaCreditoContainer.layer.cornerRadius = 12
        cuentaCreditoContainer.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cuentaCreditoContainer)

        let cuentaCreditoLabel = UILabel()
        cuentaCreditoLabel.text = "Cuenta de Crédito: \(cuentaCredito)"
        cuentaCreditoLabel.font = UIFont.systemFont(ofSize: 16)
        cuentaCreditoLabel.textColor = UIColor(white: 0.4, alpha: 1)
        cuentaCreditoLabel.translatesAutoresizingMaskIntoConstraints = false
        cuentaCreditoContainer.addSubview(cuentaCreditoLabel)

        // Contenedor para la CLABE interbancaria
        let clabeContainer = UIView()
        clabeContainer.backgroundColor = UIColor(white: 0.95, alpha: 1)
        clabeContainer.layer.cornerRadius = 12
        clabeContainer.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(clabeContainer)

        let clabeLabel = UILabel()
        clabeLabel.text = "CLABE Interbancaria: \(clabeInterbancaria)"
        clabeLabel.font = UIFont.systemFont(ofSize: 16)
        clabeLabel.textColor = UIColor(white: 0.4, alpha: 1)
        clabeLabel.translatesAutoresizingMaskIntoConstraints = false
        clabeContainer.addSubview(clabeLabel)

        // Añadimos padding dentro de los contenedores
        let padding: CGFloat = 15
        NSLayoutConstraint.activate([
            // Contenedor del nombre
            nombreContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nombreContainer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            nombreContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nombreContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nombreContainer.heightAnchor.constraint(equalToConstant: 60),
            
            // Nombre dentro del contenedor
            nombreLabel.leadingAnchor.constraint(equalTo: nombreContainer.leadingAnchor, constant: padding),
            nombreLabel.trailingAnchor.constraint(equalTo: nombreContainer.trailingAnchor, constant: -padding),
            nombreLabel.centerYAnchor.constraint(equalTo: nombreContainer.centerYAnchor),

            // Contenedor de la cuenta de débito
            cuentaDebitoContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cuentaDebitoContainer.topAnchor.constraint(equalTo: nombreContainer.bottomAnchor, constant: 20),
            cuentaDebitoContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            cuentaDebitoContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            cuentaDebitoContainer.heightAnchor.constraint(equalToConstant: 60),

            // Cuenta de débito dentro del contenedor
            cuentaDebitoLabel.leadingAnchor.constraint(equalTo: cuentaDebitoContainer.leadingAnchor, constant: padding),
            cuentaDebitoLabel.trailingAnchor.constraint(equalTo: cuentaDebitoContainer.trailingAnchor, constant: -padding),
            cuentaDebitoLabel.centerYAnchor.constraint(equalTo: cuentaDebitoContainer.centerYAnchor),

            // Contenedor de la cuenta de crédito
            cuentaCreditoContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cuentaCreditoContainer.topAnchor.constraint(equalTo: cuentaDebitoContainer.bottomAnchor, constant: 20),
            cuentaCreditoContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            cuentaCreditoContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            cuentaCreditoContainer.heightAnchor.constraint(equalToConstant: 60),

            // Cuenta de crédito dentro del contenedor
            cuentaCreditoLabel.leadingAnchor.constraint(equalTo: cuentaCreditoContainer.leadingAnchor, constant: padding),
            cuentaCreditoLabel.trailingAnchor.constraint(equalTo: cuentaCreditoContainer.trailingAnchor, constant: -padding),
            cuentaCreditoLabel.centerYAnchor.constraint(equalTo: cuentaCreditoContainer.centerYAnchor),

            // Contenedor de la CLABE interbancaria
            clabeContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            clabeContainer.topAnchor.constraint(equalTo: cuentaCreditoContainer.bottomAnchor, constant: 20),
            clabeContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            clabeContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            clabeContainer.heightAnchor.constraint(equalToConstant: 60),

            // CLABE interbancaria dentro del contenedor
            clabeLabel.leadingAnchor.constraint(equalTo: clabeContainer.leadingAnchor, constant: padding),
            clabeLabel.trailingAnchor.constraint(equalTo: clabeContainer.trailingAnchor, constant: -padding),
            clabeLabel.centerYAnchor.constraint(equalTo: clabeContainer.centerYAnchor)
        ])
    }
}
