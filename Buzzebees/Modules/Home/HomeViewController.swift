//
//  HomeViewController.swift
//  Buzzebees
//
//  Created by Sahassawat on 12/7/2566 BE.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var viewModel: HomeViewModel = HomeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    func setupTableView() {
        tableView.registerCells(classNames: [SignInTableViewCell.reuseIdentifer, NewsAndPromotionTableViewCell.reuseIdentifer])
    }
    
}

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return HomeSectionViewType.allCases.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let type = HomeSectionViewType.viewType(by: indexPath.row)
        switch type {
        case .signIn:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "SignInTableViewCell") as? SignInTableViewCell else { return UITableViewCell() }
            return cell
        case .picture: break
        case .newsAndPromotion:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsAndPromotionTableViewCell") as? NewsAndPromotionTableViewCell else { return UITableViewCell() }
            return cell
        case .privileges: break
        case .none: break
        }
       
        return UITableViewCell()
    }
    
    
}

extension HomeViewController: UITableViewDelegate {
    
}
