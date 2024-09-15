import UIKit

class TransferViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Configurar la vista
        view.backgroundColor = .white
        title = "Transferir Dinero"

        // Título principal
        let titleLabel = UILabel()
        titleLabel.text = "¿A quién le quieres transferir dinero?"
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        titleLabel.textColor = .black
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)

        // Botón de "Agregar contacto" usando UIButton.Configuration
        let agregarContactoButton = UIButton(type: .system)
        var config = UIButton.Configuration.plain()
        config.title = "Agregar contacto"
        config.image = UIImage(systemName: "plus.circle.fill")
        config.imagePadding = 8 // Espacio entre la imagen y el título
        config.baseForegroundColor = .systemRed
        agregarContactoButton.configuration = config
        agregarContactoButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(agregarContactoButton)

        // Icono de contacto (letra)
        let contactImageView = UIImageView()
        contactImageView.backgroundColor = UIColor(white: 0.9, alpha: 1) // Gris claro
        contactImageView.layer.cornerRadius = 25
        contactImageView.clipsToBounds = true
        contactImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(contactImageView)

        let contactLabel = UILabel()
        contactLabel.text = "J"
        contactLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        contactLabel.textColor = .darkGray
        contactLabel.translatesAutoresizingMaskIntoConstraints = false
        contactImageView.addSubview(contactLabel)

        // Nombre del contacto
        let nameLabel = UILabel()
        nameLabel.text = "jon jr"
        nameLabel.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameLabel)

        // Información del banco y la CLABE truncada
        let bankInfoLabel = UILabel()
        bankInfoLabel.text = "HSBC — CLABE ----5863"
        bankInfoLabel.font = UIFont.systemFont(ofSize: 16, weight: .light)
        bankInfoLabel.textColor = .gray
        bankInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bankInfoLabel)

        // Constraints
        NSLayoutConstraint.activate([
            // Título
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            // Botón "Agregar contacto"
            agregarContactoButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            agregarContactoButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),

            // Icono del contacto (J)
            contactImageView.topAnchor.constraint(equalTo: agregarContactoButton.bottomAnchor, constant: 30),
            contactImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            contactImageView.widthAnchor.constraint(equalToConstant: 50),
            contactImageView.heightAnchor.constraint(equalToConstant: 50),

            // Inicial en el icono
            contactLabel.centerXAnchor.constraint(equalTo: contactImageView.centerXAnchor),
            contactLabel.centerYAnchor.constraint(equalTo: contactImageView.centerYAnchor),

            // Nombre del contacto
            nameLabel.leadingAnchor.constraint(equalTo: contactImageView.trailingAnchor, constant: 20),
            nameLabel.topAnchor.constraint(equalTo: contactImageView.topAnchor),

            // Información del banco
            bankInfoLabel.leadingAnchor.constraint(equalTo: contactImageView.trailingAnchor, constant: 20),
            bankInfoLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5)
        ])
    }
}
