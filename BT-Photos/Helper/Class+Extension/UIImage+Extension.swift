//
//  downloadImage.swift
//  BT-Photos
//
//  Created by Pravin Kumar on 24/02/24.
//

import Foundation
import Alamofire


extension UIImageView {
    // MARK: -Download Image
    func downloadImage(from urlString: String) {
        guard let url = URL(string: urlString) else { return }

        AF.request(url).responseData { response in
            switch response.result {
            case .success(let data):
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.image = image
                    }
                } else {
                    print("Failed to convert data to image")
                }
            case .failure(let error):
                print("Error downloading image: \(error.localizedDescription)")
            }
        }
    }
}

