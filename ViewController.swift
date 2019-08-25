//
//  ViewController.swift
//  Boom Box
//
//  Created by Mihikaa Goenka on 7/27/19.
//  Copyright © 2019 Mihikaa Goenka. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ChangeNames {

        var tableView: UITableView!
        var songs: [Music]!
    
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            title = "Boom Box"
            view.backgroundColor = .black
            
            createMusic()
            
            tableView = UITableView()
            tableView.translatesAutoresizingMaskIntoConstraints = false
            tableView.dataSource = self
            tableView.delegate = self
            tableView.separatorStyle = .none
            tableView.register(MusicTableViewCell.self, forCellReuseIdentifier: "musicCellReuse")
            tableView.backgroundColor = .black
            view.addSubview(tableView)
            
            setupConstraints()
    }
    
    func createMusic() {
        
            let goFlex = Music(songName: "Go Flex", albumName: "Stoney", artistName: "Post Malone", songImage: "malone.jpg")
            let badGuy = Music(songName: "Bad Guy", albumName: "When we all Fall Asleep, Where do we Go?", artistName: "Billie Eilish", songImage: "eilish.jpeg")
            let calmDown = Music(songName: "You Need to Calm Down", albumName: "Lover", artistName: "Taylor Swift", songImage: "swift.jpeg")
            let theOne = Music(songName: "I'm the One", albumName: "Grateful", artistName: "DJ Khaled", songImage: "khaled.jpg")
            let homicide = Music(songName: "Homicide", albumName: "Confessions of a Dangerous Mind", artistName: "Logic", songImage: "logic.jpeg")
            let isis = Music(songName: "ISIS", albumName: "ADHD", artistName: "Joyner Lucas", songImage: "lucas.jpeg")
            let location = Music(songName: "Location", albumName: "American Teen", artistName: "Khalid", songImage: "khalid.png")
            let feelings = Music(songName: "In my Feelings", albumName: "Scorpion", artistName: "Drake", songImage: "drake.jpeg")
            let whatAboutUs = Music(songName: "What About Us", albumName: "Beautiful Trauma", artistName: "Pink", songImage: "pink.jpeg")
            let malibu = Music(songName: "Malibu", albumName: "Malibu", artistName: "Miley Cyrus", songImage: "cyrus.png")
            let anothersArms = Music(songName: "Another's Arms", albumName: "Ghost Stories", artistName: "Coldplay", songImage: "coldplay.jpeg")
            let like = Music(songName: "That's What I Like", albumName: "24K Magic", artistName: "Bruno Mars", songImage: "mars.jpeg")
            let dontWannaKnow = Music(songName: "Don't Wanna Know", albumName: "Red Pills Blue", artistName: "Maroon 5", songImage: "maroon5.png")
            songs = [goFlex, badGuy, calmDown, theOne, homicide, isis, location, feelings, whatAboutUs, malibu, anothersArms, like, dontWannaKnow]
    }

        
    func setupConstraints() {
            //Setup the constraints for our views
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func changeSongInfo(row: Int, music: Music) {
        songs[row] = music
        tableView.reloadData()
    }
    
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return songs.count
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "musicCellReuse", for: indexPath) as! MusicTableViewCell
            cell.backgroundColor = .black
            let music = songs[indexPath.row]
            cell.configure(for: music)
            cell.selectionStyle = .none
            return cell
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 60
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let music = songs[indexPath.row]
            let dvc = DetailViewController(placeholderTextSongName: music.songName, placeholderTextAlbumName: music.albumName, placeholderTextArtistName: music.artistName)
            dvc.row = indexPath.row
            dvc.music = music
            dvc.delegate = self
            present(dvc, animated: true, completion: nil)
        }
}
