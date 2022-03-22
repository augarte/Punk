//
//  File.swift
//  Punk
//
//  Created by Aimar Ugarte on 8/3/22.
//

import Foundation
import UIKit

extension NSObject {
    
    class var typeName: String {
        let name = String(describing: self)
        return name
    }
}

extension Double {
    var clean: String {
       return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}
