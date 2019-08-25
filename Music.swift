//
//  Music.swift
//  Boom Box
//
//  Created by Mihikaa Goenka on 7/27/19.
//  Copyright © 2019 Mihikaa Goenka. All rights reserved.
//

import Foundation

class Music {
    var songName: String
    var albumName: String
    var artistName: String
    var songImage: String
    
    init(songName: String, albumName: String, artistName: String, songImage: String){
        self.songName = songName
        self.albumName = albumName
        self.artistName = artistName
        self.songImage = songImage
    }
}
