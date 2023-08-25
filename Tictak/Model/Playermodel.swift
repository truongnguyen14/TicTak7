/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 2
  Author: Nguyen Tan Truong(e.g. Nguyen Van Minh)
  ID: s3754703 (e.g. 1234567)
  Created  date: 29/08/2023 (e.g. 31/07/2023)
  Last modified: 06/09/2023 (e.g. 05/08/2023)
  Acknowledgement:
 1. https://serialcoder.dev/text-tutorials/swiftui/using-the-appstorage-property-wrapper-in-swiftui/
 2. https://cocoacasts.com/ud-3-how-to-store-an-array-in-user-defaults-in-swift
 3. https://www.hackingwithswift.com/books/ios-swiftui/storing-user-settings-with-userdefaults
*/
//
//  Usermodel.swift
//  TicTak
//
//  Created by Truong, Nguyen Tan on 29/08/2023.
//

import Foundation

struct Playermodel {
    private(set) var players: [String]
    private(set) var scores: [Int]
    
    private let database = UserDefaults.standard
    
    //Initialize and store the data in userdefaults
    init() {
        players = database.object(forKey: "Player") as? [String] ?? []
        scores = database.object(forKey: "Score") as? [Int] ?? []
    }
    
    //Get players
    func getPlayers() -> [String] {
        return players
    }
    
    //Get scores
    func getScores() -> [Int] {
        return scores
    }
    
    //Add player into the array
    mutating func addPlayer(info: String) {
        players.append(info)
        database.set(players, forKey: "Player")
        print(players)
    }
    
    //Add score into the array
    mutating func addScore(score: Int) {
        scores.append(score)
        database.set(scores, forKey: "Score")
        print(scores)
    }
    
    //Get the score from a specific player
    func getScore(name: String) -> Int {
        let index = players.firstIndex(of: name) ?? 0
        return scores[index]
    }
    
    //Update score along side when player is playing
    mutating func updateLastScore(score: Int) {
        let idex = players.count - 1
        self.scores[idex] = score
        database.set(self.scores, forKey: "Score")
    }
}
