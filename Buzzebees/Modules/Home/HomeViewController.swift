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
    lazy var navigationTitleImageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        fetchInfoHome()
    }
    
    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
        setupNavigationBar()
  }
    
    func setupNavigationBar() {
        self.navigationTitleImageView.image = UIImage(named: "logo_text.png")
        self.navigationTitleImageView.contentMode = .scaleAspectFill
        
        self.navigationTitleImageView.translatesAutoresizingMaskIntoConstraints = false

        let logoView: UIView = UIView(frame: CGRect(x: 32, y: 0, width: 38 , height: 38))
        let logImgView: UIImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 38, height: 38))
        logImgView.image = UIImage(named: "ic_nearby")
        logoView.addSubview(logImgView)
        let logoBarBtn: UIBarButtonItem = UIBarButtonItem(customView: logoView)
        navigationItem.leftBarButtonItem = logoBarBtn
        if let navC = self.navigationController {
            navC.navigationBar.addSubview(self.navigationTitleImageView)
            self.navigationTitleImageView.centerXAnchor.constraint(equalTo: navC.navigationBar.centerXAnchor).isActive = true
            self.navigationTitleImageView.centerYAnchor.constraint(equalTo: navC.navigationBar.centerYAnchor, constant: 0).isActive = true
//            self.navigationTitleImageView.righ.constraint(equalTo: navC.navigationBar.centerYAnchor, constant: 0).isActive = true
//            self.navigationTitleImageView.widthAnchor.constraint(equalTo: navC.navigationBar.widthAnchor, multiplier: 0.2).isActive = true
//            self.navigationTitleImageView.heightAnchor.constraint(equalTo: navC.navigationBar.widthAnchor, multiplier: 0.088).isActive = true
        }
    }

    
    func setupTableView() {
        tableView.registerCells(classNames: [SignInTableViewCell.reuseIdentifer, BannerTableViewCell.reuseIdentifer, NewsAndPromotionTableViewCell.reuseIdentifer])
    }
    
    func fetchInfoHome() {
        viewModel.fetchInfoHome()
        viewModel.didLoadData = { [weak self] in
            self?.tableView.reloadData()
        }
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
        case .banner:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "BannerTableViewCell") as? BannerTableViewCell else { return UITableViewCell() }
            cell.setup(viewModel: viewModel.bannerViewModel)
            return cell
        case .newsAndPromotion:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsAndPromotionTableViewCell") as? NewsAndPromotionTableViewCell else { return UITableViewCell() }
            cell.setup(viewModel: viewModel.newsAndPromotionViewModel)
            return cell
        case .privileges: break
        case .none: break
        }
       
        return UITableViewCell()
    }
    
    
}

extension HomeViewController: UITableViewDelegate {
    
}
