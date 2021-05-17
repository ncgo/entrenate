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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lbTimeSelected.text = String(timeSet) + " min"
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }

}
