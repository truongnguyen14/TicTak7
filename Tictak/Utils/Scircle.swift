/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 2
  Author: Nguyen Tan Truong(e.g. Nguyen Van Minh)
  ID: s3754703 (e.g. 1234567)
  Created  date: 06/09/2023 (e.g. 31/07/2023)
  Last modified: 06/09/2023 (e.g. 05/08/2023)
  Acknowledgement:
*/
//
//  Scircle.swift
//  TicTak
//
//  Created by Truong, Nguyen Tan on 06/09/2023.
//

import SwiftUI

struct Scircle: View {
    @Binding var Marks: String
    @State private var degrees = 0.0
    
    var body: some View {
        ZStack {
            //circle outside
            Circle()
                .frame(width: 65, height: 65)
                .foregroundColor(Colorconstant.bronzegold)
            //circle inside
            Circle()
                .frame(width: 50, height: 50)
                .foregroundColor(Colorconstant.casinogreen)
            //marks
            Text(Marks)
                .font(.system(size: 30))
                .foregroundColor(.white)
                .bold()
        }
        .aspectRatio(contentMode: ContentMode.fit)
        //animation
        .rotation3DEffect(.degrees(degrees), axis: (x: 0, y: 0, z: 1))
        .simultaneousGesture(
            TapGesture()
                .onEnded { _ in
                    withAnimation(.easeIn(duration: 0.4)) {
                        self.degrees += 180
                        self.degrees += 180
                    }
                }
        )
    }
}

struct Scircle_Previews: PreviewProvider {
    static var previews: some View {
        Scircle(Marks: .constant("X"))
    }
}
