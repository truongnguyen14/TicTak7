/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 2
  Author: Nguyen Tan Truong(e.g. Nguyen Van Minh)
  ID: s3754703 (e.g. 1234567)
  Created  date: 26/08/2023 (e.g. 31/07/2023)
  Last modified: 06/09/2023 (e.g. 05/08/2023)
  Acknowledgement:
*/
//
//  Homeview.swift
//  Tictac
//
//  Created by Truong, Nguyen Tan on 26/08/2023.
//

import SwiftUI

struct Homeview: View {
    
    @State private var showinghowtoplayview = false
    @AppStorage("isDarkMode") private var Darkmode: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Menubackgroundcolor()
                VStack {
                    VStack{
                        Spacer()
                        Text("Choose your levels")
                            .foregroundColor(.white)
                            .font(.system(size: 30,weight: .bold))
                        NavigationLink{
                            Map1()
                                .onAppear(perform: {playSound(sound: "buttonclick", type: "mp3")})
                        }label: {
                            Text("Easy")
                                .padding()
                        }
                        .modifier(Buttonmodifier())
                        .padding()
                        
                        NavigationLink{
                            Map2()
                                .onAppear(perform: {playSound(sound: "buttonclick", type: "mp3")})
                        }label: {
                            Text("Medium")
                                .padding()
                        }
                        .modifier(Buttonmodifier())
                        .padding()
                        
                        NavigationLink{
                            Map3()
                                .onAppear(perform: {playSound(sound: "buttonclick", type: "mp3")})
                        }label: {
                            Text("Hard")
                                .padding()
                        }
                        .modifier(Buttonmodifier())
                        .padding()
                    }
                    .padding(.bottom, 35)
                    
                    Spacer()
                    
                    VStack(alignment: .center){
                        NavigationLink{
                            Setting()
                                .onAppear(perform: {playSound(sound: "buttonclick", type: "mp3")})
                        }label: {
                            Text("Setting")
                                .padding(15)
                        }
                        .modifier(Buttonfunction(color: Color("Blue")))
                        .modifier(Shadow())
                        .padding(.bottom, 10)
                        .padding()
                    }
                    
                    Spacer()
                    
                    NavigationLink{
                        Leaderboard()
                            .onAppear(perform: {playSound(sound: "buttonclick", type: "mp3")})
                    }label: {
                        Text("Leaderboard")
                            .padding(15)
                    }
                    .modifier(Buttonfunction(color: Color("Blue")))
                    .modifier(Shadow())
                }
            }
        }
        .onAppear{
            Backgroundmusic.shared.StopBackgroundMusic()
            Backgroundmusic.shared.StartBackgroundMusic(backgroundmusicname: "strangerthings")
        }
        .environment(\.colorScheme, Darkmode ? .dark : .light)
    }
}

struct Homeview_Previews: PreviewProvider {
    static var previews: some View {
        Homeview()
    }
}
