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
//  Menubackgroundcolor.swift
//  Tictac
//
//  Created by Truong, Nguyen Tan on 28/08/2023.
//

import SwiftUI

struct Menubackgroundcolor: View {
    var body: some View {
        
        //background color
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color("Brightpurple"), Color("Yellow"),Color("RmitRed")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
        }
    }
}

struct Menubackgroundcolor_Previews: PreviewProvider {
    static var previews: some View {
        Menubackgroundcolor()
    }
}
