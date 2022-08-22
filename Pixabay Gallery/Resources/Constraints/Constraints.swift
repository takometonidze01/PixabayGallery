//
//  Constraints.swift
//  Pixabay Gallery
//
//  Created by CodergirlTM on 17.08.22.
//

import UIKit

class Constraints {
    
    static let deviceHeight = UIScreen.main.bounds.height
    static let deviceWidth = UIScreen.main.bounds.width
    
    /// width ratio compared to iPhone 13 pro max with width = 428
    static var xCoeff: CGFloat {
        return deviceWidth / 428.0
    }
    
    /// height ratio compared to iPhone 13 pro max with height = 926
    static var yCoeff: CGFloat {
        return deviceHeight / 926.0
    }
    
}
