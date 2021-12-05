//
//  Splash.swift
//  Unsplash
//
//  Created by Lakhwinder Singh on 2021-12-04.
//

import UIKit

struct Splash {
    var image: UIImage?
    var isFavourite: Bool?
    var tags: [SplashTag]?
    
    var aspectRatio: CGFloat {
        if let size = image?.size {
            return size.height / size.width
        }
        return 1.0
    }
}

struct SplashTag {
    let title: String
}
