//
//  DetailsViewController.swift
//  Pixabay Gallery
//
//  Created by CodergirlTM on 17.08.22.
//

import UIKit

class DetailsViewController: UIViewController {

    var detailView = DetailsView()
    private var pixabayImage: PixabayImage?
    
    init(pixabayImage: PixabayImage) {
        self.pixabayImage = pixabayImage
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func loadView() {
        view = detailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let pixabayData = pixabayImage { detailView.showData(pixabayData: pixabayData) }
        view.backgroundColor = .systemBackground
    }
    

    

}
