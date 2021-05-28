//
//  Leaderboard.swift
//  entrenate
//
//  Created by user189912 on 5/28/21.
//

import UIKit

class Leaderboard: UITableViewController {

    var listaUsuarios = [usersLeaderboard(username: "Nadia García", ciudad: "Ciudad Juarez", imagenPerfil: UIImage(named: "3")),
        usersLeaderboard(username: "Sergio Tapia", ciudad: "Tijuana", imagenPerfil: UIImage(named: "2")),
        usersLeaderboard(username: "Mauricio Ruffo", ciudad: "Ensenada", imagenPerfil: UIImage(named: "3")),
        usersLeaderboard(username: "Katia García", ciudad: "Ciudad Juarez", imagenPerfil: UIImage(named: "2")),
        usersLeaderboard(username: "Yolanda Martínez", ciudad: "Monterrey", imagenPerfil: UIImage(named: "3")),
        usersLeaderboard(username: "Andrés López", ciudad: "Villahermosa", imagenPerfil: UIImage(named: "2")),
        usersLeaderboard(username: "Eduardo Acosta", ciudad: "Morelia", imagenPerfil: UIImage(named: "3")),
        usersLeaderboard(username: "Karla Padilla", ciudad: "Pachuca", imagenPerfil: UIImage(named: "2")),
        usersLeaderboard(username: "Raúl Pérez", ciudad: "León", imagenPerfil: UIImage(named: "3"))
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        title = "LEADERBOARD"
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listaUsuarios.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celdaLider", for: indexPath) as! TableViewCellLeaderboard

        cell.lbUserName.text = listaUsuarios[indexPath.row].username
        cell.lbCity.text = listaUsuarios[indexPath.row].ciudad
        cell.imgUser.image = listaUsuarios[indexPath.row].imagenPerfil

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
