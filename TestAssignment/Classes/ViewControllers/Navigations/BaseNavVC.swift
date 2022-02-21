//
//  BaseNavVC.swift
//  TestAssignment
//
//  Created by Dhiraj Kumar on 18/02/20.
//  Copyright © 2020 Q3 Technologies. All rights reserved.
//

import UIKit

class BaseNavVC: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
         self.isNavigationBarHidden = true
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        if #available(iOS 13.0, *) {
            return .darkContent
        } else {
            // Fallback on earlier versions
            return .default
        }
    }

}

extension UINavigationController {

    fileprivate var baseNavigationConroller: BaseNavVC? {
        guard let nav = self as? BaseNavVC else {
            debugPrint("#warning: This naivation doesn't have Belongs to BaseNavVC")
            return nil
        }
        return nav
    }
}
