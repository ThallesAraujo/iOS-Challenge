//
//  Storyboarded.swift
//  swift-thalles-base-project
//
//  Created by Thalles Araújo on 08/02/20.
//  Copyright © 2020 Thalles Araújo. All rights reserved.
//

import UIKit

protocol Storyboarded {

    static func instantiate() -> Self

}

//Avoid direct UIStoryboard instantiation in the Coordinator

extension Storyboarded where Self: UIViewController{
    
    static func instantiate() -> Self {
        // this pulls out "MyApp.MyViewController"
        let fullName = NSStringFromClass(self)
        
        // this splits by the dot and uses everything after, giving "MyViewController"
        let className = fullName.components(separatedBy: ".")[1]
        
        // load our storyboard
        //detalhe: no estado atual, só funciona no main storyboard
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        // instantiate a view controller with that identifier, and force cast as the type that was requested
        return storyboard.instantiateViewController(withIdentifier: className) as! Self
    }
}
