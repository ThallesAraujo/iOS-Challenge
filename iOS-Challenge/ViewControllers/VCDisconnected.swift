//
//  VCDisconnected.swift
//  iOS-Challenge
//
//  Created by Thalles Araújo on 04/04/20.
//  Copyright © 2020 Thalles Araújo. All rights reserved.
//

import UIKit

class VCDisconnected: UIViewController, Storyboarded {
    
    
    var coordinator: Coordinator?
    var storyboardName = "General"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    static func instantiate() -> Self {
        let fullName = NSStringFromClass(self)
        let className = fullName.components(separatedBy: ".")[1]
        let storyboard = UIStoryboard(name: "General", bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: className) as! Self
    }
    
    @IBAction func didTouchRetryButton(_ sender: Any) {
        if let coordinator = self.coordinator{
            coordinator.start()
        }
    }

}
