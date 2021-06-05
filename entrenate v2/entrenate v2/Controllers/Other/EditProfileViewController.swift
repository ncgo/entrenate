//
//  EditProfileViewController.swift
//  entrenate v2
//
//  Created by Nadia Garcia on 05/06/21.
//

import UIKit

class EditProfileViewController: UIViewController, UITableViewDataSource {
    struct Constantes {
        static let verdeOmmch = UIColor(red: 0, green: 0.50, blue: 0.22, alpha: 1.00)
    }
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Constantes.verdeOmmch
        tableView.tableHeaderView = createTableHeaderView()
        tableView.dataSource = self
        view.addSubview(tableView)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Guardar", style: .done, target: self, action: #selector(didTapSave))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancelar", style: .plain, target: self, action: #selector(didTapCancel))
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    // MARK: - Tableview
    
    private func createTableHeaderView() -> UIView {
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.width, height: view.height/3).integral)
        let size = header.height/1.5
        let profilePhotoButton = UIButton(frame: CGRect(x: (view.width - size)/2, y: (header.height - size)/2, width: size, height: size))
        header.backgroundColor = Constantes.verdeOmmch
        header.addSubview(profilePhotoButton)
        profilePhotoButton.layer.masksToBounds = true
        profilePhotoButton.layer.cornerRadius = size/2
        profilePhotoButton.addTarget(self, action: #selector(didTapProfilePhotoButton), for: .touchUpInside)
        profilePhotoButton.setBackgroundImage(UIImage(named: "pp"), for: .normal)
        profilePhotoButton.layer.borderWidth = 1
        profilePhotoButton.layer.borderColor = Constantes.verdeOmmch.cgColor
        return header
    }
    
    @objc private func didTapProfilePhotoButton() {
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "hello World"
        return cell
    }
    
    // MARK: - Action
    
    @objc private func didTapSave() {
        // Save info to database
        
    }
    
    @objc private func didTapCancel() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func didTapChangeProfilePicture() {
        let actionSheet = UIAlertController(title: "Foto de Perfil", message: "Cambia tu foto de perfil", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Toma una foto", style: .default, handler: { _ in
            
        }))
        actionSheet.addAction(UIAlertAction(title: "Escoge de tu carrete", style: .default, handler: { _ in
            
        }))
        actionSheet.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
        actionSheet.popoverPresentationController?.sourceView = view
        actionSheet.popoverPresentationController?.sourceRect = view.bounds
        present(actionSheet, animated: true)
    }

}
