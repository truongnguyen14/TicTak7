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
 1/ https://www.hackingwithswift.com/read/37/6/wiggling-cards-and-background-music-with-avaudioplayer
 2/ https://stackoverflow.com/questions/34600644/creating-music-instance-in-every-view-controller
*/
//
//  Backgroundmusic.swift
//  Tictac
//
//  Created by Truong, Nguyen Tan on 26/08/2023.
//

import Foundation
import AVFoundation

//Use class here to create a singleton for the music
class Backgroundmusic {
    static let shared = Backgroundmusic()
    var backgroundmusic: AVAudioPlayer!

    //Function to play music in a loop ceating a background music
    func StartBackgroundMusic(backgroundmusicname: String) {
            if let bundle = Bundle.main.url(forResource: backgroundmusicname, withExtension: "mp3") {
            if let audioPlayer = try? AVAudioPlayer(contentsOf: bundle){
                backgroundmusic = audioPlayer
                backgroundmusic.numberOfLoops = -1
                backgroundmusic.play()
            }
        }
    }
    
    //function to stop playing music
    func StopBackgroundMusic() {
        guard let backgroundmusicplayer = backgroundmusic else { return }
        backgroundmusicplayer.stop()
    }
}
