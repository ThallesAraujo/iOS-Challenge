//
//  DoubleExtension.swift
//  iOS-Challenge
//
//  Created by Thalles Araújo on 05/04/20.
//  Copyright © 2020 Thalles Araújo. All rights reserved.
//

import Foundation
extension Double{
    
    public var formatCurrency: String {
        return format(currencySymbol: "$ ")
    }
    
    struct Number {
        static let formatter = NumberFormatter()
    }
    
    public func format(currencySymbol:String = "") -> String {
        Number.formatter.numberStyle = NumberFormatter.Style.currency
        Number.formatter.locale = Locale(identifier: "en_US")
        Number.formatter.currencySymbol = currencySymbol
        Number.formatter.minimumFractionDigits = 2
        Number.formatter.maximumFractionDigits = 2
        let currency: String
        if let floatLiteralSelf = Number.formatter.string(from: NSNumber(floatLiteral:self)) {
            currency = floatLiteralSelf
        } else {
            currency = ""
        }
        return currency
        
    }
    
}
