//
//  PictureCollectionViewCell.swift
//  Buzzebees
//
//  Created by Sahassawat on 13/7/2566 BE.
//

import UIKit
import FSPagerView

class PictureCollectionViewCell: FSPagerViewCell {
    
    static var size: CGSize {
        let screenWidth = UIScreen.main.bounds.width
        let cellWidth = screenWidth - 144
        let cellHeight = CGFloat(230)
        return .init(width: cellWidth, height: cellHeight)
    }
    
    @IBOutlet weak var image: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
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
