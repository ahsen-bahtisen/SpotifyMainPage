//
//  Playlist.swift
//  SpotifyMainPage
//
//  Created by Ahsen Bahtışen on 10.10.2022.
//

import Foundation

struct Playlist{
    
    var playlistId:Int?
    var playlistImage: String?
    var playlistName: String?
    
    init(playlistId: Int, playlistImage: String, playlistName: String) {
        self.playlistId = playlistId
        self.playlistImage = playlistImage
        self.playlistName = playlistName
    }
}
