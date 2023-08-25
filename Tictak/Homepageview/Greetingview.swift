/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 2
  Author: Nguyen Tan Truong(e.g. Nguyen Van Minh)
  ID: s3754703 (e.g. 1234567)
  Created  date: 31/08/2023 (e.g. 31/07/2023)
  Last modified: 06/09/2023 (e.g. 05/08/2023)
  Acknowledgement:
*/
//
//  Greetingview.swift
//  TicTak
//
//  Created by Truong, Nguyen Tan on 31/08/2023.
//

import SwiftUI

struct Greetingview: View {
    @Binding var active: Bool
    @State var popup = false

    var body: some View {
        ZStack{
            Backgroundcolor()
            
            VStack(spacing: 20){
                Spacer()
                VStack(spacing: 0) {
                    Text("TicTak")     //Hello app text
                        .font(.system(size: 50))
                        .fontWeight(.heavy)
                        .foregroundColor(Colorconstant.bronzegold)
                        .modifier(Shadow())
                }
                .padding(.bottom, 10)
                
                    Text("X O")
                        .frame(width: 600)
                        .font(.system(size: 80))
                        .fontWeight(.heavy)
                        .foregroundColor(Colorconstant.bronzegold)
                        .modifier(Shadow())
                        .padding(.top, 20)
                       
                Spacer()
                
                //Enter button
                Button(action: {
                    active = false
                    playSound(sound: "buttonclick", type: "mp3")
                }, label: {
                    Text("Play game")
                        .font(.system(size: 25))
                        .modifier(Buttonwelcome(width: 240, height: 70, color: Color("Bronzegold")))
                        .modifier(Shadow())
                        
                })
                .padding(.bottom, 20)
                
                //Popup button
                Button(action: {
                    popup = true
                    playSound(sound: "buttonclick", type: "mp3")
                })
                {Image(systemName: "info.circle")
                        .foregroundColor(Colorconstant.bronzegold)
                        .padding(.leading, 290)
                        .font(.system(size: 28))
                        .fontWeight(.medium)
                    
                }
                .alert(isPresented:$popup) {
                    Alert(
                        title: Text("App author"),      //Author information
                        message: Text("""
                                      Name: Nguyen Tan Truong
                                      Student ID: s3754703
                                      Program: BP162
                                      """)
                    )
                }
            }
        }
        .onAppear{
            Backgroundmusic.shared.StartBackgroundMusic(backgroundmusicname: "maintheme")
        }
    }
}

struct Greetingview_Previews: PreviewProvider {
    static var previews: some View {
        Greetingview(active: .constant(true))
    }
}
