//
//  CollectionHolderTableViewCell.swift
//  LabelTest
//
//  Created by AKSHAY SUNDERWANI on 30/08/17.
//  Copyright © 2017 AKSHAY SUNDERWANI. All rights reserved.
//

import UIKit

class CollectionHolderTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionViewCircleHolder: UICollectionView!
    
    func setCollectionViewDataSourceDelegate
        <D: UICollectionViewDataSource & UICollectionViewDelegate>
        (dataSourceDelegate: D, forRow row: Int) {
        
        collectionViewCircleHolder.delegate = dataSourceDelegate
        collectionViewCircleHolder.dataSource = dataSourceDelegate
        collectionViewCircleHolder.tag = row
        collectionViewCircleHolder.reloadData()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
