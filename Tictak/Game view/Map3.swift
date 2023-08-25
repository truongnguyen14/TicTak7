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
//  Map3.swift
//  TicTak
//
//  Created by Truong, Nguyen Tan on 06/09/2023.
//

import SwiftUI

struct Map3: View {
    
    //declare variable
    @ObservedObject var Playermodel: Playerviewmodel = Playerviewmodel()
    
    //register
    @State var name = ""
    @State var popup = false
    @State var registerbutton: Bool = false
    
    //available move
    @State private var moves = ["","","","","","","","","","","","","","","","","","","","","","","","",""]
    @State private var title = "TicTaK"
    @State private var gameEnded = false
    @State private var gameOver = false
    private var ranges =  [(0..<5),(5..<10),(10..<15),(15..<20),(20..<25)]
    @State private var highscore = UserDefaults.standard.integer(forKey: "highscore")
    @State private var score = 100
    @State private var basescore = 10
    @State private var minusscore = 80
    @State private var realscore = 0
    
    //column layout
    let columnLayout = Array(repeating: GridItem(.fixed(62), spacing: 15, alignment: .center), count: 5)
    
    //Game view
    var body: some View {
        ZStack {
            Backgroundcolor()
            ScrollView {
                ZStack {
                    VStack {
                            HStack {
                                
                                //title and alert
                                Text(title)
                                    .font(.system(size: 25))
                                    .fontWeight(.heavy)
                                    .foregroundColor(.white)
                                    .alert(title, isPresented: $gameEnded) {
                                        Button("Continue playing", action: continueplay)
                                    }
                            }
                            HStack {
                                
                                //score and high score
                                HStack{
                                    Text("Score: \(realscore)")
                                        .multilineTextAlignment(.center)
                                        .font(.system(size: 25))
                                        .fontWeight(.heavy)
                                        .foregroundColor(.white)
                                        
                                }
                                .frame(width: 100, alignment: .leading)
                                .padding()
                                
                                HStack{
                                    Text("High Score: \(highscore)")
                                        .multilineTextAlignment(.center)
                                        .font(.system(size: 25))
                                        .fontWeight(.heavy)
                                        .foregroundColor(.white)
                                }
                                .frame(width: 100, alignment: .trailing)
                                .padding(.trailing, 10)
                                .padding(.leading, 55)
                            }
                        
                            Spacer()
                        
                            //use loop to generate grid of circles
                                ForEach(ranges, id: \.self) { range in
                                    //use LazyVGrid to get grid of circle fit to the screen
                                    LazyVGrid(columns: columnLayout) {
                                        ForEach(range, id: \.self) { i in
                                            Scircle(Marks: $moves[i])
                                                .simultaneousGesture(
                                                    TapGesture()
                                                        .onEnded { _ in
                                                            print("Move: \(i)")
                                                                PlayerMoves(index: i)
                                                        }
                                                )
                                        }
                                    }
                                }
                                .padding()
                        
                            Spacer()
                        
                        //bottom button
                            HStack{
                                Button("Reset all") {
                                    Resetgame()
                                }
                                .modifier(Buttonfunction(color: Color("Blue")))
                                .modifier(Shadow())
                                .padding()
                                
                                Button(action: {
                                    resetGame()
                                }) {
                                  Image(systemName: "arrow.2.circlepath.circle")
                                    .foregroundColor(.white)
                                    .font(.system(size: 25))
                                }
                                .padding()
                                
                            }
                            .padding(.top, 5)
                    }
                    
                    //game over modal
                    if gameOver{
                        ZStack{
                            Backgroundcolor()
                            VStack{
                                Text("GAME OVER")
                                    .font(.system(.title, design: .rounded))
                                    .fontWeight(.heavy)
                                    .foregroundColor(Colorconstant.red)
                                    .padding()
                                    .frame(minWidth: 280, idealWidth: 280, maxWidth: 320)
                                    .background(Color("RedRMIT"))
                                
                                Spacer()
                                
                                VStack {
                                    Text("You lose")
                                        .font(.system(size: 25, design: .rounded))
                                        .foregroundColor(Colorconstant.red)
                                        .multilineTextAlignment(.center)
                                        .padding()
                                    Button {
                                        self.gameOver = false
                                        self.score = 100
                                        Resetgame()
                                    } label: {
                                        Text("New Game".uppercased())
                                    }
                                    .padding(.vertical,10)
                                    .padding(.horizontal, 20)
                                    .modifier(Buttonfunction(color: Color("Bronzegold"))
                                    )
                                    
                                }
                                Spacer()
                            }
                            .frame(minWidth: 280, idealWidth: 280, maxWidth: 320, minHeight: 280, idealHeight: 300, maxHeight: 350, alignment: .center)
                            .background(Color("Blue"))
                            .cornerRadius(20)
                        }
                    }
                }
            }
            //Background music
            .onAppear{
                Backgroundmusic.shared.StartBackgroundMusic(backgroundmusicname: "gamemusic")
            }
            .onDisappear{
                Backgroundmusic.shared.StopBackgroundMusic()
                Backgroundmusic.shared.StartBackgroundMusic(backgroundmusicname: "strangerthings")
            }
            .navigationTitle(Text("Welcome: \(name)"))
            .navigationBarTitleDisplayMode(.inline)
            .bold()
            PlayerRegister(name: $name, Playermodel: Playermodel, registerButton: $registerbutton, PopUp: $popup)
        }
    }
    
