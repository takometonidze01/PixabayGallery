//
//  FontHandler.swift
//  Pixabay Gallery
//
//  Created by CodergirlTM on 22.08.22.
//

import UIKit


class FontHandler {
    
    static let SfproTextRegular: String = "SFProText-Regular"
    static let SfproDisplayBold: String = "SFProDisplay-Bold"
    
    static func font(weight: CGFloat, size: CGFloat) -> UIFont {
        var attributesDict = [NSNumber: Any]()
        attributesDict[NSNumber(value: 2003265652)] = weight
        let fontDescriptor = UIFontDescriptor(
            fontAttributes: [
                UIFontDescriptor.AttributeName.name : SfproTextRegular,
                kCTFontVariationAttribute as UIFontDescriptor.AttributeName : attributesDict
            ]
        )
        return UIFont(descriptor: fontDescriptor, size: size)
    }
    
    static var regularTextFont: UIFont {
        return UIFont(name: SfproTextRegular, size: 17.0)!
    }
    
    static var boldTextFont: UIFont {
        return UIFont(name: SfproDisplayBold, size: 30.0)!
    }
    
    static var errorMessageFont: UIFont {
        return UIFont(name: SfproDisplayBold, size: 11.0)!
    }
}
