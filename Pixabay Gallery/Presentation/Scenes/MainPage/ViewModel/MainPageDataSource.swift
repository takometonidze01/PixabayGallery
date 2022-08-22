//
//  MainPageDataSource.swift
//  Pixabay Gallery
//
//  Created by CodergirlTM on 19.08.22.
//

import UIKit

class MainPageDataSource: NSObject, UITableViewDataSource {
    
    private var tableView: UITableView!
    private var viewModel: MainPageViewModelProtocol!
    private var pixabayImageList = [PixabayImage]()
    private var viewController: UIViewController!
    
    init(with tableView: UITableView, viewModel: MainPageViewModelProtocol, viewController: UIViewController) {
        super.init()
        
        self.tableView = tableView
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.viewModel = viewModel
        self.viewController = viewController
    }
    
    func refresh() {
        viewModel.fetchImageDetails { [weak self] result in
            switch result {
                case .success(let pixabayImageList):
                    self?.pixabayImageList = pixabayImageList
                    
                    DispatchQueue.main.async {
                        self?.tableView.reloadData()
                    }
                case .failure(let err):
                    print(err)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pixabayImageList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.deque(MainCell.self, for: indexPath)
        cell.configure(with: pixabayImageList[indexPath.row])
        return cell
    }
}

extension MainPageDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        let vc = DetailsViewController(pixabayImage: self.pixabayImageList[indexPath.row])
        viewController.push(vc)
    }
}

