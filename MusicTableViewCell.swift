//
//  MusicTableViewCell.swift
//  Boom Box
//
//  Created by Mihikaa Goenka on 7/27/19.
//  Copyright © 2019 Mihikaa Goenka. All rights reserved.
//

import UIKit

class MusicTableViewCell: UITableViewCell {

    var songNameLabel: UILabel!
    var albumNameLabel: UILabel!
    var artistNameLabel: UILabel!
    var songImageView: UIImageView!
    
    let labelHeight: CGFloat = 16
    let songImageWidth: CGFloat = 56
    let songImageHeight: CGFloat = 56
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        songNameLabel = UILabel()
        songNameLabel.translatesAutoresizingMaskIntoConstraints = false
        songNameLabel.font = UIFont.systemFont(ofSize: 14)
        songNameLabel.textColor = .white
        contentView.addSubview(songNameLabel)
        
        albumNameLabel = UILabel()
        albumNameLabel.translatesAutoresizingMaskIntoConstraints = false
        albumNameLabel.font = UIFont.systemFont(ofSize: 12)
        albumNameLabel.textColor = .white
        contentView.addSubview(albumNameLabel)
        
        artistNameLabel = UILabel()
        artistNameLabel.translatesAutoresizingMaskIntoConstraints = false
        artistNameLabel.font = UIFont.systemFont(ofSize: 12)
        artistNameLabel.textColor = .white
        contentView.addSubview(artistNameLabel)
        
        songImageView = UIImageView()
        songImageView.translatesAutoresizingMaskIntoConstraints = false
        songImageView.contentMode = .scaleAspectFit
        contentView.addSubview(songImageView)
        
        
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            songImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            songImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            songImageView.heightAnchor.constraint(equalToConstant: songImageHeight),
            songImageView.widthAnchor.constraint(equalToConstant: songImageWidth)
            ])
        
        NSLayoutConstraint.activate([
            songNameLabel.leadingAnchor.constraint(equalTo: songImageView.trailingAnchor, constant: 6),
            songNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 7),
            songNameLabel.heightAnchor.constraint(equalToConstant: labelHeight)
            ])
        
        NSLayoutConstraint.activate([
            albumNameLabel.leadingAnchor.constraint(equalTo: songNameLabel.leadingAnchor),
            albumNameLabel.topAnchor.constraint(equalTo: songNameLabel.bottomAnchor),
            albumNameLabel.heightAnchor.constraint(equalTo: songNameLabel.heightAnchor)
            ])
        
        NSLayoutConstraint.activate([
            artistNameLabel.leadingAnchor.constraint(equalTo: songNameLabel.leadingAnchor),
            artistNameLabel.topAnchor.constraint(equalTo: albumNameLabel.bottomAnchor),
            artistNameLabel.heightAnchor.constraint(equalTo: songNameLabel.heightAnchor)
            ])
        
    }
    
    func configure(for music: Music) {
        songNameLabel.text = music.songName
        albumNameLabel.text = music.albumName
        artistNameLabel.text = music.artistName
        songImageView.image = UIImage(named: music.songImage)
    }
}

