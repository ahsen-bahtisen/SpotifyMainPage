//
//  Albums.swift
//  SpotifyMainPage
//
//  Created by Ahsen Bahtışen on 10.10.2022.
//

import Foundation

struct Albums{
    
    var albumId: Int?
    var albumImage: String?
    var albumSinger: String?
    
    init(albumId: Int, albumImage: String, albumSinger: String) {
        self.albumId = albumId
        self.albumImage = albumImage
        self.albumSinger = albumSinger
    }
}
