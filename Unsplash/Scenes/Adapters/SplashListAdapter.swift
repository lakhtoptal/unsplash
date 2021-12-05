//
//  SplashListAdapter.swift
//  Unsplash
//
//  Created by Lakhwinder Singh on 2021-12-04.
//

import UIKit

/**
 Class to show list of list of Splash
 */
class SplashListAdapter: NSObject {

    private var delegate: ListProtocols
    private let cellIdentifier: String

    init(delegate: ListProtocols, identifier: String) {
        self.delegate = delegate
        cellIdentifier = identifier
    }
}

/**
 Extension for confirm UICollectionView protocols
 */
private typealias SplashList = SplashListAdapter
extension SplashList: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return delegate.noOfSections
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return delegate.noOfRows
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? SplashCollectionViewCell else {
            fatalError("Cell name with '\(cellIdentifier)' not exist")
        }
    
        if let model = delegate.fetchData(at: indexPath) as? Splash {
            cell.imageView.image = model.image
        }
        return cell
    }
}
