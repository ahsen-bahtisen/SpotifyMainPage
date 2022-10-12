//
//  ViewController.swift
//  SpotifyMainPage
//
//  Created by Ahsen Bahtışen on 10.10.2022.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var playlistList = [Playlist]()
    var albumsList = [Albums]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let p1 = Playlist(playlistId: 1, playlistImage: "bigontheinternet", playlistName: "Big On The Internet")
        let p2 = Playlist(playlistId: 2, playlistImage: "dailylift", playlistName: "Daily Lift")
        let p3 = Playlist(playlistId: 3, playlistImage: "indiegaming", playlistName: "Indie Gaming")
        let p4 = Playlist(playlistId: 4, playlistImage: "justhits", playlistName: "Just Hits")
        let p5 = Playlist(playlistId: 5, playlistImage: "onemorelight", playlistName: "One More Light")
        let p6 = Playlist(playlistId: 6, playlistImage: "yılınŞarkıları2021", playlistName: "Yılın Şarkıları 2021")
        
        playlistList.append(p1)
        playlistList.append(p2)
        playlistList.append(p3)
        playlistList.append(p4)
        playlistList.append(p5)
        playlistList.append(p6)
        
        let a1 = Albums(albumId: 1, albumImage: "arkadacalsin", albumSinger: "Coldplay, LanaDel Rey, Alicia Keys")
        let a2 = Albums(albumId: 2, albumImage: "tbt", albumSinger: "Manga, Yüzyüzeyken Konuşuruz, Duman")
        let a3 = Albums(albumId: 3, albumImage: "trend", albumSinger: "Emir Can İğrek, Nil Karaibrahimgil, Pinhani")
        let a4 = Albums(albumId: 4, albumImage: "altust", albumSinger: "Madrigal, Dolu Kadehi Ters Tut, Kaan Boşnak")
        let a5 = Albums(albumId: 5, albumImage: "yilinsanatcilari", albumSinger: "Cem Adrian, Sezen Aksu, Adamlar")
        let a6 = Albums(albumId: 6, albumImage: "rainyday", albumSinger: "Sam Airey, Anthony Costa, Fenne Lily")
        
        albumsList.append(a1)
        albumsList.append(a2)
        albumsList.append(a3)
        albumsList.append(a4)
        albumsList.append(a5)
        albumsList.append(a6)
        
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
        collectionView.register(UINib(nibName: "PlaylistCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "playlistCell")
        collectionView.register(UINib(nibName: "AlbumsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "albumsCell")
        collectionView.register(UINib(nibName: "SectionTitle", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "sectionTitle")
        
        
        
        
        let tasarim = UICollectionViewFlowLayout()
        
        tasarim.scrollDirection = .vertical
        tasarim.minimumLineSpacing = 10
        tasarim.minimumInteritemSpacing = 10
        tasarim.sectionInset = UIEdgeInsets(top: 10, left: 20, bottom: 20, right: 20)
        
        collectionView.collectionViewLayout = tasarim
        
    }

}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return playlistList.count
        }else if section == 1 {
            return albumsList.count
        }else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0{
            let playlist = playlistList[indexPath.row]
            
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "playlistCell", for: indexPath) as? PlaylistCollectionViewCell{
                cell.playlistImage.image = UIImage(named: playlist.playlistImage!)
                cell.playlistLabel.text = playlist.playlistName
                return cell
            }else{
                return UICollectionViewCell()
            }

        }else if indexPath.section == 1{
            let albums = albumsList[indexPath.row]
            
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "albumsCell", for: indexPath) as? AlbumsCollectionViewCell{
                cell.albumsImage.image = UIImage(named: albums.albumImage!)
                cell.albumLabel.text = albums.albumSinger
                return cell
            }else{
                return UICollectionViewCell()
            }
        }else{
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionView.elementKindSectionHeader{
            if let cell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "sectionTitle", for: indexPath) as? SectionTitle{
                
                switch indexPath.section {
                case 1:
                    cell.sectionTitleLabel.text = " Günlük müzik ihtiyacın"
                    return cell
                default:
                    return cell
                }
                
            }else {
                return UICollectionReusableView()
            }
        }else{
            return UICollectionReusableView()
        }
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let gridLayout = collectionViewLayout as! UICollectionViewFlowLayout
        
        if indexPath.section == 0 {
            let widht = UIScreen.main.bounds.width
            let itemWidht = (widht - gridLayout.sectionInset.left - gridLayout.sectionInset.right - gridLayout.minimumInteritemSpacing) / 2
            return CGSize(width: itemWidht, height: 60)
        }
        else {
            let widht = UIScreen.main.bounds.width
            let itemWidht = (widht - gridLayout.sectionInset.left - gridLayout.sectionInset.right - gridLayout.minimumInteritemSpacing) / 2
            return CGSize(width: itemWidht, height: itemWidht * 1.30)
        }
    }
  
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let gridLayout = collectionViewLayout as! UICollectionViewFlowLayout
        
        if section == 1 {
            let widht = UIScreen.main.bounds.width
            return CGSize(width: widht - gridLayout.sectionInset.left - gridLayout.sectionInset.right, height: 35)
        }
        else {
            return CGSize(width: 0, height: 0)
        }
    }
}
