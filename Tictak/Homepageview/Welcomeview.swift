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
//  Welcomeview.swift
//  TicTak
//
//  Created by Truong, Nguyen Tan on 31/08/2023.
//

import SwiftUI

struct Welcomeview: View {
    @State var isWelcomeActive: Bool = true
    var body: some View {
        ZStack {
            if isWelcomeActive {
                Greetingview(active: $isWelcomeActive)
            } else {
                Homeview()
            }
        }
    }
}

struct Welcomeview_Previews: PreviewProvider {
    static var previews: some View {
        Welcomeview()
    }
}
