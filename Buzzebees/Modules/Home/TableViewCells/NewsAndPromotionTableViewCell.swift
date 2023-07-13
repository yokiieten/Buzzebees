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
    private var pictures: [String] = []

    override func awakeFromNib() {
        super.awakeFromNib()
        setupPagerView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupPagerView() {
//        pagerView.registerCells(classNames: [PictureCollectionViewCell.reuseIdentifer])
        pagerView.register(
            UINib(
                nibName: "PictureCollectionViewCell",
                bundle: nil
            ),
            forCellWithReuseIdentifier: "PictureCollectionViewCell"
        )

        pagerView.delegate = self
        pagerView.dataSource = self

        pagerView.isInfinite = true
//        pagerView.itemSize = PictureCollectionViewCell.size
        pagerView.interitemSpacing = 16
        pagerView.automaticSlidingInterval = 5
//        pagerView.transformer = FSPagerViewTransformer(type: .linear)
    }
    
    func setup(viewModel: NewsAndPromotionViewModel) {
        titleLabel.text = viewModel.title
        guard let image = viewModel.image else { return }
        pictures = image
        pagerView.reloadData()
    }
    
}

extension NewsAndPromotionTableViewCell: FSPagerViewDelegate {
    
    func pagerViewDidEndDecelerating(_ pagerView: FSPagerView) {
//        pageControl.currentPage = pagerView.currentIndex
    }
    
    func pagerViewWillEndDragging(_ pagerView: FSPagerView, targetIndex: Int) {
//        pageControl.currentPage = targetIndex
    }
    
    func pagerViewDidEndScrollAnimation(_ pagerView: FSPagerView) {
//        pageControl.currentPage = pagerView.currentIndex
    }
    
    func pagerView(_ pagerView: FSPagerView, shouldSelectItemAt index: Int) -> Bool {
        return false
    }
}

extension NewsAndPromotionTableViewCell: FSPagerViewDataSource {
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        pictures.count
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        guard
            let cell = pagerView.dequeueReusableCell(
                withReuseIdentifier: "PictureCollectionViewCell",
                at: index
            ) as? PictureCollectionViewCell
        else {
            return FSPagerViewCell()
        }
        return cell
    }
    
    func pagerView(_ pagerView: FSPagerView, willDisplay cell: FSPagerViewCell, forItemAt index: Int) {
        guard let cell = cell as? PictureCollectionViewCell else { return }
        let item = pictures[index]
        cell.setupImage(imageUrl: item)
    }
}

