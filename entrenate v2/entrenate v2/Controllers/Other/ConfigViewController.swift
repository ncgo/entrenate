//
//  ConfigViewController.swift
//  entrenate v2
//
//  Created by Nadia Garcia on 28/05/21.
//

import UIKit
import SafariServices

struct SettingsCellModel {
    let title: String
    let handler: (() -> Void)
}

/// View controller to show user settings
final class ConfigViewController: UIViewController {

    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    private var data = [[SettingsCellModel]]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureModels()
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    private func configureModels() {
        data.append([
            SettingsCellModel(title: "Editar Perfil") { [weak self] in
                self?.didTapEditProfile()
            },
            SettingsCellModel(title: "Invitar Amigos") { [weak self] in
                self?.didTapInviteFriends()
            }
        ])
        
        data.append([
            SettingsCellModel(title: "Accesibilidad") { [weak self] in
                self?.didTapAccessibility()
            },
            SettingsCellModel(title: "Ayuda y Feedback") { [weak self] in
                self?.openURL(type: .help)
            }
        ])
        
        data.append([
            SettingsCellModel(title: "Créditos") {[weak self] in
                self?.didTapCredits()
            },
            SettingsCellModel(title: "Acerca de la Olimpiada") { [weak self] in
                self?.openURL(type: .about)
            },
            SettingsCellModel(title: "Califica la App") { [weak self] in
                // self?.didTapRate()
            },
            SettingsCellModel(title: "Términos y Condiciones") { [weak self] in
                self?.openURL(type: .terms)
            },
            SettingsCellModel(title: "Política de Privacidad") { [weak self] in
                self?.openURL(type: .privacy)
            }
        ])
        
        data.append([
            SettingsCellModel(title: "Cerrar Sesión") {[weak self] in self?.didTapLogOut()}
        ])
    }
    
    enum SettingsURLType {
        case terms, privacy, help, about
    }
    
    private func openURL(type: SettingsURLType) {
        let urlString: String
        switch type {
        case .terms: urlString = "https://www.facebook.com/ommch"
        case .privacy: urlString = "https://www.facebook.com/ommch"
        case .help: urlString = "https://www.facebook.com/ommch"
        case .about: urlString = "https://www.facebook.com/ommch"
        }
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
    }
    
    private func didTapCredits() {
        let vc = CreditsViewController()
        vc.title = "Créditos"
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func didTapEditProfile() {
        let vc = EditProfileViewController()
        vc.title = "Editar Perfil"
        present(UINavigationController(rootViewController: vc), animated: true)
    }
    
    private func didTapInviteFriends() {
        // Show share sheet to invite friends
    }
    
    private func didTapAccessibility() {
        let vc = AccessibilityViewController()
        vc.title = "Accesibilidad"
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func didTapLogOut() {
        let actionSheet = UIAlertController(title: "Salir", message: "¿Estás seguro de que quieres salir?", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
        actionSheet.addAction(UIAlertAction(title: "Salir", style: .destructive, handler: { _ in
            AuthManager.shared.logOut(completion: { success in
                DispatchQueue.main.async {
                    if success {
                        // Present LogIn
                        let loginVC = LoginViewController()
                        loginVC.modalPresentationStyle = .fullScreen
                        self.present(loginVC, animated: true) {
                            self.navigationController?.popToRootViewController(animated: false)
                            self.tabBarController?.selectedIndex = 0
                        }
                        
                        
                    } else {
                        // Error occurred
                        fatalError("No se pudo salir al cerrar sesión")
                    }
                }
            })
        }))
        actionSheet.popoverPresentationController?.sourceView = tableView
        actionSheet.popoverPresentationController?.sourceRect = tableView.bounds
        present(actionSheet, animated: true)
    }
}

extension ConfigViewController:  UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.section][indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        data[indexPath.section][indexPath.row].handler()
    }
}
