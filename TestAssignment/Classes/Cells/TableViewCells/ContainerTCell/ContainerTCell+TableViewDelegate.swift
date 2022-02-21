//
//  ContainerTCell+TableViewDelegate.swift
//  TestAssignment
//
//  Created by Madhu sudan Joshi on 19/02/22.
//

import Foundation
import UIKit

// MARK: CollectionView Data source
extension ContainerTCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrColors.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DataCCell", for: indexPath) as? DataCCell else {
            fatalError("The dequeued cell is not an instance of DataCCell.")
        }
        cell.imgView.backgroundColor = arrColors[indexPath.item]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let padding: CGFloat = 5
        if (indexPath.item + 1) % 3 == 0 {
            return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.width/2)
        } else {
            return CGSize(width: collectionView.frame.size.width/2 - padding, height: collectionView.frame.size.width/2)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return  10
    }
    // Only this is called on iOS 12 and lower
    override func systemLayoutSizeFitting(_ targetSize: CGSize) -> CGSize {
        self.collectionView?.frame = CGRect(x: 0, y: 0, width: targetSize.width, height: CGFloat(MAXFLOAT))
        self.collectionView.layoutIfNeeded()
        return self.collectionView.collectionViewLayout.collectionViewContentSize
    }

    // Only this is called on iOS 13 beta
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {

        self.collectionView?.frame = CGRect(x: 0, y: 0, width: targetSize.width, height: CGFloat(MAXFLOAT))
        self.collectionView.layoutIfNeeded()
        return self.collectionView.collectionViewLayout.collectionViewContentSize
    }
}
