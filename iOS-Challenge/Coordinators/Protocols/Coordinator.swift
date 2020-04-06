//
//  Coordinator.swift
//  swift-thalles-base-project
//
//  Created by Thalles Araújo on 08/02/20.
//  Copyright © 2020 Thalles Araújo. All rights reserved.
//

import UIKit

protocol Coordinator {
    
    var childCoordinators: [Coordinator] {get set}
    
    var navigationController: UINavigationController {get set}
    
    func start()

}
