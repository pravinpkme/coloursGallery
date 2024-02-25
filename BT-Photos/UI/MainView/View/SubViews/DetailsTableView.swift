//
//  DetailsTableView.swift
//  BT-Photos
//
//  Created by Pravin Kumar on 25/02/24.
//

import Foundation
import UIKit
class DetailsTableView : UITableView, UITableViewDelegate, UITableViewDataSource{
    var controller : MainViewController!
    var photoModel : [PhotoModel]?
    var index: IndexPath!
    
    func setupDetailCellwith(data: [PhotoModel], index: IndexPath){
        self.photoModel  = data
        self.index = index
        self.reloadData()
    }
    
    
    func loadTableView(inController: MainViewController){
        self.controller = inController
        self.delegate = self
        self.dataSource = self
        self.register(UINib(nibName: "ColorThumbnailTableViewCell", bundle: nil), forCellReuseIdentifier: "ColorThumbnailTableViewCell")
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.dequeueReusableCell(withIdentifier: "ColorThumbnailTableViewCell", for: indexPath) as? ColorThumbnailTableViewCell else {
            return UITableViewCell()
        }
        if let thumbUrl = photoModel?[index.row].thumbnailUrl{
            cell.imgThumbnail.downloadImage(from: thumbUrl)
        }
        
        if let title = photoModel?[index.row].title,
           let albumid = photoModel?[indexPath.row].albumId,
           let id = photoModel?[index.row].id {
            cell.title.text = title
            cell.albumidName.text = String(describing: albumid )
            cell.idName.text = String(describing: id )
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
    
    
    
    
}
