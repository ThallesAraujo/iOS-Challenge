//
//  CustomButton.swift
//  iOS-Challenge
//
//  Created by Thalles Araújo on 04/04/20.
//  Copyright © 2020 Thalles Araújo. All rights reserved.
//

import UIKit

@IBDesignable class CustomButton: UIButton {
    
    @IBInspectable var borderRadius: CGFloat = 10 {
        didSet{
            self.layer.cornerRadius = self.borderRadius
        }
    }
    

}
