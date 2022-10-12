//
//  PlaylistCollectionViewCell.swift
//  SpotifyMainPage
//
//  Created by Ahsen Bahtışen on 10.10.2022.
//

import UIKit

class PlaylistCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var playlistImage: UIImageView!
    @IBOutlet weak var playlistLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        playlistImage.clipsToBounds = true
        playlistImage.layer.cornerRadius = 5
        playlistImage.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        

    }


}




