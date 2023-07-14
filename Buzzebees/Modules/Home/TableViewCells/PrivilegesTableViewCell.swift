//
//  PrivilegesTableViewCell.swift
//  Buzzebees
//
//  Created by Sahassawat on 14/7/2566 BE.
//

import UIKit

class PrivilegesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(viewModel: PrivilegesViewModel) {
        titleLabel.text = viewModel.title
//        guard let image = viewModel.image else { return }
    }
    
}
