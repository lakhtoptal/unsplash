//
//  ListProtocols.swift
//  Unsplash
//
//  Created by Lakhwinder Singh on 2021-12-04.
//

import Foundation

/**
 Custom list of protocols for table view/collection view which can be used anywhere in project.
 */
protocol ListProtocols: AnyObject {
    func fetchData(at index: IndexPath) -> Any?
    func didSelectRow(at index: IndexPath)
    var noOfSections: Int { get }
    var noOfRows: Int { get }
}

/**
 Add default values to protocol
 */
extension ListProtocols {
    // number of sections to be 1 by default
    var noOfSections: Int { get { return 1 } }

    // Define here to make it optional
    func didSelectRow(at index: IndexPath) {
        // Do nothing
    }
}
