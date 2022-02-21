//
//  Button.swift
//  Dhiru Starter
//
//  Created by Dhiru on 8/7/19.
//  Copyright © 2019 Dhiru. All rights reserved.
//

import UIKit

class Button: UIButton {
    @IBInspectable open var gradientFrom: UIColor = UIColor.gradientStart {
        didSet {
            self.setNeedsLayout()
        }
    }
    //UIColor.gradientEnd
    @IBInspectable open var gradientTo: UIColor = UIColor.gradientStart {
        didSet {
            self.setNeedsLayout()
        }
    }
    @IBInspectable open var titleColor: UIColor =  UIColor.white {
        didSet {
            self.setNeedsLayout()
        }
    }
    @IBInspectable open var isBorderEnabled: Bool = false {
        didSet {
            self.setNeedsLayout()
            titleColor = isBorderEnabled ? gradientFrom : .white
        }
    }
    @IBInspectable open var isShadowEnabled: Bool = true {
        didSet {
            self.setNeedsLayout()
        }
    }
    @IBInspectable open var isRounded: Bool = true {
        didSet {
            self.setNeedsLayout()
        }
    }
    @IBInspectable  var borderColor: UIColor =  UIColor.gradientStart
    //Shadow
    @IBInspectable var shadowOffsetWidth: Int = 0
    @IBInspectable var shadowOffsetHeight: Int = 3
    @IBInspectable var shadowColor: UIColor? = UIColor.black
    @IBInspectable var shadowOpacity: Float = 0.2
    @IBInspectable var cornerRadius: CGFloat = 5.0 {
        didSet {
            self.setNeedsLayout()
        }
        //        get {
        //            return layer.cornerRadius
        //        }
        //        set {
        //            layer.cornerRadius = newValue
        //        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // addColors()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        //addColors()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    func addColors() {
        self.layer.sublayers?.forEach { if $0.name == "dk_grdient_layer" { $0.removeFromSuperlayer() } }
        let roundedRadius = self.isRounded ? self.frame.height/2 : self.cornerRadius
        var colors: [CGColor] = []

        if self.isEnabled {
            colors = [gradientFrom.cgColor, gradientTo.cgColor]
        } else {
            colors = [gradientFrom.withAlphaComponent(0.7).cgColor, gradientTo.withAlphaComponent(0.7).cgColor]
        }

        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.name = "dk_grdient_layer"
        gradient.frame = self.bounds
        //gradient.cornerRadius = self.frame.height/2
        gradient.cornerRadius = roundedRadius
        gradient.masksToBounds = true
        gradient.colors = colors //.map { $0.cgColor }
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        //gradient.locations = [0.0, 0.5]
        self.layer.insertSublayer(gradient, at: 0)
        self.clipsToBounds = true
    }

