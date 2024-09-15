import UIKit

class TarjetaDetailViewController: UIViewController {
    
    // Variables que representarán el saldo y el número de cuenta
    var saldo: String = "$250.00"
    var numeroCuenta: String = "1234 5678 9012 3456"

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // Título
        let titleLabel = UILabel()
        titleLabel.text = "Detalles de la Tarjeta de Débito"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 22)
        titleLabel.textColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1) // Color oscuro elegante
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)

        // Saldo de la cuenta
        let saldoLabel = UILabel()
        saldoLabel.text = saldo
        saldoLabel.font = UIFont.boldSystemFont(ofSize: 48) // Tamaño grande y destacado
        saldoLabel.textColor = UIColor(red: 0.1, green: 0.6, blue: 0.3, alpha: 1) // Color verde sutil para destacar el saldo
        saldoLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(saldoLabel)

        // Etiqueta "Saldo disponible"
        let saldoDescriptionLabel = UILabel()
        saldoDescriptionLabel.text = "Saldo disponible"
        saldoDescriptionLabel.font = UIFont.systemFont(ofSize: 16)
        saldoDescriptionLabel.textColor = .lightGray
        saldoDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(saldoDescriptionLabel)

        // Contenedor para el número de cuenta
        let cuentaContainerView = UIView()
        cuentaContainerView.backgroundColor = UIColor(white: 0.95, alpha: 1) // Fondo gris claro
        cuentaContainerView.layer.cornerRadius = 12
        cuentaContainerView.layer.masksToBounds = true
        cuentaContainerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cuentaContainerView)

        let numeroCuentaLabel = UILabel()
        numeroCuentaLabel.text = "Número de cuenta: \(numeroCuenta)"
        numeroCuentaLabel.font = UIFont.systemFont(ofSize: 16)
        numeroCuentaLabel.textColor = .darkGray
        numeroCuentaLabel.translatesAutoresizingMaskIntoConstraints = false
        cuentaContainerView.addSubview(numeroCuentaLabel)

        // Añadimos padding dentro del contenedor
        cuentaContainerView.layoutMargins = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)

        // Constraints
        NSLayoutConstraint.activate([
            // Título centrado en la parte superior
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),

            // Saldo grande en el centro
            saldoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            saldoLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50),

            // Descripción del saldo
            saldoDescriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            saldoDescriptionLabel.topAnchor.constraint(equalTo: saldoLabel.bottomAnchor, constant: 8),

            // Contenedor para el número de cuenta
            cuentaContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cuentaContainerView.topAnchor.constraint(equalTo: saldoDescriptionLabel.bottomAnchor, constant: 40),
            cuentaContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            cuentaContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            cuentaContainerView.heightAnchor.constraint(equalToConstant: 60),

            // Número de cuenta dentro del contenedor con más espacio
            numeroCuentaLabel.leadingAnchor.constraint(equalTo: cuentaContainerView.layoutMarginsGuide.leadingAnchor),
            numeroCuentaLabel.trailingAnchor.constraint(equalTo: cuentaContainerView.layoutMarginsGuide.trailingAnchor),
            numeroCuentaLabel.topAnchor.constraint(equalTo: cuentaContainerView.layoutMarginsGuide.topAnchor),
            numeroCuentaLabel.bottomAnchor.constraint(equalTo: cuentaContainerView.layoutMarginsGuide.bottomAnchor)
        ])
    }
}
