/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 2
  Author: Nguyen Tan Truong(e.g. Nguyen Van Minh)
  ID: s3754703 (e.g. 1234567)
  Created  date: 30/08/2023 (e.g. 30/08/2023)
  Last modified: 06/09/2023 (e.g. 06/09/2023)
  Acknowledgement:
*/
//
//  Leaderboard.swift
//  TicTak
//
//  Created by Truong, Nguyen Tan on 30/08/2023.
//

import SwiftUI

struct Leaderboard: View {
    
    @ObservedObject private var playermodel: Playerviewmodel = Playerviewmodel()
    
    var body: some View {
        let score = playermodel.getScores()
        let player = playermodel.getPlayers()
        ZStack{
            Color("Casinogreen").ignoresSafeArea(.all)
            Group {
                //Condition to check if the score and the player is equal. If equal, display both on the screen
                if player.count > 0 && score.count > 0 && score.count == player.count {
                    ScrollView {
                        VStack {
                            //Loop to get player name and score
                            ForEach(playermodel.getPlayers().indices, id: \.self) { index in
                                HStack {
                                    Text(player[index])
                                    Spacer()
                                    Text("\(score[index])")
                                }
                                .padding()
                                .frame(maxWidth: .infinity, maxHeight: 200)
                                .foregroundColor(.white)
                                Divider()
                                    .background(Color(.white))
                            }
                        }
                        .background(Color("Woodbrown"))
                        .cornerRadius(15)
                        Spacer()
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding()
                    .ignoresSafeArea(.all, edges: .bottom)
                    .background(Color("Casinogreen")
                        .ignoresSafeArea())
                } else {
                    //if there is no players
                    Text("No players")
                        .foregroundColor(.white)
                }
                
            }
        }
        //start and stop background music
        .onAppear{
            Backgroundmusic.shared.StartBackgroundMusic(backgroundmusicname: "Leaderboard")
        }
        .onDisappear{
            Backgroundmusic.shared.StopBackgroundMusic()
            Backgroundmusic.shared.StartBackgroundMusic(backgroundmusicname: "strangerthings")
        }
        .navigationTitle("Leaderboard")
    }
}

struct Leaderboard_Previews: PreviewProvider {
    static var previews: some View {
        Leaderboard()
    }
}
