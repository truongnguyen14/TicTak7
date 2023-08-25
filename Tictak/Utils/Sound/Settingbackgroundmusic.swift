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
//  Settingbackground.swift
//  TicTak
//
//  Created by Truong, Nguyen Tan on 06/09/2023.
//

import Foundation
import AVFoundation

//Use class here to create a singleton for the music
class SettingBackgroundmusic {
    static let shared = SettingBackgroundmusic()
    var settingbackgroundmusic: AVAudioPlayer!

    //Function to play music in a loop ceating a background music
    func StartSettingBackgroundMusic(settingbackgroundmusicname: String) {
            if let bundle = Bundle.main.url(forResource: settingbackgroundmusicname, withExtension: "mp3") {
            if let audioPlayer = try? AVAudioPlayer(contentsOf: bundle){
                settingbackgroundmusic = audioPlayer
                settingbackgroundmusic.numberOfLoops = -1
                settingbackgroundmusic.play()
            }
        }
    }
    
    //function to stop playing music
    func StopSettingBackgroundMusic() {
        guard let settingbackgroundmusicplayer = settingbackgroundmusic else { return }
        settingbackgroundmusicplayer.stop()
    }
}
