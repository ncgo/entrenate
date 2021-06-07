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
        table.register(LeaderboardTableViewCell.self, forCellReuseIdentifier: LeaderboardTableViewCell.identifier)
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
        let cell = tableView.dequeueReusableCell(withIdentifier: LeaderboardTableViewCell.identifier, for: indexPath) as? LeaderboardTableViewCell

        var placeImg: String
        
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
        cell?.configure(imgName: placeImg, lbPointsText: String(userData[indexPath.row].points), lbUserText: userData[indexPath.row].user )

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
