//
//  UIColor.swift
//  Punk
//
//  Created by Aimar Ugarte on 9/3/22.
//

import UIKit

extension UIColor {

    static func hexStringToUIColor(hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }

    static let punkCellBackground = UIColor.hexStringToUIColor(hex:"#F5F5F5")
    static let punkPrimaryText = UIColor.hexStringToUIColor(hex: "#777777")
    static let punkSecondaryText = UIColor.hexStringToUIColor(hex: "#777777")

}
