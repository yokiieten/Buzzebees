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
        tableView.registerCells(classNames: [SignInTableViewCell.reuseIdentifer])
    }
    
}

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return HomeSectionViewType.allCases.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SignInTableViewCell") as? SignInTableViewCell else { return UITableViewCell() }
        return cell
    }
    
    
}

extension HomeViewController: UITableViewDelegate {
    
}
