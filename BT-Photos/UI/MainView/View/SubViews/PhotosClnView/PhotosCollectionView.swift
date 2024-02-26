//
//  PhotosCollectionView.swift
//  BT-Photos
//
//  Created by Pravin Kumar on 25/02/24.
//

import Foundation
import UIKit

class PhotosCollectionView : UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource{
    
    //var declaration
    var controller : MainViewController!
    var photoModel: [PhotoModel]?
    
    
    //init setup
    func loadCollectionView(inController: MainViewController){
        
        self.controller = inController
        self.delegate = self
        self.dataSource = self
        self.setupCollectionViewLayout()
        self.register(UINib(nibName: "PhotoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PhotoCollectionViewCell")
    }
    
    //Cell UI Setup
    func setupCollectionViewLayout(){
        let flowlayout = UICollectionViewFlowLayout()
        flowlayout.itemSize = CGSize(width: 0.8 * self.bounds.width, height: 0.8 * self.bounds.width)
        flowlayout.minimumInteritemSpacing = 10
        flowlayout.minimumLineSpacing = 10
        flowlayout.scrollDirection = .horizontal
        flowlayout.sectionInset = UIEdgeInsets(top: 0, left: 25, bottom: 0, right: 0)
        self.collectionViewLayout = flowlayout
    }
    
    // MARK: - CollectionView Setup
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoModel?.count ?? 0
    }
    
    
    // MARK: -Setup Cells
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCollectionViewCell", for: indexPath) as? PhotoCollectionViewCell else {return UICollectionViewCell()}
        
        cell.imageView.downloadImage(from: photoModel?[indexPath.row].url ?? "")
        
        return cell
    }
    
    //on tap of cell
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        controller.openSidePanel(for: indexPath)
    }
    
    // MARK: -Animation
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let scaleTransform = CGAffineTransform(scaleX: 0.4, y: 0.4)
        
        cell.contentView.transform = scaleTransform
        cell.contentView.alpha = 0.0
        
        UIView.animate(withDuration: 0.5) {
            cell.contentView.transform = .identity
            cell.contentView.alpha = 1.0
        }
    }
    
}


