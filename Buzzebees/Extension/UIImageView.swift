//
//  UIImageView.swift
//  News
//
//  Created by Sahassawat on 20/1/2566 BE.
//

import UIKit
import SDWebImage

extension UIImageView {

    func setImage(with: URL?) {
        self.sd_setImage(with: with)
    }

    func setImageWithPlaceholder(url: URL?, placeholderImage: UIImage?) {
        self.sd_setImage(with: url, placeholderImage: placeholderImage)
    }

}
