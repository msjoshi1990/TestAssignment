//
//  TableViewModelBaseProtocol.swift
//

import UIKit

@objc protocol TableViewModelProtocal {
    func numberOfRow(inSection: Int) -> Int
    @objc optional func dataFor(indexPath: IndexPath) -> Any
    @objc optional func numberOfSection() -> Int
    @objc optional func heightFor(indexPath: IndexPath) -> CGFloat
    @objc optional func heightForHeader(section: Int) -> CGFloat
    @objc optional func heightForFooter(section: Int) -> CGFloat
    @objc optional func didSelectRowAt(indexPath: IndexPath)
    @objc optional func dataForHeader(section: Int) -> Any
}
