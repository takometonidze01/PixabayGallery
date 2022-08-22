//
//  UIViewController+Extension.swift
//  Pixabay Gallery
//
//  Created by CodergirlTM on 20.08.22.
//

import UIKit

@nonobjc extension UIViewController {
    
    func push(_ vc: UIViewController) {
        navigationController?.pushViewController(vc, animated: true)
        }
}
