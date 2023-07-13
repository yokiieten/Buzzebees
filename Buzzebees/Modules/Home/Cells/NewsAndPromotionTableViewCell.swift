//
//  NewsAndPromotionTableViewCell.swift
//  Buzzebees
//
//  Created by Sahassawat on 13/7/2566 BE.
//

import UIKit

class NewsAndPromotionTableViewCell: UITableViewCell {
    
    @IBOutlet weak private var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(viewModel: NewsAndPromotionViewModel) {
        titleLabel.text = viewModel.title
        guard let image = viewModel.image else { return }
        print("Data", image)
    }
    
}
