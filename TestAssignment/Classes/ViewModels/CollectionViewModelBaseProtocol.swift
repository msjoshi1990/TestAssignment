//
//  CollectionViewModelBaseProtocol.swift
//

import UIKit

@objc protocol CollectionViewModelProtocal {
    func numberOfRow(inSection: Int) -> Int
    func dataFor(indexPath: IndexPath) -> Any
    @objc optional func numberOfSection() -> Int
    @objc optional func sizeFor(indexPath: IndexPath, collectionView: UICollectionView) -> CGSize
}
