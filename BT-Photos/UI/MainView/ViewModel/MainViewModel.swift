// MainViewModel.swift

import Foundation

class MainViewModel {

    var photoCount: Int = 1 {
        didSet {
            photoCount = max(1, min(100, photoCount))
        }
    }
    
    var isSidePanelOpen: Bool = false
    var photoModel: [PhotoModel]?
    let networkManager = NetworkManager()

    func makeAPICall(for count: Int, completion: @escaping (Result<[PhotoModel], Error>) -> Void) {
        networkManager.getPhotos(albumId: count) { result in
            switch result {
            case .success(let photosData):
                self.photoModel = photosData
                completion(.success(photosData))
            case .failure(let error):
                completion(.failure(error))
                
            }
        }
    }
}
