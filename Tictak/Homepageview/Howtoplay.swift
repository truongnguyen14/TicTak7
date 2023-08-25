/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 2
  Author: Nguyen Tan Truong(e.g. Nguyen Van Minh)
  ID: s3754703 (e.g. 1234567)
  Created  date: 28/08/2023 (e.g. 31/07/2023)
  Last modified: 06/09/2023 (e.g. 05/08/2023)
  Acknowledgement:
*/
//
//  Howtoplay.swift
//  Tictac
//
//  Created by Truong, Nguyen Tan on 28/08/2023.
//

import SwiftUI

struct Howtoplay: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack{
            Menubackgroundcolor()
            VStack(alignment: .center, spacing: 10) {
                            
              Spacer()
              
              Form {
                Section(header: Text("How To Play")) {
                    Text("The game is played on a grid that's 3 circle by 3 circle or 4 circle by 4 circle depend on player choose the level of the game.")
                    Text("Players are X, the computer is O. Players and computer will take turn to fill the empty circle.")
                    Text("The first side to get n X (n: depend on the winning condition) in row (horizontal, vertical, diagonally) is the winner ")
                    Text("If the computer get 3 O in row first, player will lose the game and minus point.")
                    Text("If the player lose the at the first round or the score under 0, the game will be over.")
                    Text("If the score minus from positive to negative. Players have a chance to increase score to get out negative score. Else the game will be over")
                    Text("When all cicrles are full, the game will clear and the game will continue playing until one of side win the game")
                }
                  Section(header: Text("Condition of increase and decrease score")){
                      Text("Positive score:")
                      HStack{
                          Text("Increase score")
                          Spacer()
                          Text("+ 100")
                      }
                      HStack{
                          Text("Decrease score")
                          Spacer()
                          Text("- 80")
                      }
                      Text("Negative score:")
                      HStack{
                          Text("Increase score")
                          Spacer()
                          Text("+ 10")
                      }
                      HStack{
                          Text("Decrease score")
                          Spacer()
                          Text("= Game Over")
                      }
                  }
                  Section(header: Text("Level information")) {
                      HStack {
                          Text("In each level will have different requirement to win the game: ")
                      }
                      VStack(alignment: .leading){
                          Text("Level: Easy")
                          Spacer()
                          Text("Circles: 3 by 3")
                          Spacer()
                          Text("Winning condition: 3 X in a row")
                          Spacer()
                          Text("Computer moves: 1")
                      }
                      VStack(alignment: .leading){
                          Text("Level: Medium")
                          Spacer()
                          Text("Circles: 4 by 4")
                          Spacer()
                          Text("Winning condition: 4 X in a row")
                          Spacer()
                          Text("Computer moves: 1")
                          Spacer()
                          Text("Level difficulties: The level will increase difficulty when players win a certain round by increasing computer move")
                      }
                      VStack(alignment: .leading){
                          Text("Level: Hard")
                          Spacer()
                          Text("Circles: 8 by 8")
                          Spacer()
                          Text("Winning condition: 8 X in a row")
                          Spacer()
                          Text("Computer moves: 1")
                          Spacer()
                          Text("Level difficulties: The level will increase difficulty when players win a certain round by increasing computer move")
                      }
                }
                  Section(header: Text("Reset button function")){
                      HStack{
                          Text("Reset all:")
                          Spacer()
                          Text("Reset move, score, high score")
                      }
                      HStack{
                          Text("Reset icon")
                          Image(systemName: "arrow.2.circlepath.circle")
                              .foregroundColor(.black)
                              .font(.system(size: 25))
                          Spacer()
                          Text("Reset move, score")
                      }
                  }
                  Section(header: Text("Leaderboard")){
                      Text("Leaderboard will be updated newest information when players exit the app")
                  }
                  Section(header: Text("Game Icon")){
                      HStack{
                          Text("Player:")
                          Spacer()
                          Circles(Marks: .constant("X"))
                      }
                      HStack{
                          Text("Computer:")
                          Spacer()
                          Circles(Marks: .constant("O"))
                      }
                  }
              }
              .font(.system(.body, design: .rounded))
            }
            .padding(.top, 40)
            .overlay(
              Button(action: {
                dismiss()
              }) {
                Image(systemName: "xmark.circle")
                  .font(.title)
              }
              .foregroundColor(.white)
              .padding(.top, 15)
              .padding(.trailing, 20),
              alignment: .topTrailing
              )
        }
        .onAppear{
            SettingBackgroundmusic.shared.StopSettingBackgroundMusic()
            Backgroundmusic.shared.StartBackgroundMusic(backgroundmusicname: "help")
        }
        .onDisappear{
            Backgroundmusic.shared.StopBackgroundMusic()
            SettingBackgroundmusic.shared.StartSettingBackgroundMusic(settingbackgroundmusicname: "minecraft")
        }
    }
}

struct Howtoplay_Previews: PreviewProvider {
    static var previews: some View {
        Howtoplay()
    }
}
