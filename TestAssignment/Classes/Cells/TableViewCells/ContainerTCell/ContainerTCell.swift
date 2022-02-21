//
//  ContainerTCell.swift
//  TestAssignment
//
//  Created by Madhu sudan Joshi on 19/02/22.
//

import UIKit

class ContainerTCell: UITableViewCell
{
    @IBOutlet weak var collectionView: UICollectionView!
    let padding: CGFloat = 5
    var arrColors:[UIColor] = [] {
        didSet {
            if arrColors.count > 0 {
                self.collectionView.reloadData()
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
        self.setupCollectionViewNib()
        if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
           flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
            flowLayout.scrollDirection = .vertical
        }
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.collectionViewLayout.invalidateLayout()
        self.collectionView.reloadData()
        self.collectionView.setNeedsLayout()
    }
    func setupCollectionViewNib() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        let searchNib = UINib(nibName: "DataCCell", bundle: nil)
        collectionView.register(searchNib, forCellWithReuseIdentifier: "DataCCell")
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
