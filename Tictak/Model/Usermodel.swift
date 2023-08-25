//
//  Usermodel.swift
//  TicTak
//
//  Created by Truong, Nguyen Tan on 29/08/2023.
//

import Foundation

struct Playermodel {
    private(set) var player: [String]
    private(set) var scores: [Int]
    
    private let database = UserDefaults.standard
    
    //Initialize and store the data in userdefaults
    init() {
        player = database.object(forKey: "Player") as? [String] ?? []
        scores = database.object(forKey: "Score") as? [Int] ?? []
    }
    
    //Get users
    func getPlayers() -> [String] {
        return player
    }
    
    //Get points
    func getScores() -> [Int] {
        return scores
    }
    
    //Add user into the array
    mutating func addPlayer(info: String) {
        player.append(info)
        database.set(player, forKey: "Player")
        print(player)
    }
    
    //Add point into the array
    mutating func addScore(score: Int) {
        scores.append(score)
        database.set(scores, forKey: "Score")
        print(scores)
    }
    
    //Get the point from a specific user
    func getScore(name: String) -> Int {
        let index = player.firstIndex(of: name) ?? 0
        return scores[index]
    }
    
    //Update point along side when user is playing
    mutating func updateLastScore(score: Int) {
        let idx = player.count - 1
        self.scores[idx] = score
        database.set(self.scores, forKey: "Score")
    }
}
