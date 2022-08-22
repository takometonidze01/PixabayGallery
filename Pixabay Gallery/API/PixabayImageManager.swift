//
//  PixabayImageManager.swift
//  Pixabay Gallery
//
//  Created by CodergirlTM on 20.08.22.
//

import Foundation

protocol PixabayImageManagerProtocol: AnyObject {
    func fetchImageDetails(completion: @escaping ((Result<[PixabayImage], Error>) -> Void))
    
    init(with networkManager: NetworkManagerProtocol)
}

final class PixabayImageManager: PixabayImageManagerProtocol {
    
    private var networkManager: NetworkManagerProtocol
    
    init(with networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
    }
    
    func fetchImageDetails(completion: @escaping ((Result<[PixabayImage], Error>) -> Void)) {
        let url = "https://pixabay.com/api/?key=29394614-c07d9b68819824213afe071f8&q=yellow+flowers&image_type=photo"
        networkManager.get(url: url) { (result: Result<PixabayImageResponse, Error>) in
            switch result {
                case .success(let response):
                    completion(.success(response.hits))
                case .failure(let err):
                    completion(.failure(err))
            }
        }
    }
}
