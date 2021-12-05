//
//  HomeCollectionViewController.swift
//  Unsplash
//
//  Created by Lakhwinder Singh on 2021-12-04.
//

import UIKit

class HomeCollectionViewController: UICollectionViewController {
    
    // MARK: - Adapters
    private var splashListAdapter: SplashListAdapter?

    var splashArray: [Splash] {
        return SplashStore.shared.splashArray
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        initListAdapter()
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        if let layout = collectionView.collectionViewLayout as? SplashLayout {
            layout.prepareElements(collectionView)
            layout.invalidateLayout()
            collectionView.layoutIfNeeded()
        }
    }
}

// MARK: - Handle binding and setup
extension HomeCollectionViewController {
    
    // MARK: - Initialize list adapter and setup props
    private func initListAdapter() {
        let reuseId = SplashCollectionViewCell.reuseId
        collectionView.accessibilityIdentifier = "HomeCollectionViewController"
        collectionView.register(UINib(nibName: reuseId, bundle: nil), forCellWithReuseIdentifier: reuseId)
        splashListAdapter = SplashListAdapter(delegate: self, identifier: reuseId)
        collectionView.delegate = splashListAdapter
        collectionView.dataSource = splashListAdapter
        
        if let layout = collectionView.collectionViewLayout as? SplashLayout {
            layout.delegate = self
        }
    }
}

// MARK: - Implement list protocols in this view controller
extension HomeCollectionViewController: ListProtocols {

    func fetchData(at index: IndexPath) -> Any? {
        splashArray[index.row]
    }

    var noOfSections: Int {
        return 1
    }

    var noOfRows: Int {
        splashArray.count
    }
}

extension HomeCollectionViewController: SplashLayoutDelegate {
    func cellPadding(in collectionView: UICollectionView) -> CGFloat {
        return 4
    }
    
    func numberOfColumns(in collectionView: UICollectionView) -> Int {
        switch UIDevice.current.orientation {
        case .landscapeLeft, .landscapeRight:
            return 3
        default:
            return 1
         }
    }
    
    func collectionView(_ collectionView: UICollectionView, aspectRatioAtIndexPath indexPath: IndexPath) -> CGFloat {
        return splashArray[indexPath.row].aspectRatio
    }
}
