//
//  NetworkManager.swift
//  BT-Photos
//
//  Created by Pravin Kumar on 24/02/24.
//

import Foundation
import Alamofire


class NetworkManager {
    let url = URLSource()

    func getPhotos(albumId: Int, completion: @escaping (Result<[PhotoModel], Error>) -> Void) {
        var components = URLComponents()
        components.scheme = URLSource.scheme
        components.host = URLSource.host
        components.path = URLSource.albumPath + "\(albumId)" + URLSource.photoPath

        guard let fullURL = components.url else {
            let error = NSError(domain: "", code: 400, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])
            completion(.failure(error))
            return
        }

        AF.request(fullURL)
            .validate()
            .responseDecodable(of: [PhotoModel].self) { response in
                print(response)
                switch response.result {
                case .success(let photosData):
                    completion(.success(photosData))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
