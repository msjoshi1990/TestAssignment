//
//  SplashVC+TableViewDelegate.swift
//  TestAssignment
//
//  Created by Madhu sudan Joshi on 19/02/22.
//

import Foundation
import  UIKit

// MARK: - TableView
extension SplashVC: UITableViewDelegate, UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSection()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRow(inSection: section)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.configureCell(indexPath)
        return cell
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableHearderCell") as? TableHearderCell else {
            fatalError("The dequeued cell is not an instance of TableHearderCell.")
        }
        cell.lblTitle.textColor = .black
        cell.lblTitle.font = UIFont.boldSystemFont(ofSize: 16)
        cell.lblTitle.text = "SECTION " + "\(section + 1)"
        return cell

    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    // MARK: - configureAccountCell
    func configureCell(_ indexPath: IndexPath) -> ContainerTCell {
       
        guard let arrColors = viewModel.dataFor(indexPath: indexPath) as? [UIColor] else {
            fatalError("The dequeued data is not an instance of Color.")
        }

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ContainerTCell", for: indexPath) as? ContainerTCell else {
            fatalError("The dequeued cell is not an instance of ContainerTCell.")
        }
        cell.arrColors = arrColors
        return cell
    }
}
