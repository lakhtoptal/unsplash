//
//  SplashCollectionViewCell.swift
//  Unsplash
//
//  Created by Lakhwinder Singh on 2021-12-04.
//

import UIKit

class SplashCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var favButton: UIButton!
    
    // MARK: - Return class name as a identifier
    static var reuseId: String {
        return String(describing: self)
    }
    
    @IBAction func favButtonClicked(_ sender: UIButton) {
    }
}
