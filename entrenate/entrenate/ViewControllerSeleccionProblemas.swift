//
//  ViewControllerSeleccionProblemas.swift
//  entrenate
//
//  Created by user186524 on 5/16/21.
//

import UIKit

class ViewControllerSeleccionProblemas: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var lbTimeSelected: UILabel!
    var timeSet : Int!
    
    var listaTemas = [
        TipoDeProblema(tema: "Teoría de Números"),
        TipoDeProblema(tema: "Geometría"),
        TipoDeProblema(tema: "Álgebra"),
        TipoDeProblema(tema: "Combinatorio"),
        TipoDeProblema(tema: "Bonus"),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lbTimeSelected.text = String(timeSet) + " min"
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewProblema = segue.destination as! ViewControllerProblemaActivo
        viewProblema.totalTime = timeSet * 60
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaTemas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath)
        cell.textLabel?.text = listaTemas[indexPath.row].tema
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCell.AccessoryType.checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.none
        }
        else {
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.checkmark
        }
    }
    
    @IBAction func unwindToFirstViewController(_ sender: UIStoryboardSegue) {
         // No code needed, no need to connect the IBAction explicitely
        }

}
