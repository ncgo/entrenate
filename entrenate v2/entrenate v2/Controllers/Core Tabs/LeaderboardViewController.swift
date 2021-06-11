//
//  LeaderboardViewController.swift
//  entrenate v2
//
//  Created by Nadia Garcia on 28/05/21.
//

import UIKit
import SAConfettiView

class LeaderboardViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let defaults = UserDefaults.standard
    
    
//    DatabaseManager.shared.readUserData(dbKey: )
    
    struct LeaderboardCells {
        let user: String
        let points: Int
    }
    

    
    var userData = [LeaderboardCells(user: "Pedro A" , points: 125), LeaderboardCells(user: "Ursula C" , points: 400), LeaderboardCells(user: "Jaime L" , points: 340), LeaderboardCells(user: "Esther A" , points: 235), LeaderboardCells(user: "Itziar I" , points: 25), LeaderboardCells(user: "Miguel H" , points: 800)]
    
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(LeaderboardTableViewCell.self, forCellReuseIdentifier: LeaderboardTableViewCell.identifier)
        return table
    }()
    
    let confettiView = SAConfettiView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        insertUserToLeaderboard()
        view.addSubview(tableView)
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 1, bottom: 0, right: 1)
        tableView.frame = view.bounds
        tableView.backgroundColor = UIColor(red: 0, green: 0.50, blue: 0.22, alpha: 1)
        tableView.delegate = self
        tableView.dataSource = self
        configConfetti()
        if view.isHidden{
        tableView.reloadData()
        }
        // Do any additional setup after loading the view.
    }
    
    func configConfetti(){
        self.view.addSubview(confettiView)
        confettiView.frame = self.view.bounds
        confettiView.intensity = 0.75
        confettiView.startConfetti()
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: {_ in
            self.confettiView.stopConfetti()
        })
        
        
        Timer.scheduledTimer(withTimeInterval: 4, repeats: false, block: {_ in
            self.confettiView.removeFromSuperview()
        })
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LeaderboardTableViewCell.identifier, for: indexPath) as? LeaderboardTableViewCell

        var placeImg: String!
        
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
        
        userData = userData.sorted {
            $0.points > $1.points
        }
        
        
        cell?.configure(imgName: placeImg, lbPointsText: String(userData[indexPath.row].points), lbUserText: userData[indexPath.row].user)

            return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    
    func insertUserToLeaderboard(){
        var sUsername: String!
        var iPoints: Int!
        
        if let puntos = defaults.string(forKey: "PuntosAcumulados") {
            iPoints = Int(puntos)!
        }
        
        if let username = defaults.string(forKey: "Username") {
            sUsername = username
        } else {
            sUsername = "@Username"
        }
        
        let newElem = LeaderboardCells(user: sUsername, points: iPoints)
        
        userData.append(newElem)
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
