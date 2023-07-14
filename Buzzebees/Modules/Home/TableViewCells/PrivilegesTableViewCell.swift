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
    var detail: [PrivilegesDetailViewModel] = []

    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(viewModel: PrivilegesViewModel) {
        titleLabel.text = viewModel.title
        guard let detail = viewModel.detail else { return }
        self.detail = detail
        collectionView.reloadData()
    }
    
    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.registerCells(classNames: [PrivilegesCollectionViewCell.reuseIdentifer])
    }
    
}

extension PrivilegesTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return detail.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PrivilegesCollectionViewCell.reuseIdentifer, for: indexPath) as? PrivilegesCollectionViewCell else { return UICollectionViewCell() }
        cell.setupDetail(detail: detail[indexPath.row])
        return cell
    }
    
    
}

extension PrivilegesTableViewCell: UICollectionViewDelegate {
    
}

extension PrivilegesTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let padding: CGFloat = 48
        let collectionViewSize = collectionView.frame.size.width - padding
        return CGSize(width: collectionViewSize/2, height: 300)
    }
}
