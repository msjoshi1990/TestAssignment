//
//  BaseViewController.swift
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        bindBaseView()
        // Do any additional setup after loading the view.
    }
    func bindBaseView() {
        self.view.backgroundColor = .white
    }
}
