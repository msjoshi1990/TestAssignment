//
//  SplashVM.swift
//  TestAssignment
//
//  Created by Madhu sudan Joshi on 19/02/22.
//

import Foundation
import UIKit

class SplashVM: BaseViewModel {

    var noOfSections: Int = 0
    var arrNoOfRows: [Int] = []

    override init() {
        super.init()
        self.noOfSections = 10
        self.arrNoOfRows = self.getNoOfRowArray(count: self.noOfSections)
    }
    func getNoOfRowArray(count: Int) -> [Int] {
        
        var arrRows: [Int] = []
        for _ in 0..<count {
            arrRows.append(Int.random(in: 5..<10))
        }
        return arrRows
    }
    func getRandomColorsArray(count: Int) -> [UIColor] {
        
        var arrColors: [UIColor] = []
        for _ in 0..<count {
            arrColors.append(UIColor.random)
        }
        return arrColors
    }
}

extension SplashVM: TableViewModelProtocal {

    func numberOfSection() -> Int {
        return self.noOfSections
    }
    func numberOfRow(inSection: Int) -> Int {
        return 1
    }
    func dataFor(indexPath: IndexPath) -> Any {
        return self.getRandomColorsArray(count: self.arrNoOfRows[indexPath.section])
    }
}
extension UIColor {

    static var random: UIColor {
        return UIColor(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            alpha: 1.0
        )
    }
}