    func addShadow() {
        let roundedRadius = self.isRounded ? self.frame.height/2 : self.cornerRadius
        layer.cornerRadius = roundedRadius

        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: roundedRadius)
        layer.masksToBounds = false
        layer.shadowColor = shadowColor?.cgColor
        self.layer.shadowOpacity = 1.0
        layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight)
        layer.shadowOpacity = shadowOpacity
        layer.shadowPath = shadowPath.cgPath
    }
    override func draw(_ rect: CGRect) {
    }
    override public func layoutSubviews() {
        super.layoutSubviews()
        let roundedRadius = self.isRounded ? self.frame.height/2 : self.cornerRadius
        if isBorderEnabled {
            self.layer.sublayers?.forEach { if $0.name == "dk_grdient_layer" {$0.removeFromSuperlayer()} }
            self.layer.masksToBounds = true
            self.layer.borderColor = self.isEnabled ? self.borderColor.cgColor : self.borderColor.withAlphaComponent(0.7).cgColor
            self.layer.borderWidth = 1
            self.layer.shadowOpacity = 0.0
            self.backgroundColor = .clear
            self.layer.cornerRadius = roundedRadius
            self.setTitleColor(self.titleColor, for: .normal)
            self.tintColor = self.titleColor
        } else {
            setTitleColor(titleColor, for: .normal)
            self.tintColor = titleColor
            self.backgroundColor = .clear
            self.layer.borderWidth = 0
            addColors()
            if isShadowEnabled {
                self.addShadow()
            } else {
                self.layer.shadowOpacity = 0.0
            }
        }
    }
}
class ButtonConfig {
    var title: String?
    var titleColor: UIColor = UIColor.white
    var icon: UIImage?
    //isSelected
    var isSelected: Bool = false
    var isEnabled: Bool = true
    ///SELECTED STATE
    var selectedTitle: String?
    var selectedIcon: UIImage?
    var gradientFrom: UIColor = UIColor.gradientStart
    var gradientTo: UIColor =  UIColor.gradientStart //UIColor.gradientEnd
    var isShadowEnabled: Bool = true
    var isBorderEnabled: Bool = false
    var borderColor: UIColor?
    var backgroundColor: UIColor?
    var font: UIFont?
    var isUserIntractionEnabled: Bool = true
    // Handling Multiple Actions on Taps
//    var actionIdentifire: ActionIdentifire = .none
    //Corner Radius
    var cornerRadius: CGFloat?
    var isRound: Bool = true
    init(title: String? = nil,
         titleColor: UIColor = UIColor.white,
         icon: UIImage? = nil,
         isSelected: Bool = false,
         isEnabled: Bool = true,
         selectedTitle: String? = nil,
         selectedIcon: UIImage? = nil,
         gradientFrom: UIColor = UIColor.adaniBlueColor,
         gradientTo: UIColor = UIColor.adaniBlueColor,
         isShadowEnabled: Bool = true,
         isBorderEnabled: Bool = false,
         borderColor: UIColor? = nil,
         backgroundColor: UIColor? = nil,
         isUserIntractionEnabled: Bool = true,
//         actionIdentifire: ActionIdentifire = .none,
         cornerRadius: CGFloat? = nil, isRound: Bool = true,
         font: UIFont? = nil) {
        self.title = title
        self.titleColor = titleColor
        self.icon = icon
        self.isSelected = isSelected
        self.isEnabled = isEnabled
        self.selectedTitle = selectedTitle
        self.selectedIcon = selectedIcon
        self.gradientFrom = gradientFrom
        self.gradientTo = gradientTo
        self.isShadowEnabled = isShadowEnabled
        self.isBorderEnabled = isBorderEnabled
        self.borderColor = borderColor
        self.backgroundColor = backgroundColor
        self.isUserIntractionEnabled = isUserIntractionEnabled
//        self.actionIdentifire = actionIdentifire
        self.cornerRadius = cornerRadius
        self.isRound = isRound
        self.font = font
    }

    func bindButton(button: UIButton) {
        ///********* ANY BUTTON  SETUP *******

        ///Title Label Setup
        //        button.titleLabel?.numberOfLines = 0
        //        button.titleLabel?.textAlignment = .center

        button.setTitle(self.title, for: .normal)
        if let title1 = self.selectedTitle {
            button.setTitle("  " + title1 + "  ⠀", for: .selected)
        } else {
            button.setTitle("  ", for: .selected)
        }
        if let font = self.font {
            button.titleLabel?.font = font //.fontMedium(ofSize: 16.0)
        }
        ///icons Setup
        //         if let icon = self.icon
        //         {
        button.setImage(icon, for: .normal)
        //        }
        if let icon = self.selectedIcon {
            button.setImage(icon, for: .selected)
        }
        button.isSelected = self.isSelected
        button.isEnabled = self.isEnabled
        button.isUserInteractionEnabled = self.isUserIntractionEnabled

        ///********* CUSTOM BUTTON  SETUP  *******
        if let btn  = button as? Button {
            btn.isBorderEnabled = self.isBorderEnabled

            if let bgClr = self.backgroundColor {
                btn.gradientFrom = bgClr
                btn.gradientTo = bgClr
            } else {
                btn.gradientFrom = gradientFrom
                btn.gradientTo = gradientTo
            }
            btn.titleColor = titleColor
            btn.isShadowEnabled = isShadowEnabled
            if let value  = self.cornerRadius {
                btn.cornerRadius =  value
            }
            btn.isRounded = self.isRound
            //btn.isEnabled = self.isEnabled
        }
    }
}
