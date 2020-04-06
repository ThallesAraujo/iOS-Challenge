//
//  ImageHelper.swift
//  iOS-Challenge
//
//  Created by Thalles Araújo on 04/04/20.
//  Copyright © 2020 Thalles Araújo. All rights reserved.
//

import Foundation
class ImageHelper{
    
    static func getImage(_ path: String) -> String{
        if path != ""{
            return "https://image.tmdb.org/t/p/w500\(path)"
        }else{
            return ""
        }
    }
    
}
