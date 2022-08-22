//
//  MainPageViewModel.swift
//  Pixabay Gallery
//
//  Created by CodergirlTM on 20.08.22.
//

import Foundation

protocol MainPageViewModelProtocol: AnyObject {
    func fetchImageDetails(completion: @escaping ((Result<[PixabayImage], Error>) -> Void))
    
    init(with pixabayImageManager: PixabayImageManager)
}

final class MainPageViewModel: MainPageViewModelProtocol {
    
    private var pixabayImageManager: PixabayImageManager
    
    init(with pixabayImageManager: PixabayImageManager) {
        self.pixabayImageManager = pixabayImageManager
    }
    
    func fetchImageDetails(completion: @escaping ((Result<[PixabayImage], Error>) -> Void)) {
        pixabayImageManager.fetchImageDetails(completion: completion)
    }
}
