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
//  Buttonmodifier.swift
//  Tictac
//
//  Created by Truong, Nguyen Tan on 26/08/2023.
//

import SwiftUI

struct Buttonmodifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(10)
            .frame(width: 150, height: 55)
            .background(LinearGradient(colors: [Color("RmitRed"), Color("Brightpurple")], startPoint: .bottom, endPoint: .top))
            .foregroundColor(.white)
            .fontWeight(.heavy)
            .cornerRadius(15)
    }
}

struct Buttonfunction: ViewModifier {
    var color: Color
    func body(content: Content) -> some View {
        content
            .padding(10)
            .frame(width: 200)
            .background(color)
            .foregroundColor(.white)
            .fontWeight(.heavy)
            .cornerRadius(15)
    }
}

struct Shadow: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color:Color("Shadow"), radius: 5)
    }
}

struct Buttonwelcome: ViewModifier{
    var width: CGFloat
    var height: CGFloat
    var color: Color
    func body(content: Content) -> some View {
        content
            .padding(10)
            .frame(width: width, height: height)
            .background(color)
            .foregroundColor(.white)
            .fontWeight(.heavy)
            .cornerRadius(15)
    }
}
