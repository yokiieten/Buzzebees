//
//  NewsAndPromotionTableViewCell.swift
//  Buzzebees
//
//  Created by Sahassawat on 13/7/2566 BE.
//

import UIKit
import FSPagerView

class NewsAndPromotionTableViewCell: UITableViewCell {
    
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak var pagerView: FSPagerView!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupPagerView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupPagerView() {
//        pagerView.register(
//            UINib(
//                nibName: R.nib.heroBannerCollectionViewCell.name,
//                bundle: R.nib.heroBannerCollectionViewCell.bundle
//            ),
//            forCellWithReuseIdentifier: R.reuseIdentifier.heroBannerCollectionViewCell.identifier
//        )
//
//        pagerView.delegate = self
//        pagerView.dataSource = self
//
//        pagerView.isInfinite = true
//        pagerView.itemSize = HeroBannerCollectionViewCell.size
//        pagerView.interitemSpacing = 16
//        pagerView.automaticSlidingInterval = 5
    }
    
    func setup(viewModel: NewsAndPromotionViewModel) {
        titleLabel.text = viewModel.title
        guard let image = viewModel.image else { return }
        print("Data", image)
        
    }
    
}
