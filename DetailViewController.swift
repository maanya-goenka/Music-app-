//
//  DetailViewController.swift
//  Boom Box
//
//  Created by Mihikaa Goenka on 7/27/19.
//  Copyright © 2019 Mihikaa Goenka. All rights reserved.
//

import UIKit

protocol ChangeNames {
    func changeSongInfo(row: Int, music: Music)
}

class DetailViewController: UIViewController {
    
    var textFieldSongName: UITextField!
    var textFieldAlbumName: UITextField!
    var textFieldArtistName: UITextField!
    var textViewSongName: UITextView!
    var textViewAlbumName: UITextView!
    var textViewArtistName: UITextView!
    
    var dismissAndSaveButton: UIButton!
    
    var row: Int!
    var music: Music!
    
    var delegate: ChangeNames!
    
    var placeholderTextSongName: String
    var placeholderTextAlbumName: String
    var placeholderTextArtistName: String
    
    init(placeholderTextSongName: String, placeholderTextAlbumName: String, placeholderTextArtistName: String) {
        self.placeholderTextSongName = placeholderTextSongName
        self.placeholderTextAlbumName = placeholderTextAlbumName
        self.placeholderTextArtistName = placeholderTextArtistName
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            title = music.songName
            view.backgroundColor = .black
            
            textViewSongName = UITextView()
            textViewSongName.translatesAutoresizingMaskIntoConstraints = false
            textViewSongName.text = "Song Name: "
            textViewSongName.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
            textViewSongName.backgroundColor = .black
            textViewSongName.textColor = .white
            view.addSubview(textViewSongName)
            
            textViewAlbumName = UITextView()
            textViewAlbumName.translatesAutoresizingMaskIntoConstraints = false
            textViewAlbumName.text = "Album Name: "
            textViewAlbumName.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
            textViewAlbumName.backgroundColor = .black
            textViewAlbumName.textColor = .white
            view.addSubview(textViewAlbumName)
            
            textViewArtistName = UITextView()
            textViewArtistName.translatesAutoresizingMaskIntoConstraints = false
            textViewArtistName.text = "Artist Name: "
            textViewArtistName.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
            textViewArtistName.backgroundColor = .black
            textViewArtistName.textColor = .white
            view.addSubview(textViewArtistName)
            
            textFieldSongName = UITextField()
            textFieldSongName.translatesAutoresizingMaskIntoConstraints = false
            textFieldSongName.borderStyle = .roundedRect
            textFieldSongName.text = placeholderTextSongName
            textFieldSongName.clearsOnBeginEditing = true
            textFieldSongName.backgroundColor = .blue
            textFieldSongName.textAlignment = .left
            view.addSubview(textFieldSongName)
            
            textFieldAlbumName = UITextField()
            textFieldAlbumName.translatesAutoresizingMaskIntoConstraints = false
            textFieldAlbumName.borderStyle = .roundedRect
            textFieldAlbumName.text = placeholderTextAlbumName
            textFieldAlbumName.clearsOnBeginEditing = true
            textFieldAlbumName.backgroundColor = .red
            textFieldAlbumName.textAlignment = .left
            view.addSubview(textFieldAlbumName)
            
            textFieldArtistName = UITextField()
            textFieldArtistName.translatesAutoresizingMaskIntoConstraints = false
            textFieldArtistName.borderStyle = .roundedRect
            textFieldArtistName.text = placeholderTextArtistName
            textFieldArtistName.clearsOnBeginEditing = true
            textFieldArtistName.backgroundColor = .green
            textFieldArtistName.textAlignment = .left
            view.addSubview(textFieldArtistName)
            
            dismissAndSaveButton = UIButton()
            dismissAndSaveButton.translatesAutoresizingMaskIntoConstraints = false
            dismissAndSaveButton.setTitle("DISMISS AND SAVE", for: .normal)
            dismissAndSaveButton.setTitleColor(.red, for: .normal)
            dismissAndSaveButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
            dismissAndSaveButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
            view.addSubview(dismissAndSaveButton)
            
            setupConstraints()
            
        }
    
        
        func setupConstraints(){
            
            NSLayoutConstraint.activate([
                textViewSongName.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
                textViewSongName.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
                textViewSongName.widthAnchor.constraint(equalToConstant: 100),
                textViewSongName.heightAnchor.constraint(equalToConstant: 26)
                ])
            
            NSLayoutConstraint.activate([
                textViewAlbumName.topAnchor.constraint(equalTo: textViewSongName.bottomAnchor, constant: 20),
                textViewAlbumName.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
                textViewAlbumName.widthAnchor.constraint(equalToConstant: 100),
                textViewAlbumName.heightAnchor.constraint(equalToConstant: 26)
                ])
            
            NSLayoutConstraint.activate([
                textViewArtistName.topAnchor.constraint(equalTo: textViewAlbumName.bottomAnchor, constant: 20),
                textViewArtistName.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
                textViewArtistName.widthAnchor.constraint(equalToConstant: 100),
                textViewArtistName.heightAnchor.constraint(equalToConstant: 26)
                ])
            
            NSLayoutConstraint.activate([
                textFieldSongName.leadingAnchor.constraint(equalTo: textViewSongName.trailingAnchor, constant: 10),
                textFieldSongName.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
                textFieldSongName.heightAnchor.constraint(equalToConstant: 25),
                textFieldSongName.centerYAnchor.constraint(equalTo: textViewSongName.centerYAnchor)
                ])
            
            NSLayoutConstraint.activate([
                textFieldAlbumName.centerYAnchor.constraint(equalTo: textViewAlbumName.centerYAnchor),
                textFieldAlbumName.leadingAnchor.constraint(equalTo: textViewAlbumName.trailingAnchor, constant: 10),
                textFieldAlbumName.heightAnchor.constraint(equalToConstant: 25),
                textFieldAlbumName.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
                ])
            
            NSLayoutConstraint.activate([
                textFieldArtistName.centerYAnchor.constraint(equalTo: textViewArtistName.centerYAnchor),
                textFieldArtistName.leadingAnchor.constraint(equalTo: textViewArtistName.trailingAnchor, constant: 10),
                textFieldArtistName.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
                textFieldArtistName.heightAnchor.constraint(equalToConstant: 25)
                ])
            
            NSLayoutConstraint.activate([
                dismissAndSaveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                dismissAndSaveButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150),
                dismissAndSaveButton.heightAnchor.constraint(equalToConstant: 20)
                ])
        }
        
        @objc func buttonPressed(){
            let songName = textFieldSongName.text
            let albumName = textFieldAlbumName.text
            let artistName = textFieldArtistName.text
            if let actualSongName = songName, actualSongName != "" {
                music.songName = actualSongName
            }
            if let actualAlbumName = albumName, actualAlbumName != "" {
                music.albumName = actualAlbumName
                }
            if let actualArtistName = artistName, actualArtistName != "" {
                music.artistName = actualArtistName
                }
                delegate?.changeSongInfo(row: row, music: music)
            dismiss(animated: true, completion: nil)
        }
}

        

