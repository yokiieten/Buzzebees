//
//  BannerTableViewCell.swift
//  Buzzebees
//
//  Created by Sahassawat on 13/7/2566 BE.
//

import UIKit
import FSPagerView

class BannerTableViewCell: UITableViewCell {
    
    @IBOutlet weak var pagerView: FSPagerView!
    @IBOutlet private weak var pageControl: FSPageControl!
    private var pictures: [String] = []

    override func awakeFromNib() {
        super.awakeFromNib()
        setupPagerView()
        setupPageControl()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupPagerView() {
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
        pagerView.itemSize = CGSize(width: (UIScreen.main.bounds.width - 128), height: 230)
        pagerView.interitemSpacing = 16
        pagerView.automaticSlidingInterval = 5
        pagerView.transformer = FSPagerViewTransformer(type: .linear)
    }
    
    func setupPageControl() {
        pageControl.numberOfPages = pictures.count
        pageControl.contentHorizontalAlignment = .center
        pageControl.interitemSpacing = 16
        let pinkColor:UIColor = UIColor(red: 0.95, green: 0.52, blue: 0.61, alpha: 1.00)
        pageControl.setStrokeColor(.white, for: .normal)
        pageControl.setStrokeColor(pinkColor, for: .selected)
        pageControl.setFillColor(.white, for: .normal)
        pageControl.setFillColor(pinkColor, for: .selected)
        pageControl.setPath(UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: 10, height: 3), cornerRadius: 1.5), for: .selected)
        pageControl.setPath(UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: 10, height: 3), cornerRadius: 1.5), for: .normal)
    }
    
    func setup(viewModel: BannerViewModel) {
        guard let image = viewModel.image else { return }
        pictures = image
        pageControl.numberOfPages = pictures.count
        pagerView.reloadData()
    }
    
}

extension BannerTableViewCell: FSPagerViewDelegate {
    
    func pagerViewDidEndDecelerating(_ pagerView: FSPagerView) {
        pageControl.currentPage = pagerView.currentIndex
    }
    
    func pagerViewWillEndDragging(_ pagerView: FSPagerView, targetIndex: Int) {
        pageControl.currentPage = targetIndex
    }
    
    func pagerViewDidEndScrollAnimation(_ pagerView: FSPagerView) {
        pageControl.currentPage = pagerView.currentIndex
    }
    
    func pagerView(_ pagerView: FSPagerView, shouldSelectItemAt index: Int) -> Bool {
        return false
    }
}

extension BannerTableViewCell: FSPagerViewDataSource {
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
        let item = pictures[index]
        cell.setupImage(imageUrl: item)
        return cell
    }
    
}

