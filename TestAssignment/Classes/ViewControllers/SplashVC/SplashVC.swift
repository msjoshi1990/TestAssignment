//
//  SplashVC.swift
//  TestAssignment
//
//  Created by Madhu sudan Joshi on 19/02/22.
//

import UIKit

class SplashVC: BaseViewController {
    @IBOutlet weak var tableView: UITableView!

    let viewModel = SplashVM()
    override func viewDidLoad() {
        super.viewDidLoad()

        registerNib()
        tableView.sectionHeaderHeight = UITableView.automaticDimension
        tableView.estimatedSectionHeaderHeight = 5
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
        self.tableView.tableFooterView = UIView()
    }
    func registerNib() {
        let offerNib = UINib(nibName: "ContainerTCell", bundle: nil)
        tableView.register(offerNib, forCellReuseIdentifier: "ContainerTCell")
        let headerNib = UINib(nibName: "TableHearderCell", bundle: nil)
        tableView.register(headerNib, forCellReuseIdentifier: "TableHearderCell")
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        self.tableView.setNeedsLayout()
    }
}
