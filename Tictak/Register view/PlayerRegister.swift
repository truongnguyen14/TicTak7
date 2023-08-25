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
*/
//
//  UserRegisterview.swift
//  TicTak
//
//  Created by Truong, Nguyen Tan on 29/08/2023.
//

import SwiftUI

struct PlayerRegister: View {
    
    //declare variable
    @Binding var name: String
    @State private var empty = false
    @ObservedObject var Playermodel: Playerviewmodel = Playerviewmodel()
    @Binding var registerButton: Bool
    @Binding var PopUp: Bool
    
    var body: some View {
        //Show when user access to game view
        if !PopUp {
            ZStack {
                //background color opacity
                Color.black.opacity(0.8).edgesIgnoringSafeArea(.all)
                ZStack {
                    Color("Casinogreen")
                    VStack{
                        Text("Enter your name")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                        HStack {
                            Text("Player name: ")
                                .foregroundColor(.white)
                                .bold()
                            TextField(
                                "Enter your name here",
                                text: $name
                            )
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .cornerRadius(15)
                        }
                        Spacer()
                        //Condition to check player register name
                        if(empty) {
                            Text("Please enter your name")
                                .foregroundColor(Color("Red"))
                        } else {}
                        Button {
                            //Check empty name
                             if (name == "") {
                                empty = true;
                            }
                            else {
                                registerButton = true
                                empty = false
                                PopUp = true
                                Playermodel.addPlayer(info: name)
                            }
                        } label: {
                            Text("Play game")
                                .padding(5)
                        }
                        .modifier(Buttonfunction(color: Color("Bronzegold")))
                        .modifier(Shadow())
                    }
                    .padding()
                }
                .frame(width: 340, height: 190)
                .cornerRadius(20)
            }
        }
    }
}

struct UserRegister_Previews: PreviewProvider {
    static var previews: some View {
        @ObservedObject var playermodel: Playerviewmodel = Playerviewmodel()
        @State var name = ""
        @State var popup = false
        @State var registerbutton: Bool = false
        
        PlayerRegister(name: $name, Playermodel: playermodel, registerButton: $registerbutton, PopUp: $popup)
    }
}
