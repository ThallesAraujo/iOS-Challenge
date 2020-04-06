//
//  RequestHandler.swift
//  swift-thalles-base-project
//
//  Created by Thalles Araújo on 16/02/20.
//  Copyright © 2020 Thalles Araújo. All rights reserved.
//

import Foundation
import UIKit
class RequestHandler{
    
    var coordinator: Coordinator?
    
    func handleError(error: String, retryAction: @escaping () -> Void){
        
            if let navigation = self.coordinator?.navigationController{
                if error.lowercased().contains("network"){
                    let vc = VCDisconnected.instantiate()
                    vc.coordinator = self.coordinator
                    navigation.pushViewController(vc, animated: true)
                }else{
                    if let vc = navigation.presentingViewController{
                        vc.showErrorAlert(error: error)
                    }
                }
                
            }
    }
    
}
