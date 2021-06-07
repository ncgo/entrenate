//
//  LeaderboardViewController.swift
//  entrenate v2
//
//  Created by Nadia Garcia on 28/05/21.
//

import UIKit

class LeaderboardViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let defaults = UserDefaults.standard
    
    struct LeaderboardCells {
        let user: String
        let points: Int
    }
    

    
    var userData = [LeaderboardCells(user: "PedroA" , points: 125), LeaderboardCells(user: "UrsulaC" , points: 400), LeaderboardCells(user: "JaimeL" , points: 340), LeaderboardCells(user: "EstherA" , points: 235), LeaderboardCells(user: "ItziarI" , points: 25), LeaderboardCells(user: "MiguelH" , points: 800)]
    
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(LeaderboardTableViewCell.self, forCellReuseIdentifier: LeaderboardTableViewCell.identifier)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 1, bottom: 0, right: 1)
        tableView.frame = view.bounds
        tableView.backgroundColor = UIColor(red: 0, green: 0.50, blue: 0.22, alpha: 1)
        tableView.delegate = self
        tableView.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userData.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LeaderboardTableViewCell.identifier, for: indexPath) as? LeaderboardTableViewCell

        var sUsername: String!
        var iPoints: Int!
        var placeImg: String!
        
        if let puntos = defaults.string(forKey: "PuntosAcumulados") {
            iPoints = Int(puntos)!
        }
        
        if let username = defaults.string(forKey: "Username") {
            sUsername = username
        }
        
        let newElem = LeaderboardCells(user: sUsername, points: iPoints)
        
        userData.append(newElem)

        
        switch(indexPath.row){
        case 0:
            placeImg = "1st"
        case 1:
            placeImg = "2nd"
        case 2:
            placeImg = "3rd"
        default:
            placeImg = "4th+"
        }
        
        let sortedPoints = userData.sorted {
            $0.points > $1.points
        }
        
        cell?.configure(imgName: placeImg, lbPointsText: String(sortedPoints[indexPath.row].points), lbUserText: sortedPoints[indexPath.row].user)

            return cell!
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
