//
//  LeaderboardViewController.swift
//  entrenate v2
//
//  Created by Nadia Garcia on 28/05/21.
//

import UIKit

class LeaderboardViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    struct LeaderboardCells {
        let user: String
        let points: Int
    }
    
    var userData = [LeaderboardCells(user: "PedroA" , points: 125), LeaderboardCells(user: "UrsulaC" , points: 400), LeaderboardCells(user: "JaimeL" , points: 340), LeaderboardCells(user: "EstherA" , points: 235)  ]
    
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "leaderboard")
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 1, bottom: 0, right: 1)
        tableView.frame = view.bounds
        tableView.delegate = self
        tableView.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "leaderboard", for: indexPath)
        cell.textLabel?.text = userData[indexPath.row].user
        cell.backgroundColor = UIColor(red: 0, green: 0.50, blue: 0.22, alpha: 1)
        

        
        switch(indexPath.row){
        case 0:
            cell.imageView?.image = UIImage(named: "1st")
        case 1:
            cell.imageView?.image = UIImage(named: "2nd")
        case 2:
            cell.imageView?.image = UIImage(named: "3rd")
        default:
            cell.imageView?.image = UIImage(named: "4th+")
            
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