    //Function
    
    //Move
    func PlayerMoves(index: Int) {
        if (moves[index] == "") {   //player move
            moves[index] = "X"
            
            //increasing level difficulties
            if (realscore >= 200 && realscore < 800){
                ComputerMove()
                ComputerMove()
            }
            if (realscore < 200){
                ComputerMove()
            }
            if (realscore >= 800 && realscore < 9999){
                ComputerMove()
                ComputerMove()
                ComputerMove()
            }
        }
        playSound(sound: "pokerchip", type: "mp3")
        for player in ["X", "O"] {  //alert title
            if checkWinner(list: moves, player: player) {
                if (player == "X"){
                    title = "\(name) has won!"
                    gameEnded = true
                    break
                }
                if (player == "O"){
                    title = "\(player) has won"
                    gameEnded = true
                    break
                }
            }
        }
    }
    
    func ComputerMove() {
        var availableMoves: [Int] = []
        var movesLeft = 0
        
        // Check the available moves left
        for move in moves {
            if move == "" {
                availableMoves.append(movesLeft)
            }
            movesLeft += 1
        }
        
        // Make sure there are moves left before bot moves
        if availableMoves.count != 0 {
            moves[availableMoves.randomElement()!] = "O"
        }
        
        //If there are no moves left for bot moves, the game will automatically reset
        if (availableMoves.count == 0){
            //Set delay timer to delay the reset function to prevent reseting the game before the final move from both side
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)){
                Resettemp()
            }
        }
        // Logging
        print(availableMoves)
    }
    
    //game over
    func isGameOver() {
            if (realscore <= 0) {
                // SHOW MODAL MESSAGE OF GAME OVER
                gameOver = true
                playSound(sound: "gameover", type: "mp3")
            }
        }
    
    //High score
    func newHighScore(){
        if (realscore > 0){
            highscore = realscore
            Playermodel.updateScore(score: highscore)
            UserDefaults.standard.set(highscore, forKey: "highscore")
            playSound(sound: "highscore", type: "mp3")
        }
    }
    
    //Calculate score
    func Realscore(){
        realscore = score
    }
    
    func playerLoses() {
        realscore -= minusscore
    }
    
    func playerWins() {
        if (realscore >= 200){
            realscore += basescore * 10
            score += basescore * 10
        }
        if (realscore >= 0 && realscore < 200){
            realscore += basescore * 10
        }
        if (realscore < 0){
            realscore += basescore + 10
        }
        playSound(sound: "winning", type: "mp3")
    }
    
    //Reset function
    func Resettemp(){
        moves = ["","","","","","","","","","","","","","","","","","","","","","","","",""]
        playSound(sound: "allinpushchips", type: "mp3")
    }
    
    func resetGame(){
        title = "TicTaK"
        moves = ["","","","","","","","","","","","","","","","","","","","","","","","",""]
        UserDefaults.standard.set(0, forKey: "highscore")
        score = 100
        realscore = 0
        playSound(sound: "allinpushchips", type: "mp3")
    }
    
    func Resetgame(){
        title = "TicTaK"
        moves = ["","","","","","","","","","","","","","","","","","","","","","","","",""]
        UserDefaults.standard.set(0, forKey: "highscore")
        highscore = 0
        score = 100
        realscore = 0
        playSound(sound: "allinpushchips", type: "mp3")
    }
    
    //Continue play function
    func continueplay(){
        moves = ["","","","","","","","","","","","","","","","","","","","","","","","",""]
        title = "TicTaK"
    }
    
    func checkWinner(list: [String], player: String) -> Bool {
        let winningSequences = [        //winning direction
            // Diagonals
            [ 0, 6, 12, 18, 24], [ 4, 8, 12, 16, 20 ],
            // Vertical 5 rows
            [ 0, 5, 10, 15, 20 ], [ 1, 6, 11, 16, 21 ], [ 2, 7, 12, 17, 22 ], [ 3, 8, 13, 18, 23 ], [ 4, 9, 14, 19, 24],
            // Horizontal 5 rows
            [ 0, 1, 2, 3, 4 ], [ 5, 6, 7, 8, 9 ], [ 10, 11, 12, 13, 14 ], [ 15, 16, 17, 18, 19 ], [ 20, 21, 22, 23, 24 ],
        ]
        
        
        for sequence in winningSequences {
            var matches = 0
            for match in sequence {
                if list[match] == player {
                    matches += 1
                    //condition to determine who won and lose
                    if matches == 5 {
                        if (player == "X"){
                            print("\(name) has won!")
                            playerWins()
                            if (realscore > 0 && score >= highscore){
                                newHighScore()
                                playSound(sound: "winning", type: "mp3")
                            }
                            return true
                        }
                        if (player == "O" && realscore > 0){
                            print("You lose")
                            playSound(sound: "losing", type: "mp3")
                            playerLoses()
                            return true
                        }
                        //if score is negative, the game is over
                        if (player == "O" && realscore <= 0){
                            print("Game over")
                            isGameOver()
                            playSound(sound: "gameover", type: "mp3")
                            return true
                        }
                    }
                    
                }
            }
        }
        return false
    }
}

struct Map3_Previews: PreviewProvider {
    static var previews: some View {
        Map3()
    }
}
