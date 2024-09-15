import UIKit

class HomeViewController: UIViewController {

    var sideMenuView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)

        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)

        let logoImageView = UIImageView()
        logoImageView.image = UIImage(named: "banorte")
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(logoImageView)

        let titleLabel = UILabel()
        titleLabel.text = "Hola, Jose Antonio"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.textColor = .black
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)

        let cuentaNuLabel = UILabel()
        cuentaNuLabel.text = "Cuenta Banorte"
        cuentaNuLabel.font = UIFont.systemFont(ofSize: 18)
        cuentaNuLabel.textColor = .darkGray
        cuentaNuLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(cuentaNuLabel)

        let saldoLabel = UILabel()
        saldoLabel.text = "$25,250.00"
        saldoLabel.font = UIFont.boldSystemFont(ofSize: 32)
        saldoLabel.textColor = .black
        saldoLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(saldoLabel)

        let recibirButton = UIButton(type: .system)
        recibirButton.setTitle("Recibir", for: .normal)
        recibirButton.setTitleColor(.white, for: .normal)
        recibirButton.backgroundColor = .systemRed
        recibirButton.layer.cornerRadius = 10
        recibirButton.translatesAutoresizingMaskIntoConstraints = false
        recibirButton.addTarget(self, action: #selector(recibirTapped), for: .touchUpInside)
        contentView.addSubview(recibirButton)

        let transferirButton = UIButton(type: .system)
        transferirButton.setTitle("Transferir", for: .normal)
        transferirButton.setTitleColor(.white, for: .normal)
        transferirButton.backgroundColor = .systemRed
        transferirButton.layer.cornerRadius = 10
        transferirButton.translatesAutoresizingMaskIntoConstraints = false
        transferirButton.addTarget(self, action: #selector(transferirTapped), for: .touchUpInside)
        contentView.addSubview(transferirButton)

        let tarjetaLabel = UILabel()
        tarjetaLabel.text = "Tarjeta de débito"
        tarjetaLabel.font = UIFont.systemFont(ofSize: 18)
        tarjetaLabel.textColor = .darkGray
        tarjetaLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(tarjetaLabel)

        let tarjetaImageView = UIImageView()
        tarjetaImageView.image = UIImage(named: "banorte_tarjeta")
        tarjetaImageView.contentMode = .scaleAspectFit
        tarjetaImageView.translatesAutoresizingMaskIntoConstraints = false
        tarjetaImageView.isUserInteractionEnabled = true
        contentView.addSubview(tarjetaImageView)

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tarjetaTapped))
        tarjetaImageView.addGestureRecognizer(tapGesture)

        let tarjetaCreditoLabel = UILabel()
        tarjetaCreditoLabel.text = "Tarjeta de crédito"
        tarjetaCreditoLabel.font = UIFont.systemFont(ofSize: 18)
        tarjetaCreditoLabel.textColor = .darkGray
        tarjetaCreditoLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(tarjetaCreditoLabel)

        let tarjetaCreditoImageView = UIImageView()
        tarjetaCreditoImageView.image = UIImage(named: "tar")
        tarjetaCreditoImageView.contentMode = .scaleAspectFit
        tarjetaCreditoImageView.translatesAutoresizingMaskIntoConstraints = false
        tarjetaCreditoImageView.isUserInteractionEnabled = true
        contentView.addSubview(tarjetaCreditoImageView)

        let tapCreditoGesture = UITapGestureRecognizer(target: self, action: #selector(tarjetaCreditoTapped))
        tarjetaCreditoImageView.addGestureRecognizer(tapCreditoGesture)

        let menuButton = UIButton(type: .system)
        menuButton.setTitle("☰", for: .normal)
        menuButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        menuButton.setTitleColor(.black, for: .normal)
        menuButton.translatesAutoresizingMaskIntoConstraints = false
        menuButton.addTarget(self, action: #selector(toggleMenu), for: .touchUpInside)
        view.addSubview(menuButton)

        setupSideMenu()

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),

            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

            logoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            logoImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 100),
            logoImageView.heightAnchor.constraint(equalToConstant: 40),

            titleLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),

            cuentaNuLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40),
            cuentaNuLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),

            saldoLabel.topAnchor.constraint(equalTo: cuentaNuLabel.bottomAnchor, constant: 10),
            saldoLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),

            recibirButton.topAnchor.constraint(equalTo: saldoLabel.bottomAnchor, constant: 20),
            recibirButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: -70),
            recibirButton.widthAnchor.constraint(equalToConstant: 120),
            recibirButton.heightAnchor.constraint(equalToConstant: 50),

            transferirButton.topAnchor.constraint(equalTo: saldoLabel.bottomAnchor, constant: 20),
            transferirButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 70),
            transferirButton.widthAnchor.constraint(equalToConstant: 120),
            transferirButton.heightAnchor.constraint(equalToConstant: 50),

            tarjetaLabel.topAnchor.constraint(equalTo: recibirButton.bottomAnchor, constant: 40),
            tarjetaLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),

            tarjetaImageView.topAnchor.constraint(equalTo: tarjetaLabel.bottomAnchor, constant: 10),
            tarjetaImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            tarjetaImageView.widthAnchor.constraint(equalToConstant: 300),
            tarjetaImageView.heightAnchor.constraint(equalToConstant: 200),

            tarjetaCreditoLabel.topAnchor.constraint(equalTo: tarjetaImageView.bottomAnchor, constant: 40),
            tarjetaCreditoLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),

            tarjetaCreditoImageView.topAnchor.constraint(equalTo: tarjetaCreditoLabel.bottomAnchor, constant: 10),
            tarjetaCreditoImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            tarjetaCreditoImageView.widthAnchor.constraint(equalToConstant: 300),
            tarjetaCreditoImageView.heightAnchor.constraint(equalToConstant: 200),
            tarjetaCreditoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),

            menuButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            menuButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }

    func setupSideMenu() {
        sideMenuView = UIView()
        sideMenuView.backgroundColor = .red
        sideMenuView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(sideMenuView)

        let EndButton = UIButton(type: .system)
        EndButton.setTitle("Cerrar Sesion", for: .normal)
        EndButton.translatesAutoresizingMaskIntoConstraints = false
        EndButton.addTarget(self, action: #selector(goToLogIn), for: .touchUpInside)
        sideMenuView.addSubview(EndButton)

        let HomeButton = UIButton(type: .system)
        HomeButton.setTitle("Inicio", for: .normal)
        HomeButton.translatesAutoresizingMaskIntoConstraints = false
        HomeButton.addTarget(self, action: #selector(goToHome), for: .touchUpInside)
        sideMenuView.addSubview(HomeButton)

        let profileButton = UIButton(type: .system)
        profileButton.setTitle("Estado de cuenta", for: .normal)
        profileButton.translatesAutoresizingMaskIntoConstraints = false
        profileButton.addTarget(self, action: #selector(goToProfile), for: .touchUpInside)
        sideMenuView.addSubview(profileButton)

        NSLayoutConstraint.activate([
            sideMenuView.topAnchor.constraint(equalTo: view.topAnchor),
            sideMenuView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            sideMenuView.leadingAnchor.constraint(equalTo: view.trailingAnchor), // Sidebar initially off-screen
            sideMenuView.widthAnchor.constraint(equalToConstant: 250),

            HomeButton.topAnchor.constraint(equalTo: sideMenuView.topAnchor, constant: 100),
            HomeButton.centerXAnchor.constraint(equalTo: sideMenuView.centerXAnchor),

            profileButton.topAnchor.constraint(equalTo: HomeButton.bottomAnchor, constant: 20),
            profileButton.centerXAnchor.constraint(equalTo: sideMenuView.centerXAnchor),

            EndButton.topAnchor.constraint(equalTo: profileButton.bottomAnchor, constant: 20),
            EndButton.centerXAnchor.constraint(equalTo: sideMenuView.centerXAnchor)
        ])
    }

    @objc func toggleMenu() {
        let isMenuOpen = sideMenuView.frame.origin.x < view.frame.width

        UIView.animate(withDuration: 0.3) {
            self.sideMenuView.frame.origin.x = isMenuOpen ? self.view.frame.width : self.view.frame.width - 250
        }
    }

    @objc func goToLogIn() {
        navigationController?.popToRootViewController(animated: true)
    }

    @objc func goToHome() {
        let homeViewController = HomeViewController()
        navigationController?.pushViewController(homeViewController, animated: true)
    }

    @objc func goToProfile() {
        print("Navegar a Perfil")
    }

    @objc func tarjetaTapped() {
        let tarjetaDetailViewController = TarjetaDetailViewController()
        navigationController?.pushViewController(tarjetaDetailViewController, animated: true)
    }

    @objc func tarjetaCreditoTapped() {
        let tarjetaCreditoDetailViewController = TarjetaCreditoDetailViewController()
        navigationController?.pushViewController(tarjetaCreditoDetailViewController, animated: true)
    }

    @objc func transferirTapped() {
        let transferViewController = TransferViewController()
        navigationController?.pushViewController(transferViewController, animated: true)
    }

    @objc func recibirTapped() {
        let recibirViewController = RecibirViewController()
        navigationController?.pushViewController(recibirViewController, animated: true)
    }
}
