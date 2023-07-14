//
//  PrivilegesCollectionViewCell.swift
//  Buzzebees
//
//  Created by Sahassawat on 14/7/2566 BE.
//

import UIKit

class PrivilegesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var pointLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupDetail(detail: PrivilegesDetailViewModel) {
        pointLabel.text = "\(detail.point ?? "") Points"
        detailLabel.text = detail.detail
        setupImage(imageUrl: detail.image ?? "")
    }
    
    func setupImage(imageUrl: String) {
        image?.clipsToBounds = false
        image?.contentMode = .scaleAspectFill
        image?.cornerRadius = 5
        image?.shadowColor = .clear
        contentView.layer.shadowColor = UIColor.clear.cgColor
        let imagePath: String = unwrapped(imageUrl, with: "")
        let imageUrl = URL(string: imagePath)
        self.image.setImage(with: imageUrl)
    }
    
}
