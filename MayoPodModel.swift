//
//  MayoPodModel.swift
//  MayoPod
//
//  Created by Grayson Wilkins on 2/5/15.
//  Copyright (c) 2015 Mayo Industries. All rights reserved.
//
import Foundation

class MayoPodModel {
    var songList: [Song] = []

}

class Song {
    var songName: String
    var songArtist: String
    var albumName: String
    var composer: String
    var songLength: Int
    var year: String
    
    init(name: String, artist: String, album: String, composer: String, length: Int, year: String) {
        self.songName = name
        self.songArtist = artist
        self.albumName = album
        self.composer = composer
        self.songLength = length
        self.year = year
    }
    
    func getSongName() -> String{
        return self.songName
    }
    
    func getArtistName() -> String{
        return self.songArtist
    }
    
    func getSongYear() -> String{
        return self.year
    }
    
    func printSongs() {
        
    }
    
    func songsByArtist() {
        
    }

}