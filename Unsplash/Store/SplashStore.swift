//
//  SplashStore.swift
//  Unsplash
//
//  Created by Lakhwinder Singh on 2021-12-04.
//

import UIKit

class SplashStore {
    static let shared = SplashStore()
    
    var splashArray: [Splash]
    
    init() {
        self.splashArray = Array(0...8).map({Splash.init(image: UIImage.init(named: "photo-\($0 + 1).jpg"))})
    }
}
